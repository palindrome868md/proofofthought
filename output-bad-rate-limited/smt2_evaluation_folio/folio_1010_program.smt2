(declare-sort Person 0)

; Predicates
(declare-fun attends-weddings (Person) Bool)
(declare-fun getting-married (Person) Bool)
(declare-fun knows-getting-married (Person) Bool)
(declare-fun enjoys-milestones (Person) Bool)
(declare-fun fond-large-group (Person) Bool)
(declare-fun outgoing (Person) Bool)
(declare-fun spirited (Person) Bool)
(declare-fun is-preteen (Person) Bool)
(declare-fun is-young-child (Person) Bool)

; Constant
(declare-const carol Person)

; Knowledge base

; 1) Attending weddings implies getting married or knowing someone getting married
(assert (forall ((p Person))
  (=> (attends-weddings p)
      (or (getting-married p) (knows-getting-married p)))))

; 2) No preteens or young children are getting married or knowing the people getting married
(assert (forall ((p Person))
  (=> (or (is-preteen p) (is-young-child p))
      (and (not (getting-married p)) (not (knows-getting-married p))))))

; 3) Enjoying celebrating milestones implies attending weddings
(assert (forall ((p Person))
  (=> (enjoys-milestones p)
      (attends-weddings p))))

; 4) Fond of large group functions implies enjoying milestones
(assert (forall ((p Person))
  (=> (fond-large-group p)
      (enjoys-milestones p))))

; 5) Outgoing and spirited implies fond of large group functions
(assert (forall ((p Person))
  (=> (and (outgoing p) (spirited p))
      (fond-large-group p))))

; 6) Carol-specific rule: If Carol is not (preteen/young) and attending a wedding, then
;    Carol is not getting married or knows the people getting married.
(assert (=> (not (and (or (is-preteen carol) (is-young-child carol))
                  (attends-weddings carol)))
            (or (not (getting-married carol)) (knows-getting-married carol))))

; Test statement: Carol neither enjoys celebrating milestones nor is outgoing and spirited
(assert (and (not (enjoys-milestones carol))
             (not (and (outgoing carol) (spirited carol)))))

; Check satisfiability
(check-sat)