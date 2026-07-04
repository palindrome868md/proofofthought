; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun Tumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Dumpuse (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Red (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Angry (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun NotSweet (Entity) Bool)

; Constants
(declare-const Stella Entity)

; Knowledge base (facts and rules)
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Transparent x)))))
(assert (forall ((x Entity)) (=> (Jompus x) (not (Large x)))))
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Angry x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Impuse x))))
(assert (forall ((x Entity)) (=> (Impuse x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Metallic x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Red x)))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (NotSweet x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Dumpuse x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Red x))))
(assert (Vumpus Stella))  ; Stella is a vumpus

; Test scenario: Stella is not red
(assert (not (Red Stella)))
(check-sat)
(get-model)