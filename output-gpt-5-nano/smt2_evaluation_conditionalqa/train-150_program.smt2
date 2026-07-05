; Scenario: Can I still claim Employment and Support Allowance (ESA) if I am now taking freelance work again?

; Declare the basic sorts
(declare-sort Person 0)

; Predicates to capture eligibility factors
(declare-fun under-state-pension-age (Person) Bool)
(declare-fun is-health-condition (Person) Bool)
(declare-fun NI-credits (Person) Bool)            ; National Insurance contributions/credits
(declare-fun is-employed (Person) Bool)
(declare-fun is-self-employed (Person) Bool)

; ESA entitlement for a person
(declare-fun can-claim-esa (Person) Bool)

; The scenario-specific individual
(declare-const me Person)

; Knowledge base (ESA general eligibility)
; You can apply for 'new style' ESA if under State Pension age and you have a health condition
; that affects how much you can work, and you have paid enough NI contributions or credits.
(assert (under-state-pension-age me))
(assert (is-health-condition me))
(assert (NI-credits me))

; In this scenario, you are self-employed (freelance)
(assert (is-self-employed me))

; Core rule: if someone is under pension age, has a health condition affecting work, and has NI credits,
; they can claim ESA (regardless of being employed, self-employed, or unemployed)
(assert (forall ((p Person))
  (=> (and (under-state-pension-age p)
           (is-health-condition p)
           (NI-credits p))
      (can-claim-esa p))))

; Test: Can 'me' claim ESA?
(assert (can-claim-esa me))

; Check satisfiability to determine if claiming ESA is possible in this scenario
(check-sat)
(get-model)