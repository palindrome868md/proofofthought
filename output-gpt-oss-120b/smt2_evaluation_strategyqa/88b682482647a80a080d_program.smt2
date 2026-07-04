; -------------------------------------------------
; 1. Declare uninterpreted sorts
(declare-sort Food 0)
(declare-sort Ingredient 0)

; -------------------------------------------------
; 2. Declare constants (foods)
(declare-const rice-pudding Food)
(declare-const horchata Food)
(declare-const new-dish Food)   ; result of adding water to rice‑pudding

; -------------------------------------------------
; 3. Declare constants (ingredients)
(declare-const rice Ingredient)
(declare-const water Ingredient)
(declare-const milk Ingredient)
(declare-const sugar Ingredient)

; -------------------------------------------------
; 4. Declare predicates
(declare-fun includes (Food Ingredient) Bool)   ; food contains ingredient
(declare-fun is_horchata (Food) Bool)           ; food is horchata

; -------------------------------------------------
; 5. Knowledge base: what each food contains
; rice‑pudding ingredients
(assert (includes rice-pudding rice))
(assert (includes rice-pudding milk))
(assert (includes rice-pudding sugar))

; horchata ingredients
(assert (includes horchata rice))
(assert (includes horchata water))

; horchata is indeed horchata
(assert (is_horchata horchata))

; -------------------------------------------------
; 6. Defining rule for horchata:
;  any food that is horchata contains ONLY rice and water
(assert
  (forall ((f Food) (i Ingredient))
    (=> (is_horchata f)
        (and (includes f rice)
             (includes f water)
             (forall ((j Ingredient))
               (=> (includes f j)
                   (or (= j rice) (= j water))))))))

; -------------------------------------------------
; 7. Model the addition of water to rice‑pudding
(assert (includes new-dish rice))
(assert (includes new-dish milk))
(assert (includes new-dish sugar))
(assert (includes new-dish water))

; -------------------------------------------------
; 8. Test the claim: "new-dish is horchata"
(assert (is_horchata new-dish))

; -------------------------------------------------
; 9. Check satisfiability (sat = true, unsat = false)
(check-sat)
(get-model)