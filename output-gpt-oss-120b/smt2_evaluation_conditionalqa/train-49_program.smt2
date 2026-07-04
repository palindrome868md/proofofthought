;--- Sorts ---------------------------------------------------------
; (Only built‑in sorts are needed)

;--- Constants -----------------------------------------------------
(declare-const home_value Int)          ; value of the inherited house
(declare-const gifts_total Int)         ; total value of gifts in last 7 years
(declare-const estate_total Int)        ; total value of the whole estate
(declare-const is_child_beneficiary Bool) ; house left to a child
(declare-const estate_under_2m Bool)    ; whole estate < £2,000,000

;--- Numerical thresholds -----------------------------------------
(define-fun base_threshold () Int 325000)          ; normal nil‑rate band
(define-fun child_home_threshold () Int 500000)   ; increased band for child

;--- Effective thresholds -----------------------------------------
(define-fun effective_threshold () Int
  (ite (and is_child_beneficiary estate_under_2m)
       child_home_threshold
       base_threshold))

;--- Tax liability predicates ---------------------------------------
; Property tax is due if the value of the house exceeds the effective threshold
(define-fun property_tax_due () Bool
  (> home_value effective_threshold))

; Gift tax is due if total gifts in the last 7 years exceed £325 000
(define-fun gift_tax_due () Bool
  (> gifts_total base_threshold))

;--- Knowledge base (the concrete facts) ---------------------------
(assert (= home_value 400000))          ; father's house value
(assert (= gifts_total 250000))         ; gifts given to siblings and self
(assert (= estate_total (+ home_value 0))) ; assume only the house matters
(assert (= is_child_beneficiary true))  ; the house goes to a child (you)
(assert (= estate_under_2m true))       ; estate is < £2 million

;--- Test the question: “Is any inheritance tax payable?”
; We assert that either property tax or gift tax is due.
(assert (or property_tax_due gift_tax_due))

;--- Check satisfiability -----------------------------------------
(check-sat)   ; Expected result: unsat (no tax is payable)
(get-model)  ; Optional: show the model (will be empty because unsat)