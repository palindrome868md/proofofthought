; Modeling Budgeting Loan eligibility and testing the question:
; "Am I eligible for a Budgeting Loan?"

; 1) Declare sorts
(declare-sort Person 0)

; 2) Declare predicates
(declare-fun has-6months-benefits (Person) Bool)
(declare-fun currently-claiming-UC (Person) Bool)
(declare-fun total-debt (Person) Int)
(declare-fun budgeting-loan-eligible (Person) Bool)

; 3) Declare individual representing "you"
(declare-const you Person)

; 4) Rules: Eligibility condition
; You may be eligible if you've had benefits for 6 months,
; you're not currently claiming Universal Credit, and total debt <= 1500.
(assert (forall ((p Person))
  (=> (and (has-6months-benefits p)
           (not (currently-claiming-UC p))
           (<= (total-debt p) 1500))
      (budgeting-loan-eligible p))))

; 5) Scenario / KB assertions for "you"
(assert (has-6months-benefits you))
(assert (not (currently-claiming-UC you)))
(assert (<= (total-debt you) 1500))

; 6) Test: Are you eligible?
; Directly test the scenario by asserting the conclusion to be true.
(assert (budgeting-loan-eligible you))

; 7) Check satisfiability and optionally inspect a model
(check-sat)
(get-model)