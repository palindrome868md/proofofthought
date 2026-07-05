; Declare sorts
(declare-sort Entity 0)

; Declare predicates (uninterpreted relations)
(declare-fun rompus (Entity) Bool)
(declare-fun orange (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun spicy (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun transparent (Entity) Bool)

; Declare constants
(declare-const Stella Entity)

; Knowledge base
; 1) Every rompus is orange.
(assert (forall ((x Entity)) (=> (rompus x) (orange x))))
; 2) Every rompus is an impus.
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
; 3) Vumpuses are happy.
(assert (forall ((x Entity)) (=> (vumpus x) (happy x))))
; 4) Every impus is spicy.
(assert (forall ((x Entity)) (=> (impus x) (spicy x))))
; 5) Every impus is a wumpus.
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))
; 6) Wumpuses are transparent.
(assert (forall ((x Entity)) (=> (wumpus x) (transparent x))))
; 7) Wumpuses are numpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (numpus x))))
; 8) Every numpus is not kind.
(assert (forall ((x Entity)) (=> (numpus x) (not (kind x)))))
; 9) Numpuses are tumpuses.
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))
; 10) Each tumpus is not bright.
(assert (forall ((x Entity)) (=> (tumpus x) (not (bright x)))))
; 11) Tumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))
; 12) Every yumpus is not liquid.
(assert (forall ((x Entity)) (=> (yumpus x) (not (liquid x)))))
; 13) Yumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (yumpus x) (dumpus x))))
; 14) Each dumpus is not happy.
(assert (forall ((x Entity)) (=> (dumpus x) (not (happy x)))))
; 15) Dumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))
; 16) Every zumpus is earthy.
(assert (forall ((x Entity)) (=> (zumpus x) (earthy x))))
; 17) Each zumpus is a jompus.
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))
; 18) Stella is a wumpus.
(assert (wumpus Stella))

; Test scenario: Is Stella happy?
(assert (happy Stella))

; Check satisfiability and provide a model if possible
(check-sat)
(get-model)