;-------------------------------------------------
; 1. Declare the sort for all beings
(declare-sort Creature 0)

;-------------------------------------------------
; 2. Declare the height function (real-valued)
(declare-fun height (Creature) Real)

;-------------------------------------------------
; 3. Declare the two individuals of interest
(declare-const andre_giant Creature)
(declare-const yeti Creature)

;-------------------------------------------------
; 4. Knowledge base
; Andre the Giant’s (approx.) height = 2.24 m
(assert (= (height andre_giant) 2.24))

; No constraints on the Yeti’s height (hypothetical)

;-------------------------------------------------
; 5. Test the statement:
; “Andre the Giant towers over the Yeti” ≡ Andre is taller than the Yeti
(assert (> (height andre_giant) (height yeti)))

;-------------------------------------------------
; 6. Check satisfiability (sat = possible / true)
(check-sat)
(get-model)