; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (Predicates)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-shy (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-aggressive (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)

; 3. Declare constants
(declare-const max Thing)

; 4. Assert knowledge base (facts)
; Jompuses are not shy.
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-shy x)))))
; Jompuses are yumpuses.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-yumpus x))))
; Each yumpus is aggressive.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-aggressive x))))
; Each yumpus is a dumpus.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-dumpus x))))
; Dumpuses are not wooden.
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-wooden x)))))
; Dumpuses are wumpuses.
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-wumpus x))))
; Wumpuses are red.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-red x))))
; Every wumpus is an impus.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-impus x))))
; Each impus is opaque.
(assert (forall ((x Thing)) (=> (is-impus x) (is-opaque x))))
; Impuses are tumpuses.
(assert (forall ((x Thing)) (=> (is-impus x) (is-tumpus x))))
; Numpuses are sour.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-sour x))))
; Tumpuses are not sour.
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-sour x)))))
; Tumpuses are vumpuses.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-vumpus x))))
; Vumpuses are earthy.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-earthy x))))
; Every vumpus is a zumpus.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-zumpus x))))
; Zumpuses are small.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-small x))))
; Zumpuses are rompuses.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-rompus x))))

; Fact: Max is a yumpus.
(assert (is-yumpus max))

; 5. Check satisfiability for the question: "Max is sour"
; We assert the statement to test if it is consistent with the KB.
(assert (is-sour max))

(check-sat)
(get-model)