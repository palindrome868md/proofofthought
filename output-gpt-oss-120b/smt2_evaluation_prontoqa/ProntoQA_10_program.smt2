; -------------------------------------------------
; Sorts
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; Unary predicates (properties / categories)
; -------------------------------------------------
(declare-fun impus (Entity) Bool)
(declare-fun earthy (Entity) Bool)

(declare-fun jompus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun rompuse (Entity) Bool)
(declare-fun amenable (Entity) Bool)

(declare-fun wumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun zumpus (Entity) Bool)

(declare-fun temperate (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun dull (Entity) Bool)

(declare-fun vumpus (Entity) Bool)
(declare-fun shy (Entity) Bool)

(declare-fun yumpus (Entity) Bool)
(declare-fun sweet (Entity) Bool)

(declare-fun numpuse (Entity) Bool)
(declare-fun tumpus (Entity) Bool)

; -------------------------------------------------
; Constant representing the individual "Fae"
; -------------------------------------------------
(declare-const fae Entity)

; -------------------------------------------------
; Knowledge base (axioms)
; -------------------------------------------------
; Every impus is earthy.
(assert (forall ((x Entity)) (=> (impus x) (earthy x))))

; Each impus is a jompus.
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))

; Jompuses are small.
(assert (forall ((x Entity)) (=> (jompus x) (small x))))

; Jompuses are rompuses.
(assert (forall ((x Entity)) (=> (jompus x) (rompuse x))))

; Rompuses are not amenable.
(assert (forall ((x Entity)) (=> (rompuse x) (not (amenable x)))))

; Rompuses are wumpuses.
(assert (forall ((x Entity)) (=> (rompuse x) (wumpus x))))

; Wumpuses are wooden.
(assert (forall ((x Entity)) (=> (wumpus x) (wooden x))))

; Wumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))

; Every zumpus is temperate.
(assert (forall ((x Entity)) (=> (zumpus x) (temperate x))))

; Every zumpus is a dumpus.
(assert (forall ((x Entity)) (=> (zumpus x) (dumpus x))))

; Dumpuses are dull.
(assert (forall ((x Entity)) (=> (dumpus x) (dull x))))

; Dumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))

; Every vumpus is not shy.
(assert (forall ((x Entity)) (=> (vumpus x) (not (shy x)))))

; Every yumpus is sweet.
(assert (forall ((x Entity)) (=> (yumpus x) (sweet x))))

; Vumpuses are numpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (numpuse x))))

; Numpuses are not sweet.
(assert (forall ((x Entity)) (=> (numpuse x) (not (sweet x)))))

; Numpuses are tumpuses.
(assert (forall ((x Entity)) (=> (numpuse x) (tumpus x))))

; Fact: Fae is a wumpus.
(assert (wumpus fae))

; -------------------------------------------------
; Query: Is Fae sweet?
; -------------------------------------------------
(assert (sweet fae))

; -------------------------------------------------
; Check the consistency of the knowledge base + query
; -------------------------------------------------
(check-sat)
(get-model)