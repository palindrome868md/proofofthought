; This program encodes the given knowledge base about Yumpuses, Rompuses, etc.
; and tests whether Sally is small.

; Sort for individuals
(declare-sort Entity 0)

; Constant for the individual in question
(declare-const Sally Entity)

; Predicates representing the properties and classes
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Impus     (Entity) Bool)
(declare-fun Dumpus    (Entity) Bool)
(declare-fun Tumpus    (Entity) Bool)
(declare-fun Wumpus    (Entity) Bool)
(declare-fun Vumpus    (Entity) Bool)
(declare-fun Numpus    (Entity) Bool)
(declare-fun Small     (Entity) Bool)
(declare-fun Orange    (Entity) Bool)
(declare-fun Fruity     (Entity) Bool)
(declare-fun Jompus    (Entity) Bool)
(declare-fun Zumpus     (Entity) Bool)
(declare-fun Dull      (Entity) Bool)
(declare-fun Amenable  (Entity) Bool)
(declare-fun Opaque    (Entity) Bool)

; Knowledge base (facts)
(assert (Rompus Sally))

; Universal rules (as implications)
(assert (forall ((p Entity)) (=> (Yumpus p) (Rompus p))))
(assert (forall ((p Entity)) (=> (Rompus p) (Impus p))))
(assert (forall ((p Entity)) (=> (Impus p) (not (Amenable p)))))
(assert (forall ((p Entity)) (=> (Impus p) (Dumpus p))))
(assert (forall ((p Entity)) (=> (Dumpus p) (Opaque p))))
(assert (forall ((p Entity)) (=> (Dumpus p) (Tumpus p))))
(assert (forall ((p Entity)) (=> (Tumpus p) (Orange p))))
(assert (forall ((p Entity)) (=> (Tumpus p) (Wumpus p))))
(assert (forall ((p Entity)) (=> (Wumpus p) (not (Small p)))))
(assert (forall ((p Entity)) (=> (Wumpus p) (Vumpus p))))
(assert (forall ((p Entity)) (=> (Vumpus p) (Fruity p))))
(assert (forall ((p Entity)) (=> (Vumpus p) (Jompus p))))
(assert (forall ((p Entity)) (=> (Jompus p) (not (Dull p)))))
(assert (forall ((p Entity)) (=> (Jompus p) (Zumpus p))))

; Test scenario: Is Sally small?
(assert Small Sally)

; Check satisfiability to answer the question "Sally is small"
(check-sat)
(get-model)