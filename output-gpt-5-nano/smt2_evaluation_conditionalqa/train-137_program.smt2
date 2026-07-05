; Determine if the tax on income from Child Benefit can be waived when income > £50,000

; Declare incomes and the waiver flag
(declare-const my-income Int)
(declare-const partner-income Int)
(declare-const tax-waived Bool)

; Knowledge base / Scenario
; Husband's income is £52,000
(assert (= partner-income 52000))
; Scenario: at least one income is over £50,000
(assert (> partner-income 50000))

; If income over £50k (by either person), tax waiver cannot apply
; (This models the High Income Child Benefit Tax Charge as not waivable under the given scenario)
(assert (=> (or (> my-income 50000) (> partner-income 50000)) (not tax-waived)))

; Test scenario: Can the tax be waived? (assert a waiving condition)
(assert tax-waived)

; Check satisfiability to determine the answer
(check-sat)