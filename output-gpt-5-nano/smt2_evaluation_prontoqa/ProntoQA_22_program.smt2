; Sorts
(declare-sort Creature 0)

; Predicates
(declare-fun Wumpus (Creature) Bool)
(declare-fun Yumpus (Creature) Bool)
(declare-fun Tumpus (Creature) Bool)
(declare-fun Rompus (Creature) Bool)
(declare-fun Numpus (Creature) Bool)
(declare-fun Jompus (Creature) Bool)
(declare-fun Zumpus (Creature) Bool)
(declare-fun Sour (Creature) Bool)
(declare-fun Aggressive (Creature) Bool)
(declare-fun Transparent (Creature) Bool)
(declare-fun Vumpus (Creature) Bool)
(declare-fun Wooden (Creature) Bool)
(declare-fun Feisty (Creature) Bool)
(declare-fun Impus (Creature) Bool)

; Constants
(declare-const wren Creature)

; Knowledge base
; Wren is a tumpus
(assert (Tumpus wren))

; Universal rules
(assert (forall ((x Creature)) (=> (Wumpus x) (Yumpus x))))
(assert (forall ((x Creature)) (=> (Wumpus x) (Sour x))))
(assert (forall ((x Creature)) (=> (Yumpus x) (Aggressive x))))
(assert (forall ((x Creature)) (=> (Yumpus x) (Tumpus x))))
(assert (forall ((x Creature)) (=> (Tumpus x) (Transparent x))))
(assert (forall ((x Creature)) (=> (Tumpus x) (Vumpus x))))
(assert (forall ((x Creature)) (=> (Vumpus x) (Wooden x))))
(assert (forall ((x Creature)) (=> (Vumpus x) (Jompus x))))
(assert (forall ((x Creature)) (=> (Impus x) (not (Feisty x)))))
(assert (forall ((x Creature)) (=> (Jompus x) (Large x))))
(assert (forall ((x Creature)) (=> (Jompus x) (Numpus x))))
(assert (forall ((x Creature)) (=> (Numpus x) (Red x))))
(assert (forall ((x Creature)) (=> (Numpus x) (Rompus x))))
(assert (forall ((x Creature)) (=> (Rompus x) (Feisty x))))
(assert (forall ((x Creature)) (=> (Rompus x) (Zumpus x))))

; Query: Wren is not feisty
(assert (not (Feisty wren)))

; Check satisfiability
(check-sat)