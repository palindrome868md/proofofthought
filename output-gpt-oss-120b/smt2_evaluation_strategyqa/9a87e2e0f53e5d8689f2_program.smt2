;-------------------------------------------------
; Question: Would food made with black salt smell of sulfur?
;-------------------------------------------------

; 1. Declare the relevant sorts
(declare-sort Food 0)
(declare-sort Ingredient 0)

; 2. Declare predicates / functions
(declare-fun is-black-salt (Ingredient) Bool)           ; true for black salt
(declare-fun has-sulfur-compound (Ingredient) Bool)    ; ingredient contains sulfur‑bearing compounds
(declare-fun causes-sulfur-smell (Ingredient) Bool)    ; ingredient can give a sulfur smell
(declare-fun contains (Food Ingredient) Bool)          ; food is made with the ingredient
(declare-fun smells-of-sulfur (Food) Bool)             ; food emits a sulfur smell

; 3. Declare concrete constants
(declare-const black-salt Ingredient)   ; the specific black salt ingredient
(declare-const sample-food Food)        ; a piece of food prepared with black salt

; 4. Knowledge base (facts & general rules)

; Black salt is indeed black salt
(assert (is-black-salt black-salt))

; Rule: Black salt contains sulfur‑bearing compounds
(assert (forall ((i Ingredient))
  (=> (is-black-salt i) (has-sulfur-compound i))))

; Rule: Any ingredient that has sulfur compounds can cause a sulfur smell
(assert (forall ((i Ingredient))
  (=> (has-sulfur-compound i) (causes-sulfur-smell i))))

; Rule: If a food contains an ingredient that can cause a sulfur smell,
; then the food itself smells of sulfur
(assert (forall ((f Food) (i Ingredient))
  (=> (and (contains f i) (causes-sulfur-smell i))
      (smells-of-sulfur f))))

; The specific food we are interested in contains black salt
(assert (contains sample-food black-salt))

; 5. Test the hypothesis: the food smells of sulfur
(assert (smells-of-sulfur sample-food))

; 6. Query Z3
(check-sat)      ; Expected result: sat (the hypothesis is compatible with the KB)
(get-model)      ; Optional: shows a model witnessing the truth