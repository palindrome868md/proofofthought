; Declare sorts
(declare-sort Entity 0)

; Declare unary predicates (relations as predicates)
(declare-fun Rompus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Hot (Entity) Bool)
(declare-fun Orange (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Kind (Entity) Bool)
(declare-fun Shy (Entity) Bool)
(declare-fun Metal (Entity) Bool)

; Declare constants
(declare-const Alex Entity)

; Knowledge base (assertions)
; 1) Every rompus is an impus
(assert (forall ((x Entity)) (=> (Rompus x) (Impus x))))
; 2) Yumpuses are not small
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Small x))))
)
; 3) Impuses are orange
(assert (forall ((x Entity)) (=> (Impus x) (Orange x))))
; 4) Impuses are zumpuses
(assert (forall ((x Entity)) (=> (Impus x) (Zumpus x))))
; 5) Zumpuses are not hot
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Hot x))))
)
; 6) Zumpuses are numpuses
(assert (forall ((x Entity)) (=> (Zumpus x) (Numpus x))))
; 7) Numpuses are metallic
(assert (forall ((x Entity) ()))
  (=> (Numpus x) (Metal x)))
)
; 8) Numpuses are wumpuses
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))
; 9) Every wumpus is not kind
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Kind x))))
)
; 10) Each wumpus is a dumpus
(assert (forall ((x Entity)) (=> (Wumpus x) (Dumpus x))))
; 11) Each dumpus is not bright
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Bright x))))
)
; 12) Every dumpus is a jompus
(assert (forall ((x Entity)) (=> (Dumpus x) (Jompus x))))
; 13) Jompuses are small
(assert (forall ((x Entity) ()))
  (=> (Jompus x) (Small x)))
)
; 14) Jompuses are vumpuses
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))
; 15) Each vumpus is not shy
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Shy x)))))
; 16) Every vumpus is a tumpus
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))
; 17) Alex is a zumpus
(assert (Zumpus Alex))

; Test: Is "Alex is not small" true?
(assert (not (Small Alex)))

; Check satisfiability
(check-sat)
(get-model)