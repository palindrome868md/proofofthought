; Inheritance Tax payment from deceased's account

; Declare sorts
(declare-sort Person 0)

; Predicates
(declare-fun is-personal-representative (Person) Bool)
(declare-fun can-pay-from-deceased-account (Person) Bool)

; Constants
(declare-const you Person)

; Knowledge base
; If someone is a personal representative, they can pay from the deceased's account
(assert (forall ((p Person))
  (=> (is-personal-representative p)
      (can-pay-from-deceased-account p))))

; Facts: you are the personal representative
(assert (is-personal-representative you))

; Test scenario: Can you pay from the deceased's account?
(assert (can-pay-from-deceased-account you))

; Check satisfiability
(check-sat)
(get-model)