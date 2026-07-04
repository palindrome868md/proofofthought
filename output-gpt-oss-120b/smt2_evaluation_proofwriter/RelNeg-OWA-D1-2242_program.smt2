; Declare the single uninterpreted sort for all objects
(declare-sort Entity 0)

; Unary predicates
(declare-fun is_green (Entity) Bool)
(declare-fun is_big   (Entity) Bool)
(declare-fun is_cold  (Entity) Bool)
(declare-fun is_blue  (Entity) Bool)
(declare-fun is_rough (Entity) Bool)

; Binary predicates
(declare-fun eats   (Entity Entity) Bool)   ; eats(subject, object)
(declare-fun needs  (Entity Entity) Bool)   ; needs(subject, object)
(declare-fun visits (Entity Entity) Bool)   ; visits(subject, object)

; Constants for the two individuals
(declare-const cow  Entity)
(declare-const lion Entity)

; ---------- Knowledge base (facts) ----------
; The cow does not eat the lion.
(assert (not (eats cow lion)))
; The cow is green.
(assert (is_green cow))
; The cow does not need the lion.
(assert (not (needs cow lion)))
; The cow visits the lion.
(assert (visits cow lion))
; The lion eats the cow.
(assert (eats lion cow))
; The lion is big.
(assert (is_big lion))
; The lion is cold.
(assert (is_cold lion))
; The lion is green.
(assert (is_green lion))
; The lion needs the cow.
(assert (needs lion cow))
; The lion does not visit the cow.
(assert (not (visits lion cow)))

; ---------- General rules ----------
; 1. If the lion is blue and the lion does not need the cow then the lion visits the cow.
(assert (=> (and (is_blue lion) (not (needs lion cow)))
            (visits lion cow)))

; 2. If something visits the lion and it is not cold then it needs the lion.
(assert (forall ((x Entity))
        (=> (and (visits x lion) (not (is_cold x)))
            (needs x lion))))

; 3. If something is green then it is big.
(assert (forall ((x Entity))
        (=> (is_green x) (is_big x))))

; 4. If something needs the lion then the lion is not green.
(assert (forall ((x Entity))
        (=> (needs x lion) (not (is_green lion)))))

; 5. If the lion is rough and the lion does not visit the cow then the cow does not need the lion.
(assert (=> (and (is_rough lion) (not (visits lion cow)))
            (not (needs cow lion))))

; 6. If something visits the cow and the cow does not need the lion then it eats the lion.
(assert (forall ((x Entity))
        (=> (and (visits x cow) (not (needs cow lion)))
            (eats x lion))))

; ---------- Question: Is the cow big? ----------
; We assert the statement we are testing.
(assert (is_big cow))

; Check whether the combined knowledge base is consistent.
(check-sat)
(get-model)