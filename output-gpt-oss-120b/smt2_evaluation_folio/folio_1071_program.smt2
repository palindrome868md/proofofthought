;--- Sort declaration -------------------------------------------------
(declare-sort Lipstick 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun Velvet (Lipstick) Bool)
(declare-fun Satin (Lipstick) Bool)
(declare-fun Refillable (Lipstick) Bool)
(declare-fun Rosewood (Lipstick) Bool)

;--- Constant for the specific lipstick --------------------------------
(declare-const r Lipstick)

;--- Premises -----------------------------------------------------------
; 1. All velvet lipsticks are refillable
(assert (forall ((x Lipstick))
  (=> (Velvet x) (Refillable x))))

; 2. Every lipstick is velvet or satin
(assert (forall ((x Lipstick))
  (or (Velvet x) (Satin x))))

; 3. Satin lipsticks always have "rosewood" in the description
(assert (forall ((x Lipstick))
  (=> (Satin x) (Rosewood x))))

; 4. The given lipstick has rosewood or a velvet finish
(assert (or (Rosewood r) (Velvet r)))

;--- Negation of the target statement -----------------------------------
; ¬( (¬(Velvet(r) ∧ Refillable(r))) → (¬Refillable(r) ∧ ¬Rosewood(r)) )
; equivalent to: (¬(Velvet(r) ∧ Refillable(r))) ∧ ¬(¬Refillable(r) ∧ ¬Rosewood(r))
(assert (and
          (or (not (Velvet r)) (not (Refillable r)))   ; ¬(Velvet ∧ Refillable)
          (or (Refillable r) (Rosewood r))))          ; ¬(¬Refillable ∧ ¬Rosewood)

;--- Check whether the combined constraints are consistent -------------
(check-sat)
(get-model)