; Declare sorts
(declare-sort Thing 0)

; Predicates
(declare-fun Reptile (Thing) Bool)
(declare-fun Fur (Thing) Bool)
(declare-fun Snake (Thing) Bool)

; Premises
(assert (forall ((x Thing)) (=> (Reptile x) (not (Fur x))))) ; No reptile has fur
(assert (forall ((x Thing)) (=> (Snake x) (Reptile x))))       ; All snakes are reptiles

; Test statement: Some snake has fur
(assert (exists ((x Thing)) (and (Snake x) (Fur x))))

; Check satisfiability
(check-sat)