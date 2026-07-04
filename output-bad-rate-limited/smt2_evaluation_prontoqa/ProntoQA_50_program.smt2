; Sorts
(declare-sort Entity 0)

; Predicates (uninterpreted for each concept)
(declare-fun Jompus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Kind (Entity) Bool)

; Constants
(declare-const fae Entity)

; Knowledge base (as universal rules)

; 1) Jompuses are not blue
(assert (forall ((x Entity)) (=> (Jompus x) (not (Blue x)))))

; 2) Each rompus is happy
(assert (forall ((x Entity)) (=> (Rompus x) (Happy x))))

; 3) Rompuses are dumpuses
(assert (forall ((x Entity)) (=> (Rompus x) (Dumpus x))))

; 4) Dumpuses are not cold
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Cold x)))))

; 5) Each dumpus is a wumpus
(assert (forall ((x Entity)) (=> (Dumpus x) (Wumpus x))))

; 6) Each wumpus is a liquid
(assert (forall ((x Entity) (=> (Wumpus x) (Liquid x)))))

; 7) Each wumpus is an impus
(assert (forall ((x Entity)) (=> (Wumpus x) (Impus x))))

; 8) Each impus is kind
(assert (forall ((x Entity)) (=> (Impus x) (Kind x))))

; 9) Every impus is a yumpus
(assert (forall ((x Entity) (=> (Impus x) (Yumpus x)))))

; 10) Each yumpus is bright
(assert (forall ((x Entity) (=> (Yumpus x) (Bright x)))))

; 11) Yumpuses are zumpuses
(assert (forall ((x Entity) (=> (Yumpus x) (Zumpus x)))))

; 12) Each zumpus is sour
(assert (forall ((x Entity) (=> (Zumpus x) (Sour x)))))

; 13) Each zumpus is a vumpus
(assert (forall ((x Entity) (=> (Zumpus x) (Vumpus x)))))

; 14) Every vumpus is small
(assert (forall ((x Entity) (=> (Vumpus x) (Small x)))))

; 15) Vumpuses are tumpuses
(assert (forall ((x Entity) (=> (Vumpus x) (Tumpus x)))))

; 16) Every tumpus is blue
(assert (forall ((x Entity) (=> (Tumpus x) (Blue x)))))

; 17) Every tumpus is a numpus
(assert (forall ((x Entity) (=> (Tumpus x) (Numpus x)))))

; 18) Fae is an impus
(assert (Impus fae))

; Test: Is "Fae is not blue" true?
(assert (not (Blue fae)))
(check-sat)