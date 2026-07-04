; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-angry (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-bright (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-bitter (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-happy (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)

; 3. Declare constants
(declare-const Stella Thing)

; 4. Assert knowledge base (facts)
; Every tumpus is not angry.
(assert (forall ((x Thing)) (=> (is-tumpus x) (not (is-angry x)))))
; Tumpuses are rompuses.
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-rompus x))))
; Every numpus is not bright.
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-bright x)))))
; Rompuses are not luminous.
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-luminous x)))))
; Rompuses are yumpuses.
(assert (forall ((x Thing)) (=> (is-rompus x) (is-yumpus x))))
; Yumpuses are transparent.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-transparent x))))
; Yumpuses are zumpuses.
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-zumpus x))))
; Each zumpus is not bitter.
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-bitter x)))))
; Zumpuses are impuses.
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-impus x))))
; Impuses are red.
(assert (forall ((x Thing)) (=> (is-impus x) (is-red x))))
; Each impus is a dumpus.
(assert (forall ((x Thing)) (=> (is-impus x) (is-dumpus x))))
; Every dumpus is happy.
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-happy x))))
; Each dumpus is a vumpus.
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-vumpus x))))
; Vumpuses are bright.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-bright x))))
; Every vumpus is a jompus.
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-jompus x))))
; Jompuses are large.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-large x))))
; Each jompus is a wumpus.
(assert (forall ((x Thing)) (=> (is-jompus x) (is-wumpus x))))
; Stella is a yumpus.
(assert (is-yumpus Stella))

; 5. Check satisfiability (Test: Is Stella bright?)
(assert (is-bright Stella))
(check-sat)
(get-model)