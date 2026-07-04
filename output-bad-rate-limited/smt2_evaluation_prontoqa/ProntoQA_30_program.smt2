; Sorts
(declare-sort Entity 0)

; Predicates for each category
(declare-fun Impus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)

; Additional properties
(declare-fun Bright (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Mean (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Shy (Entity) Bool)

; Constant
(declare-const Fae Entity)

; Knowledge base (facts and rules)
(assert (forall ((x Entity)) (=> (Impus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Mean x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Temperate x)))))
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Transparent x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Shy x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Blue x)))))
(assert (forall ((x Entity)) (=> (Numpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Temperate x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Metallic x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Yumpus x))))
; Fae is a vumpus
(assert (Vumpus Fae))

; Test query: Is Fae temperate? We test the negation to see if it's entailed.
(assert (not (Temperate Fae)))

; Check satisfiability (exactly one check-sat as required)
(check-sat)
(get-model)