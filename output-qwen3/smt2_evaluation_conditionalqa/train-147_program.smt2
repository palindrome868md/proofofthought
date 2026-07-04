; Declare sorts
(declare-sort Person 0)
(declare-sort Benefit 0)

; Declare constants for benefits
(declare-const REA Benefit)
(declare-const RetirementAllowance Benefit)

; Declare functions
(declare-fun age (Person) Int)
(declare-fun in-regular-employment (Person) Bool)
(declare-fun currently-receiving (Person Benefit) Bool)
(declare-fun eligible-for (Person Benefit) Bool)
(declare-fun state-pension-age () Int)

; Declare the person in the scenario
(declare-const test-person Person)

; Knowledge Base: State pension age is 66
(assert (= (state-pension-age) 66))

; Knowledge Base: REA replacement rule
; "Reduced Earnings Allowance will be replaced by Retirement Allowance if both:
;  - you reach State Pension age
;  - you're not in regular employment"
(assert (forall ((p Person))
  (=> (and (>= (age p) (state-pension-age))
           (not (in-regular-employment p)))
      (not (eligible-for p REA)))))

; Knowledge Base: When REA is replaced, Retirement Allowance applies
(assert (forall ((p Person))
  (=> (and (>= (age p) (state-pension-age))
           (not (in-regular-employment p))
           (currently-receiving p REA))
      (eligible-for p RetirementAllowance))))

; Assert the person's current circumstances
; Currently getting REA
(assert (currently-receiving test-person REA))

; Not in regular work
(assert (not (in-regular-employment test-person)))

; Will soon turn 66 (at or above state pension age)
(assert (>= (age test-person) 66))

; Test: Will the person still be eligible for REA?
; We assert they ARE eligible and check for contradiction
(assert (eligible-for test-person REA))

; Check satisfiability
(check-sat)
(get-model)