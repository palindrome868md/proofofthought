; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun age (Person) Int)
(declare-fun has-bank-account (Person) Bool)
(declare-fun can-manage-affairs (Person) Bool)
(declare-fun is-appointee-eligible (Person Person) Bool)

; 3. Declare constants
(declare-const me Person)
(declare-const brother Person)

; 4. Assert knowledge base (Scenario Facts)
; I am 28 years old
(assert (= (age me) 28))
; I have a UK bank account (satisfies the requirement to have a bank account)
(assert (has-bank-account me))
; Brother is sectioned under Mental Health Act (implies he cannot manage his own affairs)
(assert (not (can-manage-affairs brother)))

; 5. Assert knowledge base (Document Rules)
; Rule: A person P is eligible to be an appointee for Q if:
; P is over 18, P has a bank account, and Q cannot manage their own affairs.
(assert (forall ((p Person) (q Person))
  (=> (and (> (age p) 18)
           (has-bank-account p)
           (not (can-manage-affairs q)))
      (is-appointee-eligible p q))))

; 6. Verification: Can I be appointed to handle my brother's claims?
; We assert the positive claim to test if it is satisfiable with the knowledge base.
(assert (is-appointee-eligible me brother))

; 7. Check satisfiability
; Expected: sat (True), meaning it is possible/allowed based on the rules and facts.
(check-sat)
(get-model)