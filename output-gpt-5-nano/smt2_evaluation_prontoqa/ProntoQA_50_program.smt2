; Declare sorts
(declare-sort Creature 0)

; Declare predicates (unary relations)
(declare-fun Jompus (Creature) Bool)
(declare-fun Rompus (Creature) Bool)
(declare-fun Dumpus (Creature) Bool)
(declare-fun Wumpus (Creature) Bool)
(declare-fun Impus (Creature) Bool)
(declare-fun Yumpus (Creature) Bool)
(declare-fun Zumpus (Creature) Bool)
(declare-fun Vumpus (Creature) Bool)
(declare-fun Tumpus (Creature) Bool)
(declare-fun Numpus (Creature) Bool)
(declare-fun Happy (Creature) Bool)
(declare-fun Blue (Creature) Bool)
(declare-fun Liquid (Creature) Bool)
(declare-fun Cold (Creature) Bool)
(declare-fun Kind (Creature) Bool)
(declare-fun Bright (Creature) Bool)
(declare-fun Sour (Creature) Bool)
(declare-fun Small (Creature) Bool)

; Declare constants
(declare-const fae Creature)

; Knowledge base
; Jompuses are not blue
(assert (forall ((x Creature))
  (=> (Jompus x) (not (Blue x)))))

; Each rompus is happy
(assert (forall ((x Creature))
  (=> (Rompus x) (Happy x))))

; Rompuses are dumpuses
(assert (forall ((x Creature))
  (=> (Rompus x) (Dumpus x))))

; Dumpuses are not cold
(assert (forall ((x Creature))
  (=> (Dumpus x) (not (Cold x)))))

; Each dumpus is a wumpus
(assert (forall ((x Creature))
  (=> (Dumpus x) (Wumpus x))))

; Each wumpus is liquid
(assert (forall ((x Creature))
  (=> (Wumpus x) (Liquid x))))

; Each wumpus is an impus
(assert (forall ((x Creature))
  (=> (Wumpus x) (Impus x))))

; Each impus is kind
(assert (forall ((x Creature))
  (=> (Impus x) (Kind x))))

; Every impus is a yumpus
(assert (forall ((x Creature))
  (=> (Impus x) (Yumpus x))))

; Each yumpus is bright
(assert (forall ((x Creature))
  (=> (Yumpus x) (Bright x))))

; Yumpuses are zumpuses
(assert (forall ((x Creature))
  (=> (Yumpus x) (Zumpus x))))

; Each zumpus is sour
(assert (forall ((x Creature))
  (=> (Zumpus x) (Sour x))))

; Each zumpus is a vumpus
(assert (forall ((x Creature))
  (=> (Zumpus x) (Vumpus x))))

; Each vumpus is small
(assert (forall ((x Creature))
  (=> (Vumpus x) (Small x))))

; Vumpuses are tumpuses
(assert (forall ((x Creature))
  (=> (Vumpus x) (Tumpus x))))

; Every tumpus is blue
(assert (forall ((x Creature))
  (=> (Tumpus x) (Blue x))))

; Every tumpus is a numpus
(assert (forall ((x Creature))
  (=> (Tumpus x) (Numpus x))))

; Fae is an impus
(assert (Impus fae))

; Test: Is "Fae is not blue" true?
(assert (not (Blue fae)))

; Check satisfiability
(check-sat)