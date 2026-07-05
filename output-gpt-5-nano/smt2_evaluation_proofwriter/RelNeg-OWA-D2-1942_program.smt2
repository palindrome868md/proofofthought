; Sorts
(declare-sort Person 0)

; Predicates / Functions
(declare-fun visits (Person Person) Bool)
(declare-fun needs  (Person Person) Bool)
(declare-fun sees   (Person Person) Bool)
(declare-fun rough  (Person) Bool)

; Constants
(declare-const mouse  Person)
(declare-const rabbit Person)

; Knowledge Base

; 1) The mouse visits the rabbit.
(assert (visits mouse rabbit))

; 2) The rabbit needs the mouse.
(assert (needs rabbit mouse))

; 3) If the mouse visits the rabbit then the mouse needs the rabbit.
(assert (=> (visits mouse rabbit) (needs mouse rabbit)))

; 4) If something visits the rabbit and the rabbit sees the mouse then the mouse does not see the rabbit.
(assert (forall ((x Person))
  (=> (and (visits x rabbit) (sees rabbit mouse))
      (not (sees mouse rabbit)))))

; 5) If something needs the rabbit then it is not rough.
(assert (forall ((p Person))
  (=> (needs p rabbit) (not (rough p)))))

; Test: The rabbit does not need the mouse.
(assert (not (needs rabbit mouse)))

; Verification: check satisfiability
(check-sat)