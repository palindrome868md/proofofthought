; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare predicates (functions returning Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-aggressive (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-nervous (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)

; 3. Declare constants
(declare-const sally Thing)

; 4. Assert Knowledge Base
; Numpuses are earthy
(assert (forall ((x Thing)) (=> (is-numpus x) (is-earthy x))))
; Numpuses are vumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-vumpus x))))
; Vumpuses are transparent
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-transparent x))))
; Each vumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-tumpus x))))
; Tumpuses are small
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-small x))))
; Tumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dumpus x))))
; Each dumpus is not aggressive
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-aggressive x)))))
; Dumpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-wumpus x))))
; Every wumpus is not wooden
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-wooden x)))))
; Every wumpus is a jompus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-jompus x))))
; Jompuses are not nervous
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-nervous x)))))
; Each jompus is a zumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-zumpus x))))
; Each zumpus is temperate
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-temperate x))))
; Rompuses are wooden
(assert (forall ((x Thing)) (=> (is-rompus x) (is-wooden x))))
; Zumpuses are impuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-impus x))))
; Each impus is blue
(assert (forall ((x Thing)) (=> (is-impus x) (is-blue x))))
; Impuses are yumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-yumpus x))))
; Sally is a numpus
(assert (is-numpus sally))

; 5. Verification
; Question: Is the following statement true or false? Sally is not wooden.
; We assert the statement "Sally is not wooden" to test its truth.
(assert (not (is-wooden sally)))

; Check satisfiability
; Expected: sat (True)
(check-sat)
(get-model)