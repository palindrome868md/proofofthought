; 1. Declare Sorts
(declare-sort Person 0)
(declare-datatypes () ((BenefitType (IncomeSupport) (JobseekersAllowance) (EmploymentSupportAllowance))))
(declare-datatypes () ((StopReason (ReturnFullTime) (WorkMoreHours) (EarnMoreMoney))))

; 2. Declare Functions
; Benefit claims
(declare-fun claimed-benefit (Person BenefitType) Bool)
; Reason for stopping benefit
(declare-fun stopped-reason (Person StopReason) Bool)
; Durations in weeks
(declare-fun claim-duration-weeks (Person) Int)
(declare-fun expected-work-duration-weeks (Person) Int)
; Housing costs
(declare-fun had-housing-support (Person) Bool)
(declare-fun has-housing-costs (Person) Bool)
; Eligibility predicate
(declare-fun eligible-for-run-on (Person) Bool)

; 3. Declare Constants
(declare-const me Person)

; 4. Assert Knowledge Base (Rules from Document)
; Rule 1: Must have stopped getting specific benefits
(assert (forall ((p Person))
  (=> (eligible-for-run-on p)
      (or (claimed-benefit p IncomeSupport)
          (claimed-benefit p JobseekersAllowance)
          (claimed-benefit p EmploymentSupportAllowance)))))

; Rule 2: Reason for stopping must be work related
(assert (forall ((p Person))
  (=> (eligible-for-run-on p)
      (or (stopped-reason p ReturnFullTime)
          (stopped-reason p WorkMoreHours)
          (stopped-reason p EarnMoreMoney)))))

; Rule 3: Claim duration must be at least 26 weeks
(assert (forall ((p Person))
  (=> (eligible-for-run-on p)
      (>= (claim-duration-weeks p) 26))))

; Rule 4: Expected work duration must be at least 5 weeks
(assert (forall ((p Person))
  (=> (eligible-for-run-on p)
      (>= (expected-work-duration-weeks p) 5))))

; Rule 5: Must have had housing support before
(assert (forall ((p Person))
  (=> (eligible-for-run-on p)
      (had-housing-support p))))

; Rule 6: Must still have housing costs
(assert (forall ((p Person))
  (=> (eligible-for-run-on p)
      (has-housing-costs p))))

; 5. Assert Scenario Facts
; Fact: Was getting Income Support
(assert (claimed-benefit me IncomeSupport))

; Fact: Moving to full time role (Reason: ReturnFullTime)
(assert (stopped-reason me ReturnFullTime))

; Fact: Previously claiming support for mortgage interest (Had housing support)
(assert (had-housing-support me))

; Fact: Want money to cover house costs (Has housing costs)
(assert (has-housing-costs me))

; Note: Durations are not explicitly stated in the scenario, 
; so they are left unconstrained to test consistency/possibility.

; 6. Verification: Test Eligibility
; Question: "Will I be eligible to apply for Mortgage Interest Run On?"
; We assert the eligibility predicate and check satisfiability.
; Sat = True (Eligible is consistent with facts)
; Unsat = False (Eligible contradicts facts)
(assert (eligible-for-run-on me))

; 7. Check Satisfiability
(check-sat)
(get-model)