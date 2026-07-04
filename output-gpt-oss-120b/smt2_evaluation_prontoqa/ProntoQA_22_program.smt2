;--- Sorts -------------------------------------------------
(declare-sort Entity 0)

;--- Predicates --------------------------------------------
(declare-fun wumpus   (Entity) Bool)
(declare-fun sour     (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun aggressive (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun numpuse  (Entity) Bool)
(declare-fun red      (Entity) Bool)
(declare-fun rompuse  (Entity) Bool)
(declare-fun feisty   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun impus    (Entity) Bool)

;--- Individual --------------------------------------------
(declare-const wren Entity)

;--- Knowledge base (universal rules) -----------------------
; Every wumpus is sour.
(assert (forall ((x Entity)) (=> (wumpus x) (sour x))))

; Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))

; Each yumpus is aggressive.
(assert (forall ((x Entity)) (=> (yumpus x) (aggressive x))))

; Every yumpus is a tumpus.
(assert (forall ((x Entity)) (=> (yumpus x) (tumpus x))))

; Every tumpus is transparent.
(assert (forall ((x Entity)) (=> (tumpus x) (transparent x))))

; Tumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (vumpus x))))

; Vumpuses are wooden.
(assert (forall ((x Entity)) (=> (vumpus x) (wooden x))))

; Each vumpus is a jompus.
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))

; Each impus is not feisty.
(assert (forall ((x Entity)) (=> (impus x) (not (feisty x)))))

; Every jompus is large.
(assert (forall ((x Entity)) (=> (jompus x) (large x))))

; Jompuses are numpuses.
(assert (forall ((x Entity)) (=> (jompus x) (numpuse x))))

; Numpuses are red.
(assert (forall ((x Entity)) (=> (numpuse x) (red x))))

; Numpuses are rompuses.
(assert (forall ((x Entity)) (=> (numpuse x) (rompuse x))))

; Every rompus is feisty.
(assert (forall ((x Entity)) (=> (rompuse x) (feisty x))))

; Each rompus is a zumpus.
(assert (forall ((x Entity)) (=> (rompuse x) (zumpus x))))

;--- Facts -------------------------------------------------
; Wren is a tumpus.
(assert (tumpus wren))

;--- Test the statement: "Wren is not feisty"
(assert (not (feisty wren)))

;--- Check the result ---------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; Optional: shows a model if SAT (won’t be produced here)