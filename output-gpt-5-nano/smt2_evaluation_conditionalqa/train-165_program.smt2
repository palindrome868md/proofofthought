; Sorts
(declare-sort Person 0)

; Functions (predicates and helpers)
(declare-fun on-income-support (Person) Bool)
(declare-fun exemption (Person) Bool)
(declare-fun reduction (Person) Bool)
(declare-fun can-get (Person) Bool)
(declare-fun final-cost (Person) Int)

; Constants
(declare-const you Person)

; Optional cost reference (82 pounds to register)
(declare-const base-cost Int)
(assert (= base-cost 82))

; Knowledge base (claims about financial assistance for LPA)
; If you are on Income Support, you may be eligible for exemption or a reduction
(assert (on-income-support you))
(assert (=> (on-income-support you) (exemption you)))
(assert (=> (on-income-support you) (reduction you)))

; If exemption or reduction applies, you can get financial assistance
(assert (=> (exemption you) (can-get you)))
(assert (=> (reduction you) (can-get you)))

; Cost implications (exemption/reduction may reduce cost to 0)
(assert (=> (exemption you) (= (final-cost you) 0)))
(assert (=> (reduction you) (= (final-cost you) 0)))
; If neither exemption nor reduction applies, cost remains the base cost
(assert (=> (and (not (exemption you)) (not (reduction you))) (= (final-cost you) base-cost)))

; Test scenario: Can you get financial assistance?
; This asserts the query that you can get financial assistance
(assert (can-get you))

; Verification
(check-sat)
(get-model)