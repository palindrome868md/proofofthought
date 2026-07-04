;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (unary function) declarations ---------------------------
(declare-fun jompus   (Entity) Bool)
(declare-fun sour     (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun kind     (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun feisty   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun hot      (Entity) Bool)
(declare-fun brown    (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun numpuse  (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)

;--- Constant declaration -----------------------------------------------
(declare-const alex Entity)

;--- Knowledge base (universal rules) -----------------------------------
; Every jompus is sour.
(assert (forall ((x Entity)) (=> (jompus x) (sour x))))

; Each jompus is a rompus.
(assert (forall ((x Entity)) (=> (jompus x) (rompus x))))

; Rompuses are not kind.
(assert (forall ((x Entity)) (=> (rompus x) (not (kind x)))))

; Every rompus is a zumpus.
(assert (forall ((x Entity)) (=> (rompus x) (zumpus x))))

; Every zumpus is feisty.
(assert (forall ((x Entity)) (=> (zumpus x) (feisty x))))

; Zumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))

; Tumpuses are small.
(assert (forall ((x Entity)) (=> (tumpus x) (small x))))

; Tumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (wumpus x))))

; Wumpuses are opaque.
(assert (forall ((x Entity)) (=> (wumpus x) (opaque x))))

; Wumpuses are impuses.
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))

; Every yumpus is hot.
(assert (forall ((x Entity)) (=> (yumpus x) (hot x))))

; Impuses are brown.
(assert (forall ((x Entity)) (=> (impus x) (brown x))))

; Impuses are dumpuses.
(assert (forall ((x Entity)) (=> (impus x) (dumpus x))))

; Dumpuses are not hot.
(assert (forall ((x Entity)) (=> (dumpus x) (not (hot x)))))

; Every dumpus is a vumpus.
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))

; Each vumpus is dull.
(assert (forall ((x Entity)) (=> (vumpus x) (dull x))))

; Vumpuses are numpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (numpuse x))))

;--- Facts ---------------------------------------------------------------
; Alex is a zumpus.
(assert (zumpus alex))

;--- Query: Is Alex hot? -------------------------------------------------
(assert (hot alex))

;--- Solve ---------------------------------------------------------------
(check-sat)
(get-model)