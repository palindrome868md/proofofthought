; -------------------------------------------------
; Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate declarations (unary predicates)
; -------------------------------------------------
(declare-fun impus      (Entity) Bool)
(declare-fun bright     (Entity) Bool)
(declare-fun jompus     (Entity) Bool)
(declare-fun mean       (Entity) Bool)
(declare-fun zumpus     (Entity) Bool)
(declare-fun temperate  (Entity) Bool)
(declare-fun vumpus     (Entity) Bool)
(declare-fun transparent(Entity) Bool)
(declare-fun tumpus     (Entity) Bool)
(declare-fun shy        (Entity) Bool)
(declare-fun numpus     (Entity) Bool)
(declare-fun blue       (Entity) Bool)
(declare-fun dumpus     (Entity) Bool)
(declare-fun fruity     (Entity) Bool)
(declare-fun wumpus     (Entity) Bool)
(declare-fun rompuse    (Entity) Bool)
(declare-fun metallic   (Entity) Bool)
(declare-fun yumpus     (Entity) Bool)

; -------------------------------------------------
; Constant representing the individual "Fae"
; -------------------------------------------------
(declare-const fae Entity)

; -------------------------------------------------
; Knowledge base (universal rules)
; -------------------------------------------------
; Impuses are bright.
(assert (forall ((x Entity)) (=> (impus x) (bright x))))

; Every impus is a jompus.
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))

; Jompuses are mean.
(assert (forall ((x Entity)) (=> (jompus x) (mean x))))

; Every zumpus is not temperate.
(assert (forall ((x Entity)) (=> (zumpus x) (not (temperate x)))))

; Each jompus is a vumpus.
(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))

; Vumpuses are transparent.
(assert (forall ((x Entity)) (=> (vumpus x) (transparent x))))

; Every vumpus is a tumpus.
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))

; Every tumpus is shy.
(assert (forall ((x Entity)) (=> (tumpus x) (shy x))))

; Tumpuses are numpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

; Each numpus is not blue.
(assert (forall ((x Entity)) (=> (numpus x) (not (blue x)))))

; Every numpus is a dumpus.
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))

; Dumpuses are not fruity.
(assert (forall ((x Entity)) (=> (dumpus x) (not (fruity x)))))

; Each dumpus is a wumpus.
(assert (forall ((x Entity)) (=> (dumpus x) (wumpus x))))

; Wumpuses are temperate.
(assert (forall ((x Entity)) (=> (wumpus x) (temperate x))))

; Wumpuses are rompuses.
(assert (forall ((x Entity)) (=> (wumpus x) (rompuse x))))

; Rompuses are metallic.
(assert (forall ((x Entity)) (=> (rompuse x) (metallic x))))

; Rompuses are yumpuses.
(assert (forall ((x Entity)) (=> (rompuse x) (yumpus x))))

; -------------------------------------------------
; Fact: Fae is a vumpus.
; -------------------------------------------------
(assert (vumpus fae))

; -------------------------------------------------
; Query: Is Fae temperate?
; -------------------------------------------------
(assert (temperate fae))

; -------------------------------------------------
; Solve
; -------------------------------------------------
(check-sat)
(get-model)