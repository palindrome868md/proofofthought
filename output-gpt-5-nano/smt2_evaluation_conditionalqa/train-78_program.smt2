; Declare sorts
(declare-sort Person 0)
(declare-sort Home 0)

; Declare constants (people)
(declare-const me Person)
(declare-const wife Person)

; Declare constants (home)
(declare-const home-1 Home)

; Witness for the scenario (applicant for the grant)
(declare-const applicant Person)

; Predicates / functions
(declare-fun owner (Home) Person)
(declare-fun is-disabled (Person) Bool)
(declare-fun lives-in (Person Home) Bool)
(declare-fun intends-live (Person Home) Bool)

; Economic placeholders (to reflect the scenario, not strictly necessary for logic)
(declare-const savings Int)

; Knowledge base: scenario setup
; You own the property
(assert (= (owner home-1) me))

; The applicant for the grant is you (the statement can be understood as applying person)
(assert (= applicant me))

; Your wife is disabled (paraplegic)
(assert (is-disabled wife))

; The applicant lives in the property (and you as owner intend to live there during the grant period)
(assert (lives-in me home-1))
(assert (intends-live me home-1))
; Optional: explicitly tie applicant to the living situation (will be the same as you in this scenario)
(assert (lives-in applicant home-1))

; Savings (around £5,000)
(assert (= savings 5000))

; A basic check that the scenario is internally consistent (the grant applicability is not contradicted by facts)
; We simply test satisfiability of the configuration that would allow applying for a Disabled Facilities Grant
(check-sat)
(get-model)