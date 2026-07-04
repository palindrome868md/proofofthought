;--------------------------------------------------------------------
; 1. Declare the (uninterpreted) sort for all individuals
;--------------------------------------------------------------------
(declare-sort Entity 0)

;--------------------------------------------------------------------
; 2. Declare unary predicates (properties / categories)
;--------------------------------------------------------------------
(declare-fun wumpus    (Entity) Bool)
(declare-fun dull      (Entity) Bool)
(declare-fun rompus    (Entity) Bool)
(declare-fun cold      (Entity) Bool)
(declare-fun dumpus    (Entity) Bool)
(declare-fun feisty    (Entity) Bool)
(declare-fun numpuse   (Entity) Bool)
(declare-fun mean      (Entity) Bool)
(declare-fun zumpus    (Entity) Bool)
(declare-fun earthy    (Entity) Bool)
(declare-fun tumpus    (Entity) Bool)
(declare-fun opaque    (Entity) Bool)
(declare-fun impus     (Entity) Bool)
(declare-fun liquid    (Entity) Bool)
(declare-fun vumpus    (Entity) Bool)
(declare-fun jompus    (Entity) Bool)
(declare-fun spicy     (Entity) Bool)
(declare-fun yumpus    (Entity) Bool)

;--------------------------------------------------------------------
; 3. Declare the constant "Wren"
;--------------------------------------------------------------------
(declare-const wren Entity)

;--------------------------------------------------------------------
; 4. Assert the knowledge base (facts and universal rules)
;--------------------------------------------------------------------
; Basic facts
(assert (wumpus wren))          ; not needed for the proof, but kept for completeness
(assert (dumpus wren))          ; given directly

; Category implications
(assert (forall ((x Entity))
          (=> (wumpus x) (dull x))))                ; Wumpuses are dull
(assert (forall ((x Entity))
          (=> (wumpus x) (rompus x))))              ; Wumpuses are rompuses
(assert (forall ((x Entity))
          (=> (rompus x) (not (cold x)))))           ; Every rompus is not cold
(assert (forall ((x Entity))
          (=> (dumpus x) (feisty x))))              ; Dumpuses are feisty
(assert (forall ((x Entity))
          (=> (dumpus x) (numpuse x))))             ; Dumpuses are numpuses
(assert (forall ((x Entity))
          (=> (numpuse x) (mean x))))               ; Numpuses are mean
(assert (forall ((x Entity))
          (=> (numpuse x) (zumpus x))))             ; Numpuses are zumpuses
(assert (forall ((x Entity))
          (=> (zumpus x) (not (earthy x)))))        ; Every zumpus is not earthy
(assert (forall ((x Entity))
          (=> (zumpus x) (tumpus x))))              ; Every zumpus is a tumpus
(assert (forall ((x Entity))
          (=> (tumpus x) (opaque x))))              ; Every tumpus is opaque
(assert (forall ((x Entity))
          (=> (impus x) (liquid x))))               ; Impuses are liquid
(assert (forall ((x Entity))
          (=> (tumpus x) (vumpus x))))              ; Tumpuses are vumpuses
(assert (forall ((x Entity))
          (=> (vumpus x) (not (liquid x)))))        ; Every vumpus is not liquid
(assert (forall ((x Entity))
          (=> (vumpus x) (jompus x))))              ; Vumpuses are jompuses
(assert (forall ((x Entity))
          (=> (jompus x) (not (spicy x)))))         ; Each jompus is not spicy
(assert (forall ((x Entity))
          (=> (jompus x) (yumpus x))))              ; Jompuses are yumpuses

;--------------------------------------------------------------------
; 5. Test the query: "Wren is liquid."
;--------------------------------------------------------------------
(assert (liquid wren))

;--------------------------------------------------------------------
; 6. Check satisfiability (sat = true, unsat = false)
;--------------------------------------------------------------------
(check-sat)
(get-model)