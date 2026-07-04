; -------------------------------------------------
; Sorts
(declare-sort Person 0)

; -------------------------------------------------
; Functions (predicates)
(declare-fun agrees_to_pay_installments (Person) Bool)
(declare-fun interest_payable (Person) Bool)

; -------------------------------------------------
; Constant representing the beneficiary / asker
(declare-const me Person)

; -------------------------------------------------
; Knowledge base: paying in instalments implies interest
(assert
  (forall ((p Person))
    (=> (agrees_to_pay_installments p)
        (interest_payable p))))

; -------------------------------------------------
; Scenario: the beneficiary agrees to pay in instalments
(assert (agrees_to_pay_installments me))

; -------------------------------------------------
; Query: is interest payable?
(assert (interest_payable me))

; -------------------------------------------------
(check-sat)   ; Expected result: sat  (interest is payable)
(get-model)