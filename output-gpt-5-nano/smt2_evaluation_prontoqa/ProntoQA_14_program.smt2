; Declare sorts
(declare-sort Entity 0)

; Declare unary predicates (properties/categories)
(declare-fun jompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun sweet (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun impuse (Entity) Bool)
(declare-fun opaque (Entity) Bool)

; Declare constant individual
(declare-const Fae Entity)

; Knowledge base (facts)
(assert (jompus Fae))
(assert (zumpus Fae))
(assert (numpus Fae))
(assert (yumpus Fae))
(assert (wumpus Fae))

; Rules (universal implications)
(assert (forall ((p Entity)) (=> (jompus p) (zumpus p))))
(assert (forall ((p Entity)) (=> (zumpus p) (numpus p))))
(assert (forall ((p Entity)) (=> (numpus p) (yumpus p))))
(assert (forall ((p Entity)) (=> (yumpus p) (wumpus p))))
(assert (forall ((p Entity)) (=> (yumpus p) (brown p))))
(assert (forall ((p Entity)) (=> (zumpus p) (sweet p))))
(assert (forall ((p Entity)) (=> (numpus p) (hot p))))
(assert (forall ((p Entity)) (=> (tumpus p) (opaque p))))
(assert (forall ((p Entity)) (=> (wumpus p) (not (opaque p)))))
(assert (forall ((p Entity)) (=> (wumpus p) (impuse p))))
(assert (forall ((p Entity)) (=> (jompus p) (large p))))

; Test: Is Fae opaque?
(assert (opaque Fae))

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)