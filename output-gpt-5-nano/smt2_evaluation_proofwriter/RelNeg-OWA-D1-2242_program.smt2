; Sorts
(declare-sort Thing 0)

; Constants
(declare-const cow Thing)
(declare-const lion Thing)

; Predicates
(declare-fun green (Thing) Bool)
(declare-fun big (Thing) Bool)
(declare-fun eats (Thing Thing) Bool)
(declare-fun visits (Thing Thing) Bool)
(declare-fun needs (Thing Thing) Bool)
(declare-fun cold (Thing) Bool)
(declare-fun blue (Thing) Bool)
(declare-fun rough (Thing) Bool)

; Knowledge base (facts)
(assert (not (eats cow lion)))
(assert (green cow))
(assert (not (needs cow lion)))
(assert (visits cow lion))
(assert (eats lion cow))
(assert (big lion))
(assert (cold lion))
(assert (green lion))
(assert (needs lion cow))
(assert (not (visits lion cow)))

; Rules
; If the lion is blue and the lion does not need the cow then the lion visits the cow
(assert (=> (and (blue lion) (not (needs lion cow))) (visits lion cow)))
; If something visits the lion and it is not cold then it needs the lion
(assert (forall ((x Thing)) (=> (and (visits x lion) (not (cold x))) (needs x lion))))
; If something is green then it is big
(assert (forall ((x Thing)) (=> (green x) (big x))))
; If something needs the lion then the lion is not green
(assert (forall ((x Thing)) (=> (needs x lion) (not (green lion)))))
; If the lion is rough and the lion does not visit the cow then the cow does not need the lion
(assert (forall ((x Thing)) (=> (and (rough lion) (not (visits lion cow))) (not (needs cow lion)))))
; If something visits the cow and the cow does not need the lion then it eats the lion
(assert (forall ((x Thing)) (=> (and (visits x cow) (not (needs cow lion))) (eats x lion))))

; Test scenario: The cow is big.
(assert (big cow))

; Check satisfiability and provide a model
(check-sat)
(get-model)