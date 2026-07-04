; Shared Parental Leave and Pay Benefit Eligibility Analysis
; Question: Can both parents receive benefits if working full-time without taking leave?

; Declare sorts
(declare-sort Parent 0)

; Declare functions for eligibility criteria
(declare-fun is-employee (Parent) Bool)           ; Must be employee (not worker) for SPL
(declare-fun earns-enough (Parent) Bool)          ; Must earn at least £120/week for ShPP
(declare-fun employed-26-weeks (Parent) Bool)     ; 26 weeks continuous employment
(declare-fun takes-spl (Parent) Bool)             ; Actually taking Shared Parental Leave
(declare-fun gave-binding-notice (Parent) Bool)   ; Gave notice to end maternity pay
(declare-fun eligible-for-shpp (Parent) Bool)     ; Eligible for Statutory Shared Parental Pay
(declare-fun receives-shpp-benefit (Parent) Bool) ; Actually receives ShPP benefit

; Declare constants for the parents
(declare-const mother Parent)
(declare-const partner Parent)

; =============================================================================
; KNOWLEDGE BASE: Eligibility Rules from Document
; =============================================================================

; Rule 1: To be eligible for ShPP, must earn at least £120/week average
(assert (forall ((p Parent))
  (=> (eligible-for-shpp p) (earns-enough p))))

; Rule 2: To be eligible for ShPP, must be employee (not worker) for SPL component
(assert (forall ((p Parent))
  (=> (eligible-for-shpp p) (is-employee p))))

; Rule 3: To RECEIVE ShPP benefit, must actually be taking SPL
; (ShPP is paid during Shared Parental Leave periods)
(assert (forall ((p Parent))
  (=> (receives-shpp-benefit p) (takes-spl p))))

; Rule 4: To start ShPP, mother must give binding notice to end maternity pay
(assert (forall ((p Parent))
  (=> (receives-shpp-benefit p) (gave-binding-notice p))))

; Rule 5: ShPP eligibility requires meeting employment criteria
(assert (forall ((p Parent))
  (=> (eligible-for-shpp p) (employed-26-weeks p))))

; =============================================================================
; SCENARIO: Both parents working full-time, neither taking leave
; =============================================================================

; Mother meets basic employment criteria
(assert (is-employee mother))
(assert (earns-enough mother))
(assert (employed-26-weeks mother))

; Partner meets basic employment criteria  
(assert (is-employee partner))
(assert (earns-enough partner))
(assert (employed-26-weeks partner))

; CRITICAL: Both parents working full-time = NOT taking Shared Parental Leave
(assert (not (takes-spl mother)))
(assert (not (takes-spl partner)))

; They may have given binding notice (allowing ShPP eligibility)
(assert (gave-binding-notice mother))

; =============================================================================
; VERIFICATION: Can they receive ShPP benefit while both working full-time?
; =============================================================================

; Test assertion: At least one parent receives ShPP benefit
(assert (or (receives-shpp-benefit mother) (receives-shpp-benefit partner)))

; Check satisfiability
(check-sat)

; Get model to see the result
(get-model)

; =============================================================================
; EXPECTED RESULT: unsat
; Reason: ShPP benefit requires actually taking SPL (takes-spl = true)
; But scenario states both work full-time (takes-spl = false for both)
; This creates a contradiction, proving they CANNOT receive ShPP benefit
; while both working full-time without taking leave.
; =============================================================================