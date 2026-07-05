; Declare sorts
(declare-sort Thing 0)

; Declare predicates
(declare-fun kind (Thing) Bool)
(declare-fun blue (Thing) Bool)
(declare-fun round (Thing) Bool)
(declare-fun rough (Thing) Bool)
(declare-fun young (Thing) Bool)

; Declare constant representing the squirrel
(declare-const squirrel Thing)

; Knowledge base
(assert (kind squirrel))
(assert (forall ((x Thing)) (=> (kind x) (blue x))))
(assert (forall ((x Thing)) (=> (round x) (blue x))))
(assert (forall ((x Thing)) (=> (and (round x) (blue x)) (rough x))))
(assert (forall ((x Thing)) (=> (and (round x) (not (kind x))) (not (young x)))))
(assert (forall ((x Thing)) (=> (and (kind x) (blue x)) (round x))))
(assert (=> (rough squirrel) (round squirrel)))

; Test: The squirrel is not blue
(assert (not (blue squirrel)))

; Check satisfiability (single check)
(check-sat)
(get-model)