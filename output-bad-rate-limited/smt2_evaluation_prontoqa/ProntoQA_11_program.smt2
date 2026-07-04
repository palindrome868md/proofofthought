; Sorts
(declare-sort Entity 0)

; Predicates (uninterpreted relations)
(declare-fun jompus  (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun wumpus  (Entity) Bool)
(declare-fun vumpus  (Entity) Bool)
(declare-fun rompus  (Entity) Bool)
(declare-fun dumpus  (Entity) Bool)
(declare-fun yumpus  (Entity) Bool)
(declare-fun zumpus  (Entity) Bool)
(declare-fun numpus  (Entity) Bool)
(declare-fun tumpus  (Entity) Bool)
(declare-fun large   (Entity) Bool)
(declare-fun impus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun orange  (Entity) Bool)
(declare-fun opaque  (Entity) Bool)
(declare-fun bitter  (Entity) Bool)
(declare-fun shy     (Entity) Bool)
(declare-fun metallic (Entity) Bool)

; Constants
(declare-const sam Entity)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (jompus x) (not (amenable x)))))

(assert (forall ((x Entity)) (=> (wumpus x) (not (fruity x)))))

(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (not (shy x)))))
(assert (forall ((x Entity)) (=> (vumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (opaque x))))
(assert (forall ((x Entity)) (=> (dumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (orange x))))
(assert (forall ((x Entity)) (=> (yumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (fruity x))))
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (metallic x))))
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (large x))))
(assert (forall ((x Entity)) (=> (tumpus x) (impus x))))

; Sam is a vumpus (given)
(assert (vumpus sam))

; Test: Is "Sam is not fruity" satisfiable?
(assert (not (fruity sam)))

; Verification: answer the question with a single check
(check-sat)