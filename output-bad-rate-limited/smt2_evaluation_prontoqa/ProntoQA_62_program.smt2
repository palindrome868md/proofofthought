; Sorts
(declare-sort Entity 0)

; Predicates (uninterpreted unary predicates)
(declare-fun Zumpus  (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Dumpus  (Entity) Bool)
(declare-fun Large   (Entity) Bool)
(declare-fun Rompus  (Entity) Bool)
(declare-fun Brown   (Entity) Bool)
(declare-fun Vumpus  (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Numpus  (Entity) Bool)
(declare-fun Wumpus  (Entity) Bool)
(declare-fun Floral  (Entity) Bool)
(declare-fun Yumpus  (Entity) Bool)
(declare-fun Tumpus  (Entity) Bool)
(declare-fun Impus   (Entity) Bool)
(declare-fun Bitter  (Entity) Bool)
(declare-fun Bright  (Entity) Bool)

; Constant
(declare-const wren Entity)

; Knowledge base
(assert (forall ((x Entity)) (=> (Zumpus x) (Nervous x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Large x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Brown x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Transparent x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Bitter x)))))
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Floral x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Transparent x)))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Bright x)))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Impus x))))

; Fact: Wren is a Dumpus
(assert (Dumpus wren))

; Test: Is "Wren is not transparent" true?
(assert (not (Transparent wren)))

; Check satisfiability and provide a model
(check-sat)
(get-model)