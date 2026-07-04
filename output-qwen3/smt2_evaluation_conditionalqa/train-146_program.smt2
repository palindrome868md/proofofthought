; SMT-LIB 2.0 Program to verify deputyship validity after death
; Based on UK Government Guidance on Deputies (Court of Protection)

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions
; Check if a person is alive
(declare-fun is-alive (Person) Bool)
; Check if person d is appointed deputy for person p
(declare-fun is-deputy-for (Person Person) Bool)
; Check if the deputy's power is valid for the principal
(declare-fun power-valid (Person Person) Bool)

; 3. Declare Constants
(declare-const uncle Person)
(declare-const nephew Person)

; 4. Assert Knowledge Base (Facts and Rules from Document)

; Fact: Nephew is appointed deputy for Uncle
(assert (is-deputy-for nephew uncle))

; Rule 1: Deputyship is established for those who 'lack mental capacity' (implies living)
; Logical constraint: Power is only valid if the principal is alive.
; Derived from: "You can apply to become someone's deputy if they 'lack mental capacity'"
; and the section "If the person you're deputy for dies" which requires notification 
; to authorities, implying the active role ceases.
(assert (forall ((d Person) (p Person))
  (=> (power-valid d p)
      (is-alive p))))

; Rule 2: If the person dies, they are not alive
; This will be asserted in the scenario below.

; 5. Assert Test Scenario (The Question)
; Question: "Will my power as his deputy be valid after he dies?"

; Scenario Condition: Uncle dies
(assert (not (is-alive uncle)))

; Hypothesis to Test: Power is still valid after death
; If this leads to 'unsat', the answer is NO (Power is not valid).
; If this leads to 'sat', the answer is YES (Power could be valid).
(assert (power-valid nephew uncle))

; 6. Check Satisfiability
(check-sat)
(get-model)

; Expected Result: unsat
; Reasoning: The rule (=> (power-valid d p) (is-alive p)) contradicts 
; the scenario (not (is-alive uncle)) AND (power-valid nephew uncle).
; Therefore, the power is NOT valid after death.