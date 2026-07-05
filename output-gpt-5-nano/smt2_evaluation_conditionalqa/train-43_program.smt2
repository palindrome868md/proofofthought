; Sorts
(declare-sort Person 0)

; Uninterpreted predicates to encode eligibility and scenarios
(declare-fun is-employee (Person) Bool)
(declare-fun has-26weeks (Person) Bool)
(declare-fun stay-until-spl (Person) Bool)
(declare-fun earns-120 (Person) Bool)

; Relation representing whether two people can take SPL simultaneously
(declare-fun can-simultaneous-spl (Person Person) Bool)

; Constants representing the two parents in the scenario
(declare-const me Person)
(declare-const partner Person)

; Knowledge base (assumptions based on scenario: both are full-time employees with long eligibility)
(assert (is-employee me))
(assert (is-employee partner))

; Both have the required 26 weeks by the relevant time
(assert (has-26weeks me))
(assert (has-26weeks partner))

; Both stay with the same employer until SPL starts
(assert (stay-until-spl me))
(assert (stay-until-spl partner))

; Both earn at least £120/week on average (eligible for ShPP as well)
(assert (earns-120 me))
(assert (earns-120 partner))

; Rule: If both are eligible for SPL (and meet all sub-conditions), then they can take SPL simultaneously
(assert
  (=> (and (is-employee me)
           (is-employee partner)
           (has-26weeks me)
           (has-26weeks partner)
           (stay-until-spl me)
           (stay-until-spl partner)
           (earns-120 me)
           (earns-120 partner))
      (can-simultaneous-spl me partner))
)

; Test scenario: Can me and partner take SPL at the same time?
(assert (can-simultaneous-spl me partner))

; Check satisfiability (exactly one check-sat is requested)
(check-sat)
(get-model)