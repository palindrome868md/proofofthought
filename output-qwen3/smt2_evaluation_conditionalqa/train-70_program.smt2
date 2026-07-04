; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Account 0)

; 2. Declare functions
(declare-fun has-probate (Person) Bool)
(declare-fun has-ref-num (Person) Bool)
(declare-fun is-deceased-account (Account) Bool)
(declare-fun can-pay-from (Person Account) Bool)

; 3. Declare constants
(declare-const user Person)
(declare-const father-account Account)

; 4. Assert knowledge base (facts & rules from document)
; Rule: Probate grants the right to deal with the deceased's property/money
; Document: "Probate is the right to deal with the deceased person's property, money and possessions."
; Document: "You can pay using the deceased's: bank accounts"
; Rule: A payment reference number is required to pay
; Document: "You'll need to get a payment reference number before you can pay your Inheritance Tax bill."
(assert (forall ((p Person) (a Account))
  (=> (and (has-probate p) 
           (has-ref-num p) 
           (is-deceased-account a))
      (can-pay-from p a))))

; 5. Assert Scenario Facts
; Fact: User has been granted probate
(assert (has-probate user))
; Fact: User has received a Payment Reference Number
(assert (has-ref-num user))
; Fact: The account belongs to the deceased father
(assert (is-deceased-account father-account))

; 6. Test Question: Is it possible to pay the bill using funds from the late father's bank account?
; We assert the action is possible and check for consistency (sat = True)
(assert (can-pay-from user father-account))

; 7. Check satisfiability
(check-sat)
(get-model)