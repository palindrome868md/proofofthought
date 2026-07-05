; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const fae Entity)

; Declare predicates
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)

(declare-fun cold (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun rompuse (Entity) Bool)

; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (is-dumpus x) (cold x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-numpus x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (not (bitter x)))))
(assert (forall ((x Entity)) (=> (is-numpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (fruity x))))
(assert (forall ((x Entity)) (=> (zumpus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (large x))))
(assert (forall ((x Entity)) (=> (tumpus x) (not (wooden x)))))
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (wooden x))))
(assert (forall ((x Entity)) (=> (impus x) (rompuse x))))

; Facts
(assert (is-dumpus fae))

; Test: Is Fae wooden?
(assert (wooden fae))

; Check satisfiability
(check-sat)