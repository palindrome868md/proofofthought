; Declare sorts
(declare-sort Entity 0)

; Declare unary predicates (properties / categories)
(declare-fun rompus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)

; Additional properties used in rules
(declare-fun brown (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun shy (Entity) Bool)

; Declare constants
(declare-const Max Entity)

; Knowledge base (rules)
(assert (forall ((x Entity)) (=> (rompus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (rompus x) (transparent x))))
(assert (forall ((x Entity)) (=> (yumpus x) (earthy x))))
(assert (forall ((x Entity)) (=> (yumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (large x)))))
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (not (brown x)))))
(assert (forall ((x Entity)) (=> (tumpus x) (hot x))))
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (dull x))))
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (bitter x))))
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (shy x)))))
(assert (forall ((x Entity)) (=> (dumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (not (hot x)))))
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))

; Fact: Max is a wumpus
(assert (wumpus Max))

; Test statement: Max is not hot
(assert (not (hot Max)))

; Check satisfiability and produce a model
(check-sat)
(get-model)