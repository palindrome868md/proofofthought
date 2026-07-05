; Sorts
(declare-sort Entity 0)

; Constants
(declare-const Max Entity)

; Predicates
(declare-fun zumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun sweet (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun feisty (Entity) Bool)

; Knowledge base
(assert (forall ((p Entity)) (=> (zumpus p) (impus p))))
(assert (forall ((p Entity)) (=> (zumpus p) (small p))))
(assert (forall ((p Entity)) (=> (impus p) (vumpus p))))
(assert (forall ((p Entity)) (=> (vumpus p) (not (feisty p)))))
(assert (forall ((p Entity)) (=> (vumpus p) (dumpus p))))
(assert (forall ((p Entity)) (=> (dumpus p) (not (dull p)))))
(assert (forall ((p Entity)) (=> (dumpus p) (rompus p))))
(assert (forall ((p Entity)) (=> (rompus p) (transparent p))))
(assert (forall ((p Entity)) (=> (rompus p) (wumpus p))))
(assert (forall ((p Entity)) (=> (wumpus p) (not (earthy p)))))
(assert (forall ((p Entity)) (=> (wumpus p) (tumpus p))))
(assert (forall ((p Entity)) (=> (tumpus p) (cold p))))
(assert (forall ((p Entity)) (=> (numpus p) (not (cold p)))))
(assert (forall ((p Entity)) (=> (tumpus p) (yumpus p))))
(assert (vumpus Max))
(assert (forall ((p Entity)) (=> (impus p) (sweet p))))

; Test: Is Max not cold?
(assert (not (cold Max)))

(check-sat)
(get-model)