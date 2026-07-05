; Sorts
(declare-sort Creature 0)

; Predicates (uninterpreted)
(declare-fun Wumpus (Creature) Bool)
(declare-fun Rompus (Creature) Bool)
(declare-fun Dumpus (Creature) Bool)
(declare-fun Feisty (Creature) Bool)
(declare-fun Dull (Creature) Bool)
(declare-fun Tumpus (Creature) Bool)
(declare-fun Numpus (Creature) Bool)
(declare-fun Zumpus (Creature) Bool)
(declare-fun Vumpus (Creature) Bool)
(declare-fun Impus (Creature) Bool)
(declare-fun Jompus (Creature) Bool)
(declare-fun Yumpus (Creature) Bool)
(declare-fun Aggressive (Creature) Bool)
(declare-fun Opaque (Creature) Bool)
(declare-fun Hot (Creature) Bool)
(declare-fun Large (Creature) Bool)
(declare-fun Blue (Creature) Bool)
(declare-fun Sour (Creature) Bool) ; optional predicate for possible extension

; Constants
(declare-const fae Creature)

; Knowledge base (rules)
(assert (forall ((x Creature)) (=> (Wumpus x) (Rompus x))))
(assert (forall ((x Creature)) (=> (Rompus x) (Dumpus x))))
(assert (forall ((x Creature)) (=> (Rompus x) (Dull x))))
(assert (forall ((x Creature)) (=> (Dumpus x) (Feisty x))))
(assert (forall ((x Creature)) (=> (Dumpus x) (Tumpus x))))
(assert (forall ((x Creature)) (=> (Tumpus x) (Numpus x))))
(assert (forall ((x Creature)) (=> (Numpus x) (Hot x))))
(assert (forall ((x Creature)) (=> (Numpus x) (Zumpus x))))
(assert (forall ((x Creature)) (=> (Zumpus x) (Large x))))
(assert (forall ((x Creature)) (=> (Zumpus x) (Vumpus x))))
(assert (forall ((x Creature)) (=> (Vumpus x) (Blue x))))
(assert (forall ((x Creature)) (=> (Vumpus x) (Impus x))))
(assert (forall ((x Creature)) (=> (Impus x) (not (Aggressive x)))))
(assert (forall ((x Creature)) (=> (Impus x) (Yumpus x))))
; Fae is a Tumpus
(assert (Tumpus fae))

; Query: Is "Fae is not aggressive" true?
(assert (not (Aggressive fae)))

; Check
(check-sat)
(get-model)