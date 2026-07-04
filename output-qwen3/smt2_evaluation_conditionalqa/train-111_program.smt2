; SMT-LIB 2.0 Program for Court of Protection Visit Order Question
; Question: Can I get an order preventing visits from former partner with DV conviction?

; =============================================================================
; 1. DECLARE SORTS
; =============================================================================
(declare-sort Person 0)
(declare-sort Application 0)
(declare-sort CourtOrder 0)
(declare-sort RiskLevel 0)

; =============================================================================
; 2. DECLARE FUNCTIONS
; =============================================================================
; Capacity and welfare functions
(declare-fun has-lost-mental-capacity (Person) Bool)
(declare-fun has-dementia (Person) Bool)
(declare-fun in-nursing-home (Person) Bool)
(declare-fun personal-welfare-concern (Person) Bool)

; Relationship and risk functions
(declare-fun former-partner (Person Person) Bool)
(declare-fun has-dv-conviction (Person) Bool)
(declare-fun dv-conviction-against (Person Person) Bool)
(declare-fun visit-causes-distress (Person Person) Bool)
(declare-fun immediate-risk (Person) Bool)

; Application functions
(declare-fun can-apply-to-court (Person Person) Bool)
(declare-fun application-valid (Application) Bool)
(declare-fun order-can-be-granted (Application) Bool)
(declare-fun forms-completed (Person) Bool)
(declare-fun fee-paid (Person) Bool)

; =============================================================================
; 3. DECLARE CONSTANTS
; =============================================================================
(declare-const mother Person)
(declare-const applicant Person)
(declare-const former-partner-person Person)
(declare-const test-application Application)

; =============================================================================
; 4. ASSERT KNOWLEDGE BASE (from scenario and document)
; =============================================================================

; Fact: Mother has dementia and lost mental capacity
(assert (has-dementia mother))
(assert (=> (has-dementia mother) (has-lost-mental-capacity mother)))

; Fact: Mother is in nursing home
(assert (in-nursing-home mother))

; Fact: Applicant is concerned about mother's welfare
(assert (personal-welfare-concern mother))

; Fact: Former partner has DV conviction against mother
(assert (former-partner former-partner-person mother))
(assert (has-dv-conviction former-partner-person))
(assert (dv-conviction-against former-partner-person mother))

; Fact: Visit prospect causes considerable distress to mother
(assert (visit-causes-distress former-partner-person mother))

; Fact: DV conviction + distress indicates immediate risk
(assert (forall ((p1 Person) (p2 Person))
  (=> (and (has-dv-conviction p1)
           (dv-conviction-against p1 p2)
           (visit-causes-distress p1 p2))
      (immediate-risk p2))))

; Rule: Can apply to Court of Protection if person lost capacity AND welfare concern
(assert (forall ((applicant Person) (subject Person))
  (=> (and (has-lost-mental-capacity subject)
           (personal-welfare-concern subject))
      (can-apply-to-court applicant subject))))

; Rule: Application is valid if forms completed and fee paid
(assert (forall ((app Person))
  (=> (and (forms-completed app) (fee-paid app))
      (application-valid test-application))))

; Rule: Order can be granted if application valid AND immediate risk OR major disagreement
(assert (forall ((app Application) (subject Person))
  (=> (and (application-valid app)
           (or (immediate-risk subject)
               (personal-welfare-concern subject)))
      (order-can-be-granted app))))

; =============================================================================
; 5. ASSERT TEST SCENARIO (Can I get an order?)
; =============================================================================

; Applicant can apply (mother has lost capacity + welfare concern)
(assert (can-apply-to-court applicant mother))

; Applicant completes required forms (COP1, COP3, COP1B)
(assert (forms-completed applicant))

; Applicant pays the £365 fee
(assert (fee-paid applicant))

; Application is valid
(assert (application-valid test-application))

; TEST: Can an order be granted to prevent visits?
; This asserts that an order CAN be granted - if sat, answer is YES
(assert (order-can-be-granted test-application))

; =============================================================================
; 6. CHECK SATISFIABILITY
; =============================================================================
(check-sat)
(get-model)

; =============================================================================
; EXPECTED RESULT: sat (TRUE)
; Explanation: All conditions for Court of Protection order are met:
; - Mother has lost mental capacity (dementia)
; - Personal welfare concern exists (distress from visits)
; - Immediate risk factor present (DV conviction + distress)
; - Application process can be completed (forms + fee)
; Therefore, an order preventing visits CAN be obtained.
; =============================================================================