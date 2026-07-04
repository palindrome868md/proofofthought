; SMT-LIB 2.0 Program for Fuel Payment Eligibility Verification
; Based on National Concessionary Fuel Scheme (NCFS) Document

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
; Employment History
(declare-fun worked-for-ncb (Person) Bool)
(declare-fun worked-for-bcc (Person) Bool)
; Current Status
(declare-fun is-retired (Person) Bool)
(declare-fun is-employed (Person) Bool)
(declare-fun is-self-employed (Person) Bool)
; Eligibility & Entitlement
(declare-fun is-eligible-ncfs (Person) Bool)
(declare-fun gets-fuel-payment (Person) Bool)

; 3. Declare Constants
(declare-const me Person)

; 4. Assert Knowledge Base (Rules derived from Document)

; Rule 1: Eligibility based on past employment
; Document: "You might be eligible... if you're an ex-employee of the National Coal Board (NCB) or British Coal Corporation (BCC)"
(assert (forall ((p Person))
  (=> (or (worked-for-ncb p) (worked-for-bcc p))
      (is-eligible-ncfs p))))

; Rule 2: Disqualification based on current employment
; Document: "Your allowance might be affected if... you take up employment or self-employment"
; Logic: If currently employed or self-employed, eligibility is negated.
(assert (forall ((p Person))
  (=> (or (is-employed p) (is-self-employed p))
      (not (is-eligible-ncfs p)))))

; Rule 3: Entitlement implies Payment
; Document: "You could get free solid fuel or a cash allowance for fuel if you... qualify"
(assert (forall ((p Person))
  (=> (is-eligible-ncfs p)
      (gets-fuel-payment p))))

; 5. Assert Scenario Facts
; Document Scenario: "I worked for the National Coal Board for thirty years and have now retired."
(assert (worked-for-ncb me))
(assert (is-retired me))

; Document Scenario: "claiming a state pension" (Implies not currently employed in a way that disqualifies)
; Explicitly assert negative constraints to ensure Rule 2 does not trigger disqualification
(assert (not (is-employed me)))
(assert (not (is-self-employed me)))

; 6. Verification Test
; Question: "Does my employment history entitle me to any sort of fuel payment?"
; We assert the conclusion (gets-fuel-payment) to check if it is satisfiable with the KB.
; If sat -> Yes (Entitled). If unsat -> No (Not Entitled).
(assert (gets-fuel-payment me))

; 7. Check Satisfiability
(check-sat)
(get-model)