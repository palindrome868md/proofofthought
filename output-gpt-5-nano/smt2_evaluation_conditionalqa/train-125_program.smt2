; Declarations
(declare-sort Person 0)
(declare-const kid Person)
(declare-const kid-age Int)
(declare-const salary Int)
(declare-const annual-income Int)
(declare-const personal-allowance Int)
(declare-fun paye-required (Person) Bool)

; Scenario: a 10-year-old child (kid) involved in a television project earning £10,000 for six months
(assert (= kid-age 10))
(assert (= salary 10000))
; Annualize six-month salary for tax/payroll consideration
(assert (= annual-income (* salary 2)))

; Personal allowance for tax calculation (example value)
(assert (= personal-allowance 12570))

; Rule: If under 16 and annual income > personal allowance, PAYE is required for that child
(assert (=> (< kid-age 16) (> annual-income personal-allowance) (paye-required kid)))

; Test: Do I have to pay via PAYE for this child?
(assert (paye-required kid))

; Check satisfiability to answer the question
(check-sat)
(get-model)