; 1. Declare constants for scenario properties and legal status
(declare-const partnership-duration Int)
(declare-const is-cheating Bool)
(declare-const is-unreasonable-behaviour Bool)
(declare-const has-valid-ground Bool)
(declare-const eligible-for-duration Bool)
(declare-const can-dissolve Bool)

; 2. Assert Knowledge Base (Rules derived from Document)

; Rule 1: Duration Requirement
; Document: "You can apply to end ('dissolve') your civil partnership if you've been in the partnership for over a year."
(assert (=> (> partnership-duration 1) eligible-for-duration))

; Rule 2: Cheating implies Unreasonable Behaviour
; Document: "Unreasonable behaviour... This could include... being sexually unfaithful"
(assert (=> is-cheating is-unreasonable-behaviour))

; Rule 3: Unreasonable Behaviour is a Valid Ground
; Document: "You'll need to give one or more of the following 4 reasons... Unreasonable behaviour"
(assert (=> is-unreasonable-behaviour has-valid-ground))

; Rule 4: Dissolution Condition
; If eligible by duration AND has valid ground, then can dissolve
(assert (=> (and eligible-for-duration has-valid-ground) can-dissolve))

; 3. Assert Scenario Facts
; Scenario: "civil partner of 2 years"
(assert (= partnership-duration 2))
; Scenario: "has been cheating on me"
(assert is-cheating)

; 4. Verification: Is it possible to end the civil partnership?
; We assert the positive claim (can-dissolve) and check for satisfiability.
; If 'sat', it means the scenario is consistent with the possibility of dissolution.
(assert can-dissolve)

; 5. Check satisfiability
(check-sat)
(get-model)