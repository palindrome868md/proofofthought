; ------------------------------------------------------------
; 1. Declare uninterpreted sorts via simple datatypes
; ------------------------------------------------------------
(declare-datatypes () ((Substance menthol other-substance)))
(declare-datatypes () ((Event thanksgiving other-event)))

; ------------------------------------------------------------
; 2. Declare predicates
; ------------------------------------------------------------
(declare-fun is-flavor (Substance) Bool)
(declare-fun associated (Substance Event) Bool)

; ------------------------------------------------------------
; 3. Knowledge base
; ------------------------------------------------------------
; Menthol is a flavor
(assert (is-flavor menthol))

; General rule: no flavor is associated with any event
(assert (forall ((s Substance) (e Event))
          (=> (is-flavor s) (not (associated s e)))))

; ------------------------------------------------------------
; 4. Test the claim "Menthol is associated with Thanksgiving"
; ------------------------------------------------------------
(assert (associated menthol thanksgiving))

; ------------------------------------------------------------
; 5. Check satisfiability (sat = true, unsat = false)
; ------------------------------------------------------------
(check-sat)
(get-model)