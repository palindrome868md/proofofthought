; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions
(declare-fun eats (Entity Entity) Bool)
(declare-fun is-green (Entity) Bool)
(declare-fun needs (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun is-big (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-rough (Entity) Bool)

; 3. Declare constants
(declare-const cow Entity)
(declare-const lion Entity)

; 4. Assert knowledge base (facts)
(assert (not (eats cow lion)))
(assert (is-green cow))
(assert (not (needs cow lion)))
(assert (visits cow lion))
(assert (eats lion cow))
(assert (is-big lion))
(assert (is-cold lion))
(assert (is-green lion))
(assert (needs lion cow))
(assert (not (visits lion cow)))

; 5. Assert rules
; If the lion is blue and the lion does not need the cow then the lion visits the cow.
(assert (=> (and (is-blue lion) (not (needs lion cow))) (visits lion cow)))

; If something visits the lion and it is not cold then it needs the lion.
(assert (forall ((x Entity)) (=> (and (visits x lion) (not (is-cold x))) (needs x lion))))

; If something is green then it is big.
(assert (forall ((x Entity)) (=> (is-green x) (is-big x))))

; If something needs the lion then the lion is not green.
(assert (forall ((x Entity)) (=> (needs x lion) (not (is-green lion)))))

; If the lion is rough and the lion does not visit the cow then the cow does not need the lion.
(assert (=> (and (is-rough lion) (not (visits lion cow))) (not (needs cow lion))))

; If something visits the cow and the cow does not need the lion then it eats the lion.
(assert (forall ((x Entity)) (=> (and (visits x cow) (not (needs cow lion))) (eats x lion))))

; 6. Verify Question: The cow is big.
; Based on fact (is-green cow) and rule (is-green x => is-big x), this should be sat.
(assert (is-big cow))

; 7. Check satisfiability
(check-sat)
(get-model)