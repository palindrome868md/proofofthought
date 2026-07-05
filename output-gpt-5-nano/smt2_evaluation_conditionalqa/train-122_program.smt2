; Declaring sorts
(declare-sort Person 0)
(declare-sort Benefit 0)

; Declaring constants
(declare-const you Person)
(declare-const UC Benefit)            ; Universal Credit as a qualifying benefit
(declare-const PensionCredit Benefit) ; Pension Credit as a qualifying benefit

; Declaring predicates / functions
(declare-fun receives-benefit (Person Benefit) Bool)
(declare-fun is-qualifying-benefit (Benefit) Bool)
(declare-fun eligible-for-SMI (Person) Bool)
(declare-fun SMI-loan (Person) Bool)

; Knowledge base: define qualifying benefits
(assert (is-qualifying-benefit UC))
(assert (is-qualifying-benefit PensionCredit))

; Rule: if a person receives a qualifying benefit, they are eligible for SMI
(assert (forall ((p Person) (b Benefit))
  (=> (and (receives-benefit p b) (is-qualifying-benefit b))
      (eligible-for-SMI p))))

; Rule: if someone is eligible for SMI, they will be offered an SMI loan
(assert (forall ((p Person))
  (=> (eligible-for-SMI p)
      (SMI-loan p))))

; Test scenario: you are receiving Universal Credit
(assert (receives-benefit you UC))

; Test: Can I get SMI loan to cushion mortgage interest?
(assert (SMI-loan you))

; Check satisfiability and provide a model
(check-sat)
(get-model)