;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Constants -----------------------------------------------------
(declare-const Polly Entity)

;--- Unary predicates (properties / classes) -----------------------
(declare-fun jompus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun spicy (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun tumpus (Entity) Bool)

;--- Knowledge base (universal rules) -------------------------------
; Jompuses are bright.
(assert (forall ((x Entity)) (=> (jompus x) (bright x))))

; Every jompus is a rompus.
(assert (forall ((x Entity)) (=> (jompus x) (rompus x))))

; Rompuses are not opaque.
(assert (forall ((x Entity)) (=> (rompus x) (not (opaque x)))))

; Rompuses are vumpuses.
(assert (forall ((x Entity)) (=> (rompus x) (vumpus x))))

; Each vumpus is red.
(assert (forall ((x Entity)) (=> (vumpus x) (red x))))

; Each vumpus is a numpus.
(assert (forall ((x Entity)) (=> (vumpus x) (numpus x))))

; Every zumpus is not fruity.
(assert (forall ((x Entity)) (=> (zumpus x) (not (fruity x)))))

; Every numpus is not spicy.
(assert (forall ((x Entity)) (=> (numpus x) (not (spicy x)))))

; Numpuses are impuses.
(assert (forall ((x Entity)) (=> (numpus x) (impus x))))

; Each impus is temperate.
(assert (forall ((x Entity)) (=> (impus x) (temperate x))))

; Every impus is a wumpus.
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))

; Every wumpus is fruity.
(assert (forall ((x Entity)) (=> (wumpus x) (fruity x))))

; Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))

; Yumpuses are liquid.
(assert (forall ((x Entity)) (=> (yumpus x) (liquid x))))

; Yumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (yumpus x) (dumpus x))))

; Dumpuses are small.
(assert (forall ((x Entity)) (=> (dumpus x) (small x))))

; Dumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))

;--- Specific facts ------------------------------------------------
; Polly is a rompus.
(assert (rompus Polly))

;--- Query: is Polly fruity? ---------------------------------------
(assert (fruity Polly))

;--- Solve ---------------------------------------------------------
(check-sat)
(get-model)