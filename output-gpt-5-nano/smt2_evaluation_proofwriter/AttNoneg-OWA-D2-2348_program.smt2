; Sorts
(declare-sort Person 0)

; Predicates (uninterpreted in this model)
(declare-fun cold (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun blue (Person) Bool)

; Constants
(declare-const dave Person)

; Knowledge base
(assert (cold dave))

; Rules
(assert (forall ((p Person)) (=> (cold p) (quiet p))))
(assert (forall ((p Person)) (=> (quiet p) (green p))))
(assert (forall ((p Person)) (=> (and (cold p) (kind p)) (furry p))))
(assert (forall ((p Person)) (=> (and (kind p) (cold p)) (big p))))
(assert (forall ((p Person)) (=> (and (cold p) (green p)) (blue p))))
(assert (forall ((p Person)) (=> (kind p) (big p))))

; Test: Is Dave quiet?
(assert (quiet dave))

; Check satisfiability and provide a model
(check-sat)
(get-model)