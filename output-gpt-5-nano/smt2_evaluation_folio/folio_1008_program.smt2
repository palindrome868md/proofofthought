; Sorts
(declare-sort Person 0)

; Constants
(declare-const carol Person)

; Predicates (KB)
(declare-fun AttendsWedding (Person) Bool)
(declare-fun GettingMarried (Person) Bool)
(declare-fun KnowsGettingMarried (Person) Bool)
(declare-fun Preteen (Person) Bool)
(declare-fun YoungChild (Person) Bool)
(declare-fun EnjoyMilestone (Person) Bool)
(declare-fun FondLargeGroup (Person) Bool)
(declare-fun Outgoing (Person) Bool)
(declare-fun Spirited (Person) Bool)

; Premise 1: Attending weddings -> getting married or knows getting married
(assert (forall ((p Person))
  (=> (AttendsWedding p)
      (or (GettingMarried p) (KnowsGettingMarried p)))))

; Premise 2: No preteens or young children are getting married or know the people who are getting married
(assert (forall ((p Person))
  (=> (or (Preteen p) (YoungChild p))
      (and (not (GettingMarried p)) (not (KnowsGettingMarried p))))))

; Premise 3: Enjoying milestone events -> attend weddings
(assert (forall ((p Person))
  (=> (EnjoyMilestone p)
      (AttendsWedding p))))

; Premise 4: Fond of large group functions -> Enjoy milestone events
(assert (forall ((p Person))
  (=> (FondLargeGroup p)
      (EnjoyMilestone p))))

; Premise 5: Outgoing and Spirited -> Fond of large group functions
(assert (forall ((p Person))
  (=> (and (Outgoing p) (Spirited p))
      (FondLargeGroup p))))

; Premise 6: If Carol is not (preteen or young child) and attends a wedding, then Carol is not getting married or not knowing getting married
(assert (=> (not (and (or (Preteen carol) (YoungChild carol))
                    (AttendsWedding carol)))
            (and (not (GettingMarried carol))
                 (not (KnowsGettingMarried carol)))))

; Test scenario: Is Carol outgoing and very spirited?
(assert (and (Outgoing carol) (Spirited carol)))

; Check satisfiability and get a model (if any)
(check-sat)
(get-model)