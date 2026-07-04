;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (unary) declarations ------------------------------------
(declare-fun zumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)

(declare-fun numpus (Entity) Bool)

(declare-fun brown (Entity) Bool)

(declare-fun dumpus (Entity) Bool)
(declare-fun amenable (Entity) Bool)

(declare-fun impus (Entity) Bool)
(declare-fun bitter (Entity) Bool)

(declare-fun vumpus (Entity) Bool)
(declare-fun cold (Entity) Bool)

(declare-fun tumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)

(declare-fun rompus (Entity) Bool)
(declare-fun floral (Entity) Bool)

(declare-fun yumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun jompus (Entity) Bool)

;--- Constant for Sally ------------------------------------------------
(declare-const sally Entity)

;--- Knowledge base ----------------------------------------------------
; Every zumpus is not opaque.
(assert (forall ((x Entity)) (=> (zumpus x) (not (opaque x)))))

; Each zumpus is a numpus.
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))

; Numpuses are brown.
(assert (forall ((x Entity)) (=> (numpus x) (brown x))))

; Numpuses are dumpuses.
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))

; Each dumpus is amenable.
(assert (forall ((x Entity)) (=> (dumpus x) (amenable x))))

; Impuses are not bitter.
(assert (forall ((x Entity)) (=> (impus x) (not (bitter x)))))

; Every dumpus is a vumpus.
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))

; Each vumpus is not cold.
(assert (forall ((x Entity)) (=> (vumpus x) (not (cold x)))))

; Each vumpus is a tumpus.
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))

; Every tumpus is wooden.
(assert (forall ((x Entity)) (=> (tumpus x) (wooden x))))

; Every tumpus is a rompus.
(assert (forall ((x Entity)) (=> (tumpus x) (rompus x))))

; Each rompus is floral.
(assert (forall ((x Entity)) (=> (rompus x) (floral x))))

; Rompuses are yumpuses.
(assert (forall ((x Entity)) (=> (rompus x) (yumpus x))))

; Yumpuses are bitter.
(assert (forall ((x Entity)) (=> (yumpus x) (bitter x))))

; Every yumpus is a wumpus.
(assert (forall ((x Entity)) (=> (yumpus x) (wumpus x))))

; Wumpuses are not feisty.
(assert (forall ((x Entity)) (=> (wumpus x) (not (feisty x)))))

; Wumpuses are jompuses.
(assert (forall ((x Entity)) (=> (wumpus x) (jompus x))))

; Sally is a dumpus.
(assert (dumpus sally))

;--- Question to verify: "Sally is bitter" ---------------------------
(assert (bitter sally))

;--- Check the entailment ---------------------------------------------
(check-sat)
(get-model)