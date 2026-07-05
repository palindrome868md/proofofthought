; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun red (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun quiet (Person) Bool)

; Constants
(declare-const anne Person)
(declare-const charlie Person)

; Knowledge base
(assert (red anne))
(assert (young charlie))

; Rules
(assert (forall ((p Person))
  (=> (and (red p) (young p)) (smart p))))
(assert (forall ((p Person))
  (=> (red p) (young p))))
(assert (forall ((p Person))
  (=> (young p) (cold p))))
(assert (forall ((p Person))
  (=> (and (young p) (cold p)) (quiet p))))
(assert (forall ((p Person))
  (=> (and (cold p) (young p)) (red p))))
; Anne-specific implication
(assert (=> (red anne) (cold anne)))

; Test scenario: "Anne is red."
(assert (red anne))

; Check satisfiability and provide a model
(check-sat)
(get-model)