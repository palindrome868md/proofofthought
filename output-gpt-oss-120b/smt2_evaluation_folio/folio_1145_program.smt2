;--- Sort declaration -------------------------------------------------
(declare-sort Fruit 0)

;--- Predicate (function) declarations --------------------------------
(declare-fun red       (Fruit) Bool)   ; red fruit?
(declare-fun grows     (Fruit) Bool)   ; grows in Ben's yard?
(declare-fun containsVitC (Fruit) Bool) ; contains some Vitamin C?
(declare-fun apple     (Fruit) Bool)   ; is an apple?
(declare-fun healthy   (Fruit) Bool)   ; is healthy?
(declare-fun warning   (Fruit) Bool)   ; is on a warning list?

;--- Constant for the cherries ----------------------------------------
(declare-const cherry Fruit)

;--- Knowledge base (premises) -----------------------------------------

; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Fruit))
  (=> (and (red x) (grows x)) (containsVitC x))))

; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Fruit))
  (=> (and (apple x) (grows x)) (red x))))

; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((x Fruit))
  (=> (and (grows x) (containsVitC x)) (healthy x))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Fruit))
  (=> (and (grows x) (healthy x)) (not (warning x)))))

; 5. The cherries grow in Ben's yard.
(assert (grows cherry))

; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (apple cherry)) (not (healthy cherry))) (red cherry)))

;--- Negation of the statement to be tested ---------------------------
; Negation of: (healthy(cherry) ∨ warning(cherry)) → ¬red(cherry)
; becomes: (healthy(cherry) ∨ warning(cherry)) ∧ red(cherry)
(assert (and (or (healthy cherry) (warning cherry))
             (red cherry)))

;--- Check whether the negated statement is compatible with the KB ----
(check-sat)   ; Expected result: sat  (so the original implication is NOT forced)
(get-model)   ; Optional: shows a model where the negation holds