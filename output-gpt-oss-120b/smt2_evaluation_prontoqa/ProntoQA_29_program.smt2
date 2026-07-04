;--- Sort declaration ---------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (uninterpreted Boolean functions) declarations ------------
(declare-fun jompus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun rompuse (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun numpuse (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun wumpus (Entity) Bool)

;--- Constant representing Max -------------------------------------------
(declare-const Max Entity)

;--- Knowledge base ------------------------------------------------------
; Every jompus is liquid.
(assert (forall ((x Entity)) (=> (jompus x) (liquid x))))

; Jompuses are rompuses.
(assert (forall ((x Entity)) (=> (jompus x) (rompuse x))))

; Every rompus is mean.
(assert (forall ((x Entity)) (=> (rompus x) (mean x))))

; Rompuses are zumpuses.
(assert (forall ((x Entity)) (=> (rompuse x) (zumpus x))))

; Each zumpus is transparent.
(assert (forall ((x Entity)) (=> (zumpus x) (transparent x))))

; Zumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))

; Tumpuses are not earthy.
(assert (forall ((x Entity)) (=> (tumpus x) (not (earthy x)))))

; Each dumpus is bright.
(assert (forall ((x Entity)) (=> (dumpus x) (bright x))))

; Tumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

; Yumpuses are not bright.
(assert (forall ((x Entity)) (=> (yumpus x) (not (bright x)))))

; Yumpuses are impuses.
(assert (forall ((x Entity)) (=> (yumpus x) (impus x))))

; Impuses are temperate.
(assert (forall ((x Entity)) (=> (impus x) (temperate x))))

; Impuses are numpuses.
(assert (forall ((x Entity)) (=> (impus x) (numpuse x))))

; Every numpus is feisty.
(assert (forall ((x Entity)) (=> (numpuse x) (feisty x))))

; Numpuses are wumpuses.
(assert (forall ((x Entity)) (=> (numpuse x) (wumpus x))))

; Max is a jompus.
(assert (jompus Max))

;--- Test the statement: "Max is bright" ---------------------------------
(assert (bright Max))

;--- Check satisfiability ------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; Optional: view a model (will be empty because unsat)