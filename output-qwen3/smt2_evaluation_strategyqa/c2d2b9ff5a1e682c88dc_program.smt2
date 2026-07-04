; Question: Is shrimp scampi definitely free of plastic?
; This tests whether shrimp scampi can contain plastic given standard recipe knowledge

; Declare sorts
(declare-sort Food 0)
(declare-sort Ingredient 0)

; Declare functions
(declare-fun has-ingredient (Food Ingredient) Bool)
(declare-fun is-plastic (Ingredient) Bool)
(declare-fun is-standard-dish (Food) Bool)
(declare-fun is-edible (Ingredient) Bool)

; Declare constants
(declare-const shrimp-scampi Food)
(declare-const plastic-material Ingredient)
(declare-const shrimp Ingredient)
(declare-const garlic Ingredient)
(declare-const butter Ingredient)
(declare-const lemon Ingredient)
(declare-const pasta Ingredient)

; Knowledge base: Shrimp scampi is a standard dish
(assert (is-standard-dish shrimp-scampi))

; Knowledge base: Standard ingredients of shrimp scampi
(assert (has-ingredient shrimp-scampi shrimp))
(assert (has-ingredient shrimp-scampi garlic))
(assert (has-ingredient shrimp-scampi butter))
(assert (has-ingredient shrimp-scampi lemon))
(assert (has-ingredient shrimp-scampi pasta))

; Knowledge base: All standard ingredients are edible
(assert (is-edible shrimp))
(assert (is-edible garlic))
(assert (is-edible butter))
(assert (is-edible lemon))
(assert (is-edible pasta))

; Knowledge base: Plastic is not edible
(assert (is-plastic plastic-material))
(assert (not (is-edible plastic-material)))

; Rule: Standard dishes only contain edible ingredients
(assert (forall ((f Food) (i Ingredient))
  (=> (and (is-standard-dish f) (has-ingredient f i))
      (is-edible i))))

; Rule: Nothing can be both plastic and edible
(assert (forall ((i Ingredient))
  (=> (is-plastic i)
      (not (is-edible i)))))

; Test: Can shrimp scampi contain plastic?
; If this leads to unsat, then shrimp scampi is definitely free of plastic
(assert (has-ingredient shrimp-scampi plastic-material))

; Check satisfiability
(check-sat)
; Expected: unsat (shrimp scampi cannot contain plastic as an ingredient)

; Get model to see the contradiction
(get-model)