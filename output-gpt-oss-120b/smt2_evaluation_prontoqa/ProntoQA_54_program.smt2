; Declare the domain sort
(declare-sort Entity 0)

; Unary predicates (properties)
(declare-fun tumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun angry    (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun red      (Entity) Bool)
(declare-fun happy    (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun sweet    (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)

; Individual constant
(declare-const stella Entity)

; Knowledge base
(assert (forall ((x Entity)) (=> (tumpus x) (not (transparent x)))))
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (large x)))))
(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (angry x))))
(assert (forall ((x Entity)) (=> (vumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (red x))))
(assert (forall ((x Entity)) (=> (impus x) (happy x))))
(assert (forall ((x Entity)) (=> (impus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (metallic x))))
(assert (forall ((x Entity)) (=> (zumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (dull x))))
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (not (red x)))))
(assert (forall ((x Entity)) (=> (wumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (not (sweet x)))))
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))

; Fact about Stella
(assert (vumpus stella))

; Test the statement: "Stella is not red"
(assert (not (red stella)))

; Check the query
(check-sat)
(get-model)