; SMT-LIB 2.0 Program to verify PAYE requirements for child employment
; Question: Do I have to ask the salary to be paid thru PAYE for a 10-year-old in TV?

; Declare sorts
(declare-sort Age 0)
(declare-sort EmploymentType 0)
(declare-sort Currency 0)

; Declare functions
(declare-fun child-age () Int)
(declare-fun total-income () Int)
(declare-fun weekly-income () Int)
(declare-fun is-tv-work () Bool)
(declare-fun requires-paye () Bool)
(declare-fun requires-performance-licence () Bool)
(declare-fun under-school-leaving-age () Bool)
(declare-fun income-over-personal-allowance () Bool)
(declare-fun income-over-120-per-week () Bool)

; Declare constants
(declare-const personal-allowance Int)

; Knowledge Base - Rules from the document

; Rule 1: Personal allowance threshold
(assert (= personal-allowance 12570))

; Rule 2: Child is 10 years old
(assert (= child-age 10))

; Rule 3: Under school leaving age (16 in England)
(assert (= under-school-leaving-age true))

; Rule 4: TV work requires performance licence
(assert is-tv-work)
(assert requires-performance-licence)

; Rule 5: Total income is £10,000 for 6 months
(assert (= total-income 10000))

; Rule 6: Weekly income calculation (£10,000 / 26 weeks ≈ £385)
(assert (= weekly-income 385))

; Rule 7: Income over £120 per week threshold
(assert (= income-over-120-per-week true))

; Rule 8: Income comparison with personal allowance
(assert (= income-over-personal-allowance 
         (>= total-income personal-allowance)))

; Rule 9: PAYE requirement rule - Age 16+
; "Once someone reaches 16, you may need to pay them through PAYE"
(assert (forall ((age Int))
  (=> (>= age 16)
      (requires-paye))))

; Rule 10: PAYE requirement rule - Under 16 with income over personal allowance
; "Children under 16 do not pay National Insurance, so you only need to 
;  include them on your payroll if their total income is over their Personal Allowance"
(assert (=> (and under-school-leaving-age 
                 (not income-over-personal-allowance))
            (not requires-paye)))

; Rule 11: £120/week rule applies to employees 16+
; "If you pay any employee over £120 a week you must be registered as an employer and operate PAYE"
; This rule is superseded by age-based rules for children under 16
(assert (=> (and (>= child-age 16) income-over-120-per-week)
            requires-paye))

; Test: Verify PAYE is NOT required for this 10-year-old child
; We assert that PAYE IS required and check for unsatisfiability
(assert requires-paye)

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat (PAYE is NOT required)
; Reasoning: Child is 10 (under 16), income £10,000 is below personal allowance £12,570
; Therefore PAYE does not apply despite weekly income exceeding £120