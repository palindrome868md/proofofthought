; Sorts
(declare-sort Person 0)

; Entities
(declare-const you Person)
(declare-const partner Person)

; Properties
(declare-fun income (Person) Int)
(declare-fun cb (Person) Bool)

; Derived test: would-we-pay-the-charge
(define-fun would-pay () Bool
  (or (and (> (income you) 50000) (cb you))
      (and (> (income partner) 50000) (cb partner))))

; Scenario: combined income just over £50k
(assert (> (+ (income you) (income partner)) 50000))

; Concrete values for scenario
(assert (= (income you) 26000))
(assert (= (income partner) 25000))

; Test the question: Do we have to pay the High Income Child Benefit Tax Charge?
(assert would-pay)

; Check satisfiability (one and only one check-sat as required)
(check-sat)