; Declare Sorts
(declare-sort Thing 0)

; Declare Functions (Predicates)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-fruity (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-sweet (Thing) Bool)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-brown (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)

; Declare Constants
(declare-const wren Thing)

; Knowledge Base
; 1. Impuses are not fruity.
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-fruity x)))))
; 2. Impuses are wumpuses.
(assert (forall ((x Thing)) (=> (is-impus x) (is-wumpus x))))
; 3. Each wumpus is not temperate.
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (is-temperate x)))))
; 4. Wumpuses are dumpuses.
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-dumpus x))))
; 5. Rompuses are not sweet.
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-sweet x)))))
; 6. Dumpuses are kind.
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-kind x))))
; 7. Dumpuses are zumpuses.
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-zumpus x))))
; 8. Zumpuses are wooden.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-wooden x))))
; 9. Zumpuses are vumpuses.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-vumpus x))))
; 10. Every vumpus is large.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-large x))))
; 11. Vumpuses are yumpuses.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-yumpus x))))
; 12. Yumpuses are transparent.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-transparent x))))
; 13. Yumpuses are numpuses.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-numpus x))))
; 14. Numpuses are brown.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-brown x))))
; 15. Numpuses are tumpuses.
(assert (forall ((x Thing)) (=> (is-numpus x) (is-tumpus x))))
; 16. Tumpuses are sweet.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-sweet x))))
; 17. Tumpuses are jompuses.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-jompus x))))
; 18. Wren is a zumpus.
(assert (is-zumpus wren))

; Test: Is Wren sweet?
(assert (is-sweet wren))

; Check satisfiability
(check-sat)
(get-model)