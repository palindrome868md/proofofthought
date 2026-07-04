; SMT-LIB 2.0 Program to Verify Paternity Leave Eligibility
; Question: Will I qualify for paternity leave with only 2 months of employment?

; =============================================================================
; 1. DECLARE SORTS
; =============================================================================
(declare-sort Person 0)
(declare-sort Employer 0)

; =============================================================================
; 2. DECLARE FUNCTIONS
; =============================================================================
; Employment status
(declare-fun is-employee (Person) Bool)

; Time calculations (in weeks)
(declare-fun weeks-employed-so-far (Person Employer) Int)
(declare-fun weeks-until-due-date (Person) Int)
(declare-fun weeks-until-qualifying-week (Person) Int)
(declare-fun total-weeks-by-qualifying-week (Person Employer) Int)

; Eligibility predicates
(declare-fun qualifies-for-paternity-leave (Person Employer) Bool)
(declare-fun meets-employment-duration-requirement (Person Employer) Bool)

; =============================================================================
; 3. DECLARE CONSTANTS
; =============================================================================
(declare-const applicant Person)
(declare-const current-employer Employer)

; =============================================================================
; 4. ASSERT KNOWLEDGE BASE (Paternity Leave Rules from Document)
; =============================================================================

; Rule: Qualifying week is 15 weeks before the baby is due
(assert (forall ((p Person))
  (= (weeks-until-qualifying-week p)
     (- (weeks-until-due-date p) 15))))

; Rule: Total weeks employed by qualifying week = current weeks + weeks until qualifying week
(assert (forall ((p Person) (e Employer))
  (= (total-weeks-by-qualifying-week p e)
     (+ (weeks-employed-so-far p e)
        (weeks-until-qualifying-week p)))))

; Rule: Must have at least 26 weeks continuous employment by qualifying week
(assert (forall ((p Person) (e Employer))
  (=> (meets-employment-duration-requirement p e)
      (>= (total-weeks-by-qualifying-week p e) 26))))

; Rule: To qualify for paternity leave, must be employee AND meet duration requirement
(assert (forall ((p Person) (e Employer))
  (=> (qualifies-for-paternity-leave p e)
      (and (is-employee p)
           (meets-employment-duration-requirement p e)))))

; =============================================================================
; 5. ASSERT SCENARIO FACTS
; =============================================================================

; Fact: Applicant is an employee
(assert (is-employee applicant))

; Fact: Applicant has worked for 2 months (approximately 8-9 weeks, use 8 for conservative estimate)
(assert (= (weeks-employed-so-far applicant current-employer) 8))

; Fact: Baby is due in 20 weeks
(assert (= (weeks-until-due-date applicant) 20))

; =============================================================================
; 6. VERIFICATION TEST
; =============================================================================
; Question: Will the applicant qualify for paternity leave?
; We assert they DO qualify and check if this is satisfiable
; If UNSAT, they do NOT qualify (which is the expected answer)

(assert (qualifies-for-paternity-leave applicant current-employer))

; =============================================================================
; 7. CHECK SATISFIABILITY
; =============================================================================
(check-sat)
(get-model)

; =============================================================================
; EXPECTED RESULT ANALYSIS:
; =============================================================================
; weeks-until-qualifying-week = 20 - 15 = 5 weeks
; total-weeks-by-qualifying-week = 8 + 5 = 13 weeks
; Required: 26 weeks
; 13 < 26, so meets-employment-duration-requirement = FALSE
; Therefore: qualifies-for-paternity-leave = FALSE
; Expected: UNSAT (the assertion contradicts the knowledge base)
; =============================================================================