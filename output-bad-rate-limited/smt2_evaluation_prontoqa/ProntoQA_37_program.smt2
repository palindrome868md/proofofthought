; Declare sorts
(declare-sort Entity 0)

; Predicates
(declare-fun impuse (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun dumpuse (Entity) Bool)
(declare-fun rompuse (Entity) Bool)
(declare-fun zumpuse (Entity) Bool)
(declare-fun vumpuse (Entity) Bool)
(declare-fun yumpuse (Entity) Bool)
(declare-fun numpuse (Entity) Bool)
(declare-fun tumpuse (Entity) Bool)
(declare-fun jompuse (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun sweet (Entity) Bool)

; Constant
(declare-const wren Entity)

; Knowledge base
(assert (forall ((x Entity)) (=> (impuse x) (not (fruity x)))))
(assert (forall ((x Entity)) (=> (wumpus x) (dumpuse x))))
(assert (forall ((x Entity)) (=> (wumpus x) (not (temperate x)))))
(assert (forall ((x Entity)) (=> (dumpuse x) (zumpuse x))))
(assert (forall ((x Entity)) (=> (zumpuse x) (wooden x))))
(assert (forall ((x Entity)) (=> (zumpuse x) (vumpuse x))))
(assert (forall ((x Entity)) (=> (vumpuse x) (yumpuse x))))
(assert (forall ((x Entity)) (=> (yumpuse x) (numpuse x))))
(assert (forall ((x Entity)) (=> (numpuse x) (brown x))))
(assert (forall ((x Entity)) (=> (numpuse x) (tumpuse x))))
(assert (forall ((x Entity)) (=> (tumpuse x) (sweet x))))
(assert (forall ((x Entity)) (=> (tumpuse x) (jompuse x))))
(assert (forall ((x Entity)) (=> (rompuse x) (not (sweet x)))))  ; Rompuses are not sweet

; Specific fact
(assert (zumpuse wren))

; Test: Is Wren sweet?
(assert (sweet wren))

(check-sat)
(get-model)