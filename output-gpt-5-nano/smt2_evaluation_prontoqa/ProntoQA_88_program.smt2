; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const wren Entity)

; Declare predicates
(declare-fun Jompus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Aggressive (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Liquid (Entity) Bool)

; Knowledge base (translated statements)
; Wren is a vumpus
(assert (Vumpus wren))

; Jompuses are spicy and jompuses are yumpuses
(assert (forall ((x Entity)) (=> (Jompus x) (Spicy x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Yumpus x))))

; Yumpuses are small and yumpuses are vumpuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Small x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Vumpus x))))

; Vumpuses are dumpuses
(assert (forall ((x Entity)) (=> (Vumpus x) (Dumpus x))))

; Dumpuses are fruity and dumpuses are zumpuses
(assert (forall ((x Entity)) (=> (Dumpus x) (Fruity x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Zumpus x))))

; Zumpuses are aggressive and zumpuses are rompuses
(assert (forall ((x Entity)) (=> (Zumpus x) (Aggressive x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Rompus x))))

; Rompuses are opaque and rompuses are wumpuses
(assert (forall ((x Entity)) (=> (Rompus x) (Opaque x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))

; Wumpuses are liquid and wumpuses are tumpuses
(assert (forall ((x Entity)) (=> (Wumpus x) (Liquid x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Tumpus x))))

; Impus imply not liquid
(assert (forall ((x Entity)) (=> (Impus x) (not (Liquid x)))))

; Test: Is Wren liquid? (one check-sat to directly answer)
(assert (Liquid wren))

; Check satisfiability and get a model
(check-sat)
(get-model)