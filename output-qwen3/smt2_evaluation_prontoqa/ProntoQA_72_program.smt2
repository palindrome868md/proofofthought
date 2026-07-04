; Declare Sort
(declare-sort Thing 0)

; Declare Predicates (Functions returning Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-aggressive (Thing) Bool)
(declare-fun is-bright (Thing) Bool)
(declare-fun is-liquid (Thing) Bool)
(declare-fun is-orange (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-fruity (Thing) Bool)
(declare-fun is-sour (Thing) Bool)

; Declare Constant
(declare-const sam Thing)

; Knowledge Base
; 1. Tumpuses are not small.
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-small x)))))
; 2. Tumpuses are yumpuses.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-yumpus x))))
; 3. Every yumpus is aggressive.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-aggressive x))))
; 4. Each yumpus is a wumpus.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-wumpus x))))
; 5. Every wumpus is bright.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-bright x))))
; 6. Each wumpus is a jompus.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-jompus x))))
; 7. Jompuses are not liquid.
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-liquid x)))))
; 8. Every jompus is a vumpus.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-vumpus x))))
; 9. Each vumpus is orange.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-orange x))))
; 10. Every vumpus is an impus.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-impus x))))
; 11. Every impus is not transparent.
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-transparent x)))))
; 12. Each impus is a zumpus.
(assert (forall ((x Thing)) (=> (is-impus x) (is-zumpus x))))
; 13. Every zumpus is fruity.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-fruity x))))
; 14. Every zumpus is a numpus.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-numpus x))))
; 15. Every numpus is sour.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-sour x))))
; 16. Rompuses are not fruity.
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-fruity x)))))
; 17. Numpuses are dumpuses.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-dumpus x))))
; 18. Sam is a wumpus.
(assert (is-wumpus sam))

; Test: Is Sam fruity?
(assert (is-fruity sam))

; Check satisfiability
(check-sat)
(get-model)