; Reasoning Steps:
; 1. Analyze the Question: "Can I make the payment from deceased father's account?"
;    - This is a possibility/permission question regarding Inheritance Tax payment.
;    - We need to verify if the provided document allows using the deceased's account for this purpose.
;
; 2. Extract Knowledge from Document:
;    - Section "Pay from accounts owned by the deceased": Explicitly states "You can pay using the deceased's: bank accounts".
;    - Section "From the deceased's bank account": Describes the "Direct Payment Scheme" where banks can pay HMRC from the deceased's accounts.
;    - Condition: The account must be owned by the deceased person.
;
; 3. Formulate Logic:
;    - Sorts: Person (for father, me), Account (for bank accounts).
;    - Predicates: is-deceased, owned-by, is-bank-account, can-pay-iht-from.
;    - Rule: For all persons p and accounts a, if p is deceased AND p owns a AND a is a bank account, THEN one can pay IHT from a.
;    - Facts: Father is deceased. Father owns the account. The account is a bank account.
;    - Test: Assert that payment can be made from father's account.
;
; 4. Verification Strategy:
;    - Assert Knowledge Base (Facts + Rule).
;    - Assert Test Scenario (can-pay-iht-from is true for father's account).
;    - Check Satisfiability.
;    - Expected Result: sat (True), indicating the action is permitted/possible.

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Account 0)

; 2. Declare functions
(declare-fun is-deceased (Person) Bool)
(declare-fun owned-by (Person Account) Bool)
(declare-fun is-bank-account (Account) Bool)
(declare-fun can-pay-iht-from (Account) Bool)

; 3. Declare constants
(declare-const father Person)
(declare-const me Person)
(declare-const father-account Account)

; 4. Assert knowledge base
; Fact: Father is deceased (Scenario: "He has died six months back")
(assert (is-deceased father))

; Fact: Father owns the account (Scenario: "deceased father's account")
(assert (owned-by father father-account))

; Fact: It is a bank account (Context: "estate", Document: "bank accounts")
(assert (is-bank-account father-account))

; Rule: Document states "You can pay using the deceased's: bank accounts"
; and describes the "Direct Payment Scheme" for deceased's accounts.
(assert (forall ((p Person) (a Account))
  (=> (and (is-deceased p) (owned-by p a) (is-bank-account a))
      (can-pay-iht-from a))))

; 5. Test Scenario: Can I make the payment from deceased father's account?
; We assert that the payment can be made from this account and check satisfiability.
(assert (can-pay-iht-from father-account))

; 6. Check satisfiability
; Expected: sat (True) - The document permits this action.
(check-sat)
(get-model)