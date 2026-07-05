; Declare sorts
(declare-sort Fruit 0)

; Declare predicates
(declare-fun red (Fruit) Bool)
(declare-fun apple (Fruit) Bool)
(declare-fun vitamin-c (Fruit) Bool)
(declare-fun healthy (Fruit) Bool)
(declare-fun in-ben-yard (Fruit) Bool)
(declare-fun on-warning (Fruit) Bool)

; Declare constants
(declare-const cherry Fruit)

; Knowledge base (premises)
(assert (forall ((x Fruit)) (=> (and (in-ben-yard x) (red x)) (vitamin-c x))))
(assert (forall ((x Fruit)) (=> (and (in-ben-yard x) (apple x)) (red x))))
(assert (forall ((x Fruit)) (=> (and (in-ben-yard x) (vitamin-c x)) (healthy x))))
(assert (forall ((x Fruit)) (=> (and (in-ben-yard x) (healthy x)) (not (on-warning x)))))

; Cherry fact
(assert (in-ben-yard cherry))

; Rule: If cherries are not apples and are not healthy, then they are red
(assert (forall ((x Fruit)) (=> (and (not (apple x)) (not (healthy x))) (red x))))

; Test statement: "The cherries are either on a warning list or are red."
; Negation of the statement to verify entailment
(assert (not (or (on-warning cherry) (red cherry))))

; Check satisfiability for the negation
(check-sat)
(get-model)