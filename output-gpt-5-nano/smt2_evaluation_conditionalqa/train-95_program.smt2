; Declare sorts
(declare-sort Person 0)
(declare-sort Provider 0)

; Declare constants
(declare-const me Person)
(declare-const partner Person)
(declare-const child Person)
(declare-const provider1 Provider)

; Age function
(declare-fun age (Person) Int)

; Predicates for scenario and eligibility
(declare-fun is-full-time-student (Person) Bool)
(declare-fun has-undergraduate-finance (Person) Bool)
(declare-fun permanent-resident-england (Person) Bool)
(declare-fun dependent-on (Person Person) Bool)
(declare-fun partner-works-fulltime (Person) Bool)
(declare-fun no-nhs-help (Person) Bool)
(declare-fun neither-claiming-tax-free-childcare (Person) Bool)
(declare-fun postgraduate-loan (Person) Bool)
(declare-fun provider-registered (Provider) Bool)

; Knowledge base (scenario)
(assert (= (age child) 5))
(assert (< (age child) 15))

(assert (is-full-time-student me))
(assert (has-undergraduate-finance me))
(assert (permanent-resident-england me))
(assert (dependent-on me child))
(assert (partner-works-fulltime partner))
(assert (provider-registered provider1))

; Additional constraints representing eligibility requirements
(assert (no-nhs-help me))
(assert (no-nhs-help partner))
(assert (neither-claiming-tax-free-childcare me))
(assert (neither-claiming-tax-free-childcare partner))
(assert (not (postgraduate-loan me)))

; Verification variable: can I apply?
(declare-const can-apply Bool)
(assert (= can-apply
  (and
    (is-full-time-student me)
    (has-undergraduate-finance me)
    (< (age child) 15)
    (permanent-resident-england me)
    (dependent-on me child)
    (partner-works-fulltime partner)
    (no-nhs-help me)
    (no-nhs-help partner)
    (neither-claiming-tax-free-childcare me)
    (neither-claiming-tax-free-childcare partner)
    (provider-registered provider1)
    (not (postgraduate-loan me))
  )))
(assert can-apply)

; Check satisfiability and show a model
(check-sat)
(get-model)