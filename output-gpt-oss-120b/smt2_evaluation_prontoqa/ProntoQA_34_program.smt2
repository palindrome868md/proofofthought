;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)      ; generic domain for all individuals

;--- Predicates (unary relations) ----------------------------------
(declare-fun impus      (Entity) Bool)
(declare-fun bright     (Entity) Bool)
(declare-fun rompus     (Entity) Bool)
(declare-fun floral     (Entity) Bool)
(declare-fun yumpus     (Entity) Bool)
(declare-fun opaque     (Entity) Bool)
(declare-fun numpus     (Entity) Bool)
(declare-fun red        (Entity) Bool)
(declare-fun dumpus     (Entity) Bool)
(declare-fun bitter     (Entity) Bool)
(declare-fun vumpus     (Entity) Bool)
(declare-fun mean       (Entity) Bool)
(declare-fun tumpus     (Entity) Bool)
(declare-fun shy        (Entity) Bool)
(declare-fun wumpus     (Entity) Bool)
(declare-fun zumpus     (Entity) Bool)
(declare-fun temperate  (Entity) Bool)
(declare-fun jompus     (Entity) Bool)

;--- Constant ------------------------------------------------------
(declare-const Sam Entity)

;--- Knowledge base (rules) ----------------------------------------
; Impuses are bright.
(assert (forall ((x Entity)) (=> (impus x) (bright x))))

; Every impus is a rompus.
(assert (forall ((x Entity)) (=> (impus x) (rompus x))))

; Rompuses are floral.
(assert (forall ((x Entity)) (=> (rompus x) (floral x))))

; Each rompus is a yumpus.
(assert (forall ((x Entity)) (=> (rompus x) (yumpus x))))

; Every yumpus is opaque.
(assert (forall ((x Entity)) (=> (yumpus x) (opaque x))))

; Yumpuses are numpuses.
(assert (forall ((x Entity)) (=> (yumpus x) (numpus x))))

; Each numpus is red.
(assert (forall ((x Entity)) (=> (numpus x) (red x))))

; Every numpus is a dumpus.
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))

; Dumpuses are bitter.
(assert (forall ((x Entity)) (=> (dumpus x) (bitter x))))

; Every dumpus is a vumpus.
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))

; Vumpuses are not mean.
(assert (forall ((x Entity)) (=> (vumpus x) (not (mean x)))))

; Vumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))

; Tumpuses are not shy.
(assert (forall ((x Entity)) (=> (tumpus x) (not (shy x)))))

; Each wumpus is shy.      (not needed for this query, but declared)
(assert (forall ((x Entity)) (=> (wumpus x) (shy x))))

; Tumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (zumpus x))))

; Each zumpus is temperate.
(assert (forall ((x Entity)) (=> (zumpus x) (temperate x))))

; Zumpuses are jompuses.
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))

;--- Fact ----------------------------------------------------------
(assert (yumpus Sam))   ; Sam is a yumpus

;--- Query: "Sam is shy" -----------------------------------------
(assert (shy Sam))      ; we ask if Sam can be shy

;--- Check ---------------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)