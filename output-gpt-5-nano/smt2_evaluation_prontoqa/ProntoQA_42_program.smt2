; Declare sorts
(declare-sort Entity 0)

; Predicates (uninterpreted)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Feisty (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Orange (Entity) Bool)

; Constant
(declare-const wren Entity)

; Knowledge base (rules)
(assert (forall ((x Entity)) (=> (Tumpus x) (Dull x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (not (Sour x)))))
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Feisty x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Cold x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Transparent x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Amenable x)))))
(assert (forall ((x Entity)) (=> (Numpus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Orange x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Rompus x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Earthy x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Impus x) (not (Orange x)))))

; Fact: Wren is a vumpus
(assert (Vumpus wren))

; Test: Wren is not orange
(assert (not (Orange wren)))

; Check satisfiability for the question
(check-sat)
(get-model)