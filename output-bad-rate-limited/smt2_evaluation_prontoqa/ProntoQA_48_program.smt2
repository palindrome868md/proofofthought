; Declare sort
(declare-sort Creature 0)

; Declare constants
(declare-const Sam Creature)

; Declare unary predicates (relations as properties)
(declare-fun Tumpus (Creature) Bool)
(declare-fun Yumpus (Creature) Bool)
(declare-fun Numpus (Creature) Bool)
(declare-fun Rompus (Creature) Bool)
(declare-fun Vumpus (Creature) Bool)
(declare-fun Jompus (Creature) Bool)
(declare-fun Impus (Creature) Bool)
(declare-fun Wumpus (Creature) Bool)
(declare-fun Zumpus (Creature) Bool)
(declare-fun Dumpus (Creature) Bool)
(declare-fun Fruity (Creature) Bool)
(declare-fun Nervous (Creature) Bool)
(declare-fun Large (Creature) Bool)
(declare-fun Red (Creature) Bool)
(declare-fun Temperate (Creature) Bool)
(declare-fun Spicy (Creature) Bool)
(declare-fun Metallic (Creature) Bool)
(declare-fun Bright (Creature) Bool)

; Knowledge base: Sam is a vumpus
(assert (Vumpus Sam))

; 1) Tumpuses are fruity
(assert (forall ((x Creature)) (=> (Tumpus x) (Fruity x))))
; 2) Yumpuses are nervous
(assert (forall ((x Creature)) (=> (Yumpus x) (Nervous x))))
; 3) Yumpuses are numpuses
(assert (forall ((x Creature)) (=> (Yumpus x) (Numpus x))))
; 4) Each numpus is large
(assert (forall ((x Creature)) (=> (Numpus x) (Large x))))
; 5) Each numpus is a rompus
(assert (forall ((x Creature)) (=> (Numpus x) (Rompus x))))
; 6) Each rompus is red
(assert (forall ((x Creature)) (=> (Rompus x) (Red x))))
; 7) Rompuses are vumpuses
(assert (forall ((x Creature)) (=> (Rompus x) (Vumpus x))))
; 8) Vumpuses are temperate
(assert (forall ((x Creature)) (=> (Vumpus x) (Temperate x))))
; 9) Each vumpus is a jompus
(assert (forall ((x Creature)) (=> (Vumpus x) (Jompus x))))
; 10) Every jompus is spicy
(assert (forall ((x Creature)) (=> (Jompus x) (Spicy x))))
; 11) Each jompus is an impus
(assert (forall ((x Creature)) (=> (Jompus x) (Impus x))))
; 12) Impuses are not metallic
(assert (forall ((x Creature)) (=> (Impus x) (not (Metallic x)))))
; 13) Impuses are wumpuses
(assert (forall ((x Creature)) (=> (Impus x) (Wumpus x))))
; 14) Each wumpus is bright
(assert (forall ((x Creature)) (=> (Wumpus x) (Bright x))))
; 15) Wumpuses are zumpuses
(assert (forall ((x Creature)) (=> (Wumpus x) (Zumpus x))))
; 16) Zumpuses are not fruity
(assert (forall ((x Creature) (Y Creature)) (=> (Zumpus x) (not (Fruity x)))))

; Query: Is "Sam is not fruity" true?
(assert (not (Fruity Sam)))

; Check satisfiability to answer the question
(check-sat)
(get-model)