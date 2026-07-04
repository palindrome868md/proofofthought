;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicates (unary relations) ----------------------------------
(declare-fun Rompus (Entity) Bool)
(declare-fun Bitter (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)

;--- Constant ------------------------------------------------------
(declare-const Wren Entity)

;--- Knowledge base -----------------------------------------------
; Rompuses are bitter.
(assert (forall ((x Entity)) (=> (Rompus x) (Bitter x))))
; Rompuses are yumpuses.
(assert (forall ((x Entity)) (=> (Rompus x) (Yumpus x))))
; Yumpuses are nervous.
(assert (forall ((x Entity)) (=> (Yumpus x) (Nervous x))))
; Yumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Yumpus x) (Jompus x))))
; Jompuses are not blue.
(assert (forall ((x Entity)) (=> (Jompus x) (not (Blue x)))))
; Dumpuses are not earthy.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Earthy x)))))
; Every jompus is an impus.
(assert (forall ((x Entity)) (=> (Jompus x) (Impus x))))
; Impuses are bright.
(assert (forall ((x Entity)) (=> (Impus x) (Bright x))))
; Each impus is a numpus.
(assert (forall ((x Entity)) (=> (Impus x) (Numpus x))))
; Numpuses are earthy.
(assert (forall ((x Entity)) (=> (Numpus x) (Earthy x))))
; Every numpus is a vumpus.
(assert (forall ((x Entity)) (=> (Numpus x) (Vumpus x))))

; Wren is a rompus.
(assert (Rompus Wren))

;--- Test the statement: "Wren is not earthy" --------------------
(assert (not (Earthy Wren)))   ; this is the claim we want to verify

;--- Check satisfiability -----------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)