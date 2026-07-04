; Question: If you add water to rice pudding is it horchata?
; This tests whether adding water to rice pudding transforms it into horchata

; Declare sorts
(declare-sort Food 0)
(declare-sort Liquid 0)
(declare-sort Ingredient 0)

; Declare functions
(declare-fun has-base-liquid (Food Liquid) Bool)
(declare-fun contains-ingredient (Food Ingredient) Bool)
(declare-fun is-horchata (Food) Bool)
(declare-fun is-rice-pudding (Food) Bool)
(declare-fun is-transformed-to (Food Food) Bool)

; Declare constants
(declare-const rice-pudding Food)
(declare-const horchata Food)
(declare-const milk Liquid)
(declare-const water Liquid)
(declare-const cinnamon Ingredient)
(declare-const sugar Ingredient)

; Knowledge Base: Rice pudding properties
(assert (is-rice-pudding rice-pudding))
(assert (has-base-liquid rice-pudding milk))
(assert (contains-ingredient rice-pudding sugar))

; Knowledge Base: Horchata properties
(assert (is-horchata horchata))
(assert (has-base-liquid horchata water))
(assert (contains-ingredient horchata cinnamon))
(assert (contains-ingredient horchata sugar))

; Rule 1: For something to be horchata, it must have water as base liquid
(assert (forall ((f Food))
  (=> (is-horchata f)
      (has-base-liquid f water))))

; Rule 2: Rice pudding has milk as base liquid
(assert (forall ((f Food))
  (=> (is-rice-pudding f)
      (has-base-liquid f milk))))

; Rule 3: A food cannot have both milk and water as its primary base liquid
(assert (forall ((f Food))
  (=> (has-base-liquid f milk)
      (not (has-base-liquid f water)))))

; Rule 4: Horchata requires cinnamon as a defining ingredient
(assert (forall ((f Food))
  (=> (is-horchata f)
      (contains-ingredient f cinnamon))))

; Rule 5: Rice pudding does not contain cinnamon
(assert (not (contains-ingredient rice-pudding cinnamon)))

; Rule 6: Adding water to rice pudding doesn't change its base liquid from milk
; The milk remains the primary base even if water is added
(assert (forall ((f Food))
  (=> (is-rice-pudding f)
      (has-base-liquid f milk))))

; TEST: If we add water to rice pudding, does it become horchata?
; We assert that rice-pudding (with water added) is horchata
(assert (is-horchata rice-pudding))

; Check satisfiability
(check-sat)
; Expected: unsat (FALSE - adding water to rice pudding does NOT make it horchata)
; Reason: Rice pudding has milk as base, horchata requires water as base
; Rice pudding lacks cinnamon which horchata requires