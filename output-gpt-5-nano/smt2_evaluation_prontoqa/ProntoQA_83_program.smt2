; Declare a generic entity sort
(declare-sort Entity 0)

; Declare the individual Wren
(declare-const wren Entity)

; Declare unary predicates (relations)
(declare-fun Tumpus    (Entity) Bool)
(declare-fun Impus     (Entity) Bool)
(declare-fun Yumpus    (Entity) Bool)
(declare-fun Zumpus    (Entity) Bool)
(declare-fun Numpus    (Entity) Bool)
(declare-fun Rompus    (Entity) Bool)
(declare-fun Dumpus    (Entity) Bool)
(declare-fun Vumpus    (Entity) Bool)
(declare-fun Wumpus    (Entity) Bool)
(declare-fun Jompus    (Entity) Bool)

; Predicates for properties
(declare-fun Transparent (Entity) Bool)
(declare-fun Cold        (Entity) Bool)
(declare-fun Sour        (Entity) Bool)
(declare-fun NotAmenable (Entity) Bool)
(declare-fun Wooden      (Entity) Bool)
(declare-fun Dull        (Entity) Bool)
(declare-fun Large       (Entity) Bool)
(declare-fun Floral      (Entity) Bool)

; Knowledge base: Wren is an impus
(assert (Impus wren))

; Logical implications representing the given rules
(assert (forall ((x Entity)) (=> (Tumpus x) (Transparent x))))
(assert (forall ((x Entity)) (=> (Impus x) (Cold x))))
(assert (forall ((x Entity)) (=> (Impus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Sour x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (NotAmenable x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Wooden x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (not (Transparent x)))))
(assert (forall ((x Entity)) (=> (Rompus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Dull x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Large x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Floral x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Jompus x))))

; Test scenario: Is Wren transparent? (assert the opposite to test unsatisfiability)
(assert (Transparent wren))

; Only one check-sat to answer the question
(check-sat)