; Declare sorts
(declare-sort Person 0)

; Declare predicates/functions
(declare-fun registered-blind (Person) Bool)
(declare-fun has-certificate (Person) Bool)
(declare-fun can-claim-blind-allowance (Person) Bool)
(declare-fun large-savings (Person) Bool)

; Declare constants
(declare-const sis Person)

; Knowledge base: England/Wales eligibility
(assert (forall ((p Person))
  (=> (and (registered-blind p) (has-certificate p))
      (can-claim-blind-allowance p))))

; Scenario: the sister is blind and has a certificate
(assert (registered-blind sis))
(assert (has-certificate sis))

; Scenario: she has a large amount of savings
(assert (large-savings sis))

; Test: Can she claim blindness allowance?
(assert (can-claim-blind-allowance sis))

; Check satisfiability
(check-sat)
(get-model)