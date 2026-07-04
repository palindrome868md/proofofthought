; SMT-LIB 2.0 Program to verify eligibility for Disabled Facilities Grant
; Question: Can I apply for Disabled Facilities Grants given I am planning to live for 3 years?
; Logic: Eligibility requires intending to live in the property for the grant period (5 years).
; Scenario: Intention is 3 years. 3 < 5, so eligibility condition fails.

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Property 0)

; 2. Declare Functions
(declare-fun is-disabled (Person) Bool)
(declare-fun is-tenant (Person Property) Bool)
(declare-fun is-owner (Person Property) Bool)
(declare-fun intent-duration (Person Property) Int)
(declare-fun grant-period () Int)
(declare-fun eligible (Person Property) Bool)

; 3. Declare Constants
(declare-const me Person)
(declare-const my_home Property)

; 4. Assert Knowledge Base (Rules from Document)

; Rule: Grant period is currently 5 years
(assert (= (grant-period) 5))

; Rule: To be eligible, you must be disabled
(assert (forall ((p Person) (prop Property))
  (=> (eligible p prop) (is-disabled p))))

; Rule: To be eligible, you must own or be a tenant
(assert (forall ((p Person) (prop Property))
  (=> (eligible p prop) (or (is-owner p prop) (is-tenant p prop)))))

; Rule: To be eligible, you must intend to live there during the grant period
(assert (forall ((p Person) (prop Property))
  (=> (eligible p prop) (>= (intent-duration p prop) (grant-period)))))

; 5. Assert Scenario Facts

; Fact: I am disabled
(assert (is-disabled me))

; Fact: I am a tenant (rented property)
(assert (is-tenant me my_home))

; Fact: I intend to live here for 3 years
(assert (= (intent-duration me my_home) 3))

; 6. Verification Test
; Question: Am I eligible? (Assert eligibility to check for contradiction)
(assert (eligible me my_home))

; 7. Check Satisfiability
(check-sat)
; Expected: unsat (False)
; Reason: intent-duration (3) < grant-period (5), violating the eligibility rule.

; 8. Get Model (if sat, shows values; if unsat, confirms contradiction)
(get-model)