;------------------------------------------------------------
;  Question: Is shrimp scampi definitely free of plastic?
;  Answer will be:
;   - unsat : the knowledge base guarantees no plastic,
;   - sat   : the knowledge base does NOT guarantee that.
;------------------------------------------------------------

; 1. Declare sorts
(declare-sort Dish 0)
(declare-sort Ingredient 0)

; 2. Declare functions
(declare-fun contains (Dish Ingredient) Bool)   ; "dish contains ingredient"
(declare-fun is-plastic (Ingredient) Bool)     ; "ingredient is plastic"

; 3. Declare constants (the dish, its food ingredients, and plastic)
(declare-const shrimp-scampi Dish)
(declare-const shrimp Ingredient)
(declare-const garlic Ingredient)
(declare-const butter Ingredient)
(declare-const olive-oil Ingredient)
(declare-const lemon Ingredient)
(declare-const plastic Ingredient)

; 4. Knowledge base ------------------------------------------------

; 4.1  The ingredients that are known to be in shrimp scampi
(assert (contains shrimp-scampi shrimp))
(assert (contains shrimp-scampi garlic))
(assert (contains shrimp-scampi butter))
(assert (contains shrimp-scampi olive-oil))
(assert (contains shrimp-scampi lemon))

; 4.2  Plastic is a plastic material
(assert (is-plastic plastic))

; 4.3  The food ingredients listed above are not plastic
(assert (not (is-plastic shrimp)))
(assert (not (is-plastic garlic)))
(assert (not (is-plastic butter)))
(assert (not (is-plastic olive-oil)))
(assert (not (is-plastic lemon)))

; 4.4  Shrimp scampi is known **not** to contain plastic
(assert (not (contains shrimp-scampi plastic)))

; 5. Test the statement "Shrimp scampi contains plastic"
;     (the negation of what we claim)
(assert (contains shrimp-scampi plastic))

; 6. Check whether the assertions are consistent
(check-sat)     ; Expected result: unsat (the dish is definitely free of plastic)
(get-model)    ; Optional: show the model when the result is sat