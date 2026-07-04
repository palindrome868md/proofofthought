; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun is-red (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-quiet (Person) Bool)

; Declare constants
(declare-const anne Person)
(declare-const charlie Person)

; Knowledge base
; Fact: Anne is red
(assert (is-red anne))

; Fact: Charlie is young
(assert (is-young charlie))

; Rule: All red, young people are smart
(assert (forall ((p Person))
  (=> (and (is-red p) (is-young p))
      (is-smart p))))

; Rule: If someone is young then they are cold
(assert (forall ((p Person))
  (=> (is-young p)
      (is-cold p))))

; Rule: If Anne is red then Anne is cold
(assert (=> (is-red anne)
      (is-cold anne)))

; Rule: All red people are young
(assert (forall ((p Person))
  (=> (is-red p)
      (is-young p))))

; Rule: Young, cold people are quiet
(assert (forall ((p Person))
  (=> (and (is-young p) (is-cold p))
      (is-quiet p))))

; Rule: All cold, young people are red
(assert (forall ((p Person))
  (=> (and (is-cold p) (is-young p))
      (is-red p))))

; Test: Verify "Anne is red"
(assert (is-red anne))

; Check satisfiability
(check-sat)
(get-model)