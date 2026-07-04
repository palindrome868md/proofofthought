; Mortgage Interest Run On Eligibility Verification

; Declare sorts
(declare-sort Person 0)
(declare-sort Benefit 0)

; Declare functions
(declare-fun weeks-claimed (Person Benefit) Int)
(declare-fun work-hours-before (Person) Int)
(declare-fun work-hours-after (Person) Int)
(declare-fun work-will-last-weeks (Person) Int)
(declare-fun had-housing-costs-before (Person) Bool)
(declare-fun still-has-housing-costs (Person) Bool)
(declare-fun receiving-benefit (Person Benefit) Bool)
(declare-fun stopped-benefit-due-to-work (Person Benefit) Bool)
(declare-fun eligible-for-run-on (Person Benefit) Bool)

; Declare constants
(declare-const claimant Person)
(declare-const income-support Benefit)

; Knowledge Base: Eligibility Rules for Mortgage Interest Run On

; Rule 1: Must have been claiming benefit continuously for at least 26 weeks
(assert (forall ((p Person) (b Benefit))
  (=> (eligible-for-run-on p b)
      (>= (weeks-claimed p b) 26))))

; Rule 2: Must expect work to last 5 weeks or more
(assert (forall ((p Person) (b Benefit))
  (=> (eligible-for-run-on p b)
      (>= (work-will-last-weeks p) 5))))

; Rule 3: Must have had housing costs before work started
(assert (forall ((p Person) (b Benefit))
  (=> (eligible-for-run-on p b)
      (had-housing-costs-before p))))

; Rule 4: Must still have housing costs when starting work
(assert (forall ((p Person) (b Benefit))
  (=> (eligible-for-run-on p b)
      (still-has-housing-costs p))))

; Rule 5: Must have stopped benefit due to returning to work full-time, 
; working more hours, or earning more money
(assert (forall ((p Person) (b Benefit))
  (=> (eligible-for-run-on p b)
      (stopped-benefit-due-to-work p b))))

; Rule 6: Stopped benefit due to work means hours increased or returned to full-time
(assert (forall ((p Person) (b Benefit))
  (=> (stopped-benefit-due-to-work p b)
      (or (> (work-hours-after p) (work-hours-before p))
          (>= (work-hours-after p) 35)))))

; Scenario Facts

; Fact 1: Claimant was claiming Income Support for 4 months (approximately 17 weeks)
(assert (= (weeks-claimed claimant income-support) 17))

; Fact 2: Work hours reduced to 10 hours/week 4 months ago
(assert (= (work-hours-before claimant) 10))

; Fact 3: Work hours now increased to 40 hours/week (full-time)
(assert (= (work-hours-after claimant) 40))

; Fact 4: Claimant expects work to last (assume yes for this test)
(assert (>= (work-will-last-weeks claimant) 5))

; Fact 5: Claimant has mortgage (housing costs)
(assert (had-housing-costs-before claimant))
(assert (still-has-housing-costs claimant))

; Fact 6: Claimant stopped Income Support due to increased work hours
(assert (stopped-benefit-due-to-work claimant income-support))

; Fact 7: Claimant was receiving Income Support
(assert (receiving-benefit claimant income-support))

; Test: Can the claimant claim Mortgage Interest Run On?
; We assert they ARE eligible and check if this is satisfiable
(assert (eligible-for-run-on claimant income-support))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reason: weeks-claimed (17) < 26 weeks required for eligibility
; This contradicts Rule 1, making the assertion unsatisfiable