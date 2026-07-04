; High Income Child Benefit Tax Charge Verification
; Question: Do we have to pay the tax charge with combined income just over £50,000?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort IncomeLevel 0)

; 2. Declare functions
(declare-fun individual-income (Person) Int)
(declare-fun combined-income () Int)
(declare-fun receives-child-benefit (Person) Bool)
(declare-fun must-pay-tax-charge (Person) Bool)
(declare-fun income-exceeds-threshold (Person) Bool)

; 3. Declare constants
(declare-const partner1 Person)
(declare-const partner2 Person)
(declare-const threshold Int)

; 4. Assert knowledge base from document

; Threshold is £50,000 individual income
(assert (= threshold 50000))

; Rule: Individual income exceeds threshold if > 50000
(assert (forall ((p Person))
  (=> (> (individual-income p) threshold)
      (income-exceeds-threshold p))))

; Rule: Tax charge applies if individual income > 50000 AND someone receives child benefit
(assert (forall ((p Person))
  (=> (and (income-exceeds-threshold p)
           (or (receives-child-benefit partner1)
               (receives-child-benefit partner2)))
      (must-pay-tax-charge p))))

; Rule: If both partners exceed threshold, higher income pays
(assert (forall ((p1 Person) (p2 Person))
  (=> (and (income-exceeds-threshold p1)
           (income-exceeds-threshold p2)
           (> (individual-income p1) (individual-income p2)))
      (must-pay-tax-charge p1))))

; 5. Assert scenario facts
; Combined income is just over £50,000 (e.g., £51,000)
(assert (= (combined-income) 51000))

; Combined income = partner1 + partner2
(assert (= (combined-income) (+ (individual-income partner1) (individual-income partner2))))

; Critical: Individual incomes could both be under threshold
; (e.g., £26,000 + £25,000 = £51,000 combined, but neither exceeds £50,000)
(assert (< (individual-income partner1) threshold))
(assert (< (individual-income partner2) threshold))

; Assume they receive child benefit (to test worst case)
(assert (receives-child-benefit partner1))

; 6. Test: Do we have to pay the tax charge?
; Assert that tax charge must be paid and check satisfiability
(assert (must-pay-tax-charge partner1))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reason: Individual incomes are both under £50,000 threshold
; Combined income being over £50,000 does NOT trigger the tax charge
; The charge is based on INDIVIDUAL income, not combined income