; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-nervous (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-angry (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-metallic (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)

; 3. Declare Constants
(declare-const sally Thing)

; 4. Assert Knowledge Base (Facts and Rules)

; Each rompus is nervous.
(assert (forall ((x Thing)) (=> (is-rompus x) (is-nervous x))))

; Rompuses are jompuses.
(assert (forall ((x Thing)) (=> (is-rompus x) (is-jompus x))))

; Jompuses are angry.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-angry x))))

; Jompuses are tumpuses.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-tumpus x))))

; Tumpuses are earthy.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-earthy x))))

; Every tumpus is a numpus.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-numpus x))))

; Each numpus is not cold.
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-cold x)))))

; Each numpus is an impus.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-impus x))))

; Dumpuses are metallic.
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-metallic x))))

; Impuses are dull.
(assert (forall ((x Thing)) (=> (is-impus x) (is-dull x))))

; Each impus is a zumpus.
(assert (forall ((x Thing)) (=> (is-impus x) (is-zumpus x))))

; Zumpuses are not opaque.
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-opaque x)))))

; Zumpuses are wumpuses.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-wumpus x))))

; Every wumpus is blue.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-blue x))))

; Wumpuses are vumpuses.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-vumpus x))))

; Every vumpus is not metallic.
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-metallic x)))))

; Every vumpus is a yumpus.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-yumpus x))))

; Sally is a numpus.
(assert (is-numpus sally))

; 5. Verification
; Question: Is the following statement true or false? Sally is not metallic.
; We assert the statement "Sally is not metallic" to test its truth.
(assert (not (is-metallic sally)))

; 6. Check Satisfiability
(check-sat)
(get-model)