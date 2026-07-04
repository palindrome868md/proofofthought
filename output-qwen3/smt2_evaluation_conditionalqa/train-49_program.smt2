; Inheritance Tax Verification
; Scenario: Father died, left £400,000 home to child, gave £250,000 in gifts over 3 years

; Declare sorts
(declare-sort Money 0)
(declare-sort Asset 0)

; Declare functions for monetary comparisons
(declare-fun estate-value () Int)
(declare-fun gift-value () Int)
(declare-fun residential-threshold () Int)
(declare-fun gift-threshold () Int)
(declare-fun years-before-death () Int)

; Declare constants for scenario
(declare-const home-value Int)
(declare-const total-gifts Int)
(declare-const property-tax-owed Bool)
(declare-const gift-tax-owed Bool)

; Knowledge Base: Inheritance Tax Rules

; Rule 1: Residential threshold when home left to children is £500,000
(assert (= residential-threshold 500000))

; Rule 2: Gift threshold is £325,000 (for 7-year rule)
(assert (= gift-threshold 325000))

; Rule 3: Estate value is the home value (left in will)
(assert (= home-value 400000))
(assert (= estate-value home-value))

; Rule 4: Total gifts given over preceding 3 years
(assert (= total-gifts 250000))
(assert (= gift-value total-gifts))

; Rule 5: Gifts were given within 3 years before death (less than 7)
(assert (= years-before-death 3))
(assert (< years-before-death 7))

; Rule 6: Property tax is owed if estate value exceeds residential threshold
(assert (= property-tax-owed (> estate-value residential-threshold)))

; Rule 7: Gift tax is owed if gifts exceed threshold AND death within 7 years
(assert (= gift-tax-owed (and (> gift-value gift-threshold) (< years-before-death 7))))

; Rule 8: Beneficiaries don't normally pay inheritance tax (estate pays)
; This means we check if estate owes tax, not if beneficiaries owe

; Verification: Will inheritance tax be owed on property or gifts?
; If sat = tax is owed, if unsat = no tax is owed
(assert (or property-tax-owed gift-tax-owed))

; Check satisfiability
(check-sat)
; Expected: unsat (no inheritance tax owed on either property or gifts)

; Get model to see the values
(get-model)