; Sorts
(declare-sort Person 0)

; Functions
(declare-fun has-probate (Person) Bool)
(declare-fun can-pay-from-deceased-account (Person) Bool)

; Constants
(declare-const claimant Person)

; Knowledge base: claimant has probate
(assert (has-probate claimant))

; Rule: If someone has probate, they can pay from the deceased's accounts
(assert (forall ((p Person)) (=> (has-probate p) (can-pay-from-deceased-account p))))

; Test scenario: Can claimant pay from the deceased's bank accounts?
(assert (can-pay-from-deceased-account claimant))

; Check satisfiability and provide a model
(check-sat)
(get-model)