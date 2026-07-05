; Declare sorts
(declare-sort Entity 0)

; Declare predicates
(declare-fun Jompus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Red (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)

; Declare constants
(declare-const polly Entity)

; Knowledge base (facts and rules)

; 1) Jompuses are Rompuses
(assert (forall ((x Entity)) (=> (Jompus x) (Rompus x))))

; 2) Rompuses are not opaque
(assert (forall ((x Entity)) (=> (Rompus x) (not (Opaque x)))))

; 3) Rompuses are Vumpuses
(assert (forall ((x Entity)) (=> (Rompus x) (Vumpus x))))

; 4) Each Vumpus is Red
(assert (forall ((x Entity)) (=> (Vumpus x) (Red x))))

; 5) Each Vumpus is a Numpus
(assert (forall ((x Entity)) (=> (Vumpus x) (Numpus x))))

; 6) Numpuses are Impuses
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))

; 7) Each Impus is Temperate
(assert (forall ((x Entity)) (=> (Impus x) (Temperate x))))

; 8) Each Impus is a Wumpus
(assert (forall ((x Entity)) (=> (Impus x) (Wumpus x))))

; 9) Every Wumpus is Fruity
(assert (forall ((x Entity)) (=> (Wumpus x) (Fruity x))))

; 10) Wumpuses are Yumpuses
(assert (forall ((x Entity)) (=> (Wumpus x) (Yumpus x))))

; 11) Yumpuses are Liquid
(assert (forall ((x Entity)) (=> (Yumpus x) (Liquid x))))

; 12) Yumpuses are Dumpuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Dumpus x))))

; 13) Dumpuses are Small
(assert (forall ((x Entity)) (=> (Dumpus x) (Small x))))

; 14) Dumpuses are Tumpuses
(assert (forall ((x Entity)) (=> (Dumpus x) (Tumpus x))))

; 15) Not Fruity for Zumpuses
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Fruity x)))))

; Polly is a Rompus (given)
(assert (Rompus polly))

; Test: Is Polly fruity? (negation to test entailment)
(assert (not (Fruity polly)))

; Check satisfiability (single check)
(check-sat)