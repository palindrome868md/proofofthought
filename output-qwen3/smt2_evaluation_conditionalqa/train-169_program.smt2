; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-registered-blind (Person) Bool)
(declare-fun is-in-england (Person) Bool)
(declare-fun has-spouse (Person) Bool)
(declare-fun lives-with-spouse (Person) Bool)
(declare-fun earns-enough-for-allowance (Person) Bool)
(declare-fun can-claim-bpa (Person) Bool)
(declare-fun can-transfer-bpa (Person) Bool)

; 3. Declare constants
(declare-const user Person)

; 4. Assert Knowledge Base (Rules from Document)
; Rule: Eligibility for Claim (England)
; "You can claim Blind Person's Allowance if... you're registered with your local council as blind... England"
(assert (forall ((p Person))
  (=> (and (is-in-england p) (is-registered-blind p))
      (can-claim-bpa p))))

; Rule: Eligibility for Transfer
; "You can transfer your Blind Person's Allowance to your spouse... if you do not pay tax or earn enough to use all of it."
; "if you're married... living with your spouse"
(assert (forall ((p Person))
  (=> (and (can-claim-bpa p)
           (has-spouse p)
           (lives-with-spouse p)
           (not (earns-enough-for-allowance p)))
      (can-transfer-bpa p))))

; 5. Assert Scenario Facts
; "live in England"
(assert (is-in-england user))
; "registered blind with my local council"
(assert (is-registered-blind user))
; "share with my wife"
(assert (has-spouse user))
(assert (lives-with-spouse user))
; "wife, who works part-time to provide for us" -> Implies user does not earn enough to use allowance
(assert (not (earns-enough-for-allowance user)))

; 6. Test: Can I claim Blind Person's Allowance AND transfer it to my wife?
(assert (can-claim-bpa user))
(assert (can-transfer-bpa user))

; 7. Check satisfiability
(check-sat)
(get-model)