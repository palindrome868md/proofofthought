; Sorts
(declare-sort Creature 0)

; Constants
(declare-const andre Creature)
(declare-const hypothetical-yeti Creature)

; Functions
(declare-fun height (Creature) Int)
(declare-fun is-yeti (Creature) Bool)

; Knowledge base
; Andre's height (in cm)
(assert (= (height andre) 224))

; Hypothetical Yeti is indeed a Yeti
(assert (is-yeti hypothetical-yeti))

; Hypothetical Yeti height is positive
(assert (> (height hypothetical-yeti) 0))

; Test: Would Andre tower over a hypothetical Yeti?
; i.e., is Andre taller than this Yeti?
(assert (> (height andre) (height hypothetical-yeti)))

; Check satisfiability for the scenario
(check-sat)
(get-model)