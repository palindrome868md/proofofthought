;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (uninterpreted Boolean functions) declarations ----------
(declare-fun jompus   (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun temperate(Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun shy      (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)

;--- Constant representing Sally ----------------------------------------
(declare-const sally Entity)

;--- Knowledge base (universal rules) ------------------------------------
; Every jompus is bright.
(assert (forall ((x Entity)) (=> (jompus x) (bright x))))

; Every jompus is a wumpus.
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))

; Each wumpus is wooden.
(assert (forall ((x Entity)) (=> (wumpus x) (wooden x))))

; Each wumpus is a yumpus.
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))

; Yumpuses are amenable.
(assert (forall ((x Entity)) (=> (yumpus x) (amenable x))))

; Yumpuses are impuses.
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))

; Impuses are temperate.
(assert (forall ((x Entity)) (=> (impus x) (temperate x))))

; Impuses are tumpuses.
(assert (forall ((x Entity)) (=> (impus x) (tumpus x))))

; Tumpuses are shy.
(assert (forall ((x Entity)) (=> (tumpus x) (shy x))))

; Every tumpus is a rompus.
(assert (forall ((x Entity)) (=> (tumpus x) (rompus x))))

; Rompuses are not small.
(assert (forall ((x Entity)) (=> (rompus x) (not (small x)))))

; Every rompus is a numpus.
(assert (forall ((x Entity)) (=> (rompus x) (numpus x))))

; Numpuses are fruity.
(assert (forall ((x Entity)) (=> (numpus x) (fruity x))))

; Each dumpus is not shy.
(assert (forall ((x Entity)) (=> (dumpus x) (not (shy x)))))

; Numpuses are vumpuses.
(assert (forall ((x Entity)) (=> (numpus x) (vumpus x))))

;--- Fact about Sally ----------------------------------------------------
(assert (jompus sally))

;--- Test the statement: “Sally is shy.” ---------------------------------
(assert (shy sally))

;--- Decision procedure --------------------------------------------------
(check-sat)
(get-model)