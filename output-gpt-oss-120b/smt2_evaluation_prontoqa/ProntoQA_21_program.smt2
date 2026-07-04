;--- Sorts -------------------------------------------------
(declare-sort Entity 0)

;--- Predicates (unary relations) ---------------------------
(declare-fun vumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)

(declare-fun dumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)

(declare-fun numpus (Entity) Bool)
(declare-fun kind (Entity) Bool)

(declare-fun rompus (Entity) Bool)
(declare-fun small (Entity) Bool)

(declare-fun jompus (Entity) Bool)
(declare-fun bright (Entity) Bool)

(declare-fun yumpus (Entity) Bool)
(declare-fun orange (Entity) Bool)

(declare-fun zumpus (Entity) Bool)
(declare-fun sour (Entity) Bool)

(declare-fun impus (Entity) Bool)
(declare-fun transparent (Entity) Bool)

(declare-fun wumpus (Entity) Bool)

(declare-fun tumpus (Entity) Bool)

;--- Constant ------------------------------------------------
(declare-const Max Entity)

;--- Knowledge base (universal rules) ------------------------
; Vumpuses are earthy.
(assert (forall ((x Entity)) (=> (vumpus x) (earthy x))))

; Vumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))

; Dumpuses are not wooden.
(assert (forall ((x Entity)) (=> (dumpus x) (not (wooden x)))))

; Dumpuses are numpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (numpus x))))

; Every numpus is kind.
(assert (forall ((x Entity)) (=> (numpus x) (kind x))))

; Each numpus is a rompus.
(assert (forall ((x Entity)) (=> (numpus x) (rompus x))))

; Each rompus is small.
(assert (forall ((x Entity)) (=> (rompus x) (small x))))

; Every rompus is a jompus.
(assert (forall ((x Entity)) (=> (rompus x) (jompus x))))

; Every jompus is bright.
(assert (forall ((x Entity)) (=> (jompus x) (bright x))))

; Jompuses are yumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (yumpus x))))

; Yumpuses are orange.
(assert (forall ((x Entity)) (=> (yumpus x) (orange x))))

; Every yumpus is a zumpus.
(assert (forall ((x Entity)) (=> (yumpus x) (zumpus x))))

; Zumpuses are sour.
(assert (forall ((x Entity)) (=> (zumpus x) (sour x))))

; Zumpuses are impuses.
(assert (forall ((x Entity)) (=> (zumpus x) (impus x))))

; Impuses are transparent.
(assert (forall ((x Entity)) (=> (impus x) (transparent x))))

; Each impus is a wumpus.
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))

; Tumpuses are not orange.
(assert (forall ((x Entity)) (=> (tumpus x) (not (orange x)))))

;--- Specific facts -----------------------------------------
; Max is a dumpus.
(assert (dumpus Max))

;--- Question to verify -------------------------------------
; Is Max orange?
(assert (orange Max))

;--- Check the result ---------------------------------------
(check-sat)
(get-model)