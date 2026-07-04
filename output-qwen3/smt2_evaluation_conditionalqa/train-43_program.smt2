; Shared Parental Leave Simultaneity Verification
; Based on UK Government Document: Shared Parental Leave and Pay

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions
; Eligibility status
(declare-fun is_eligible (Person) Bool)
; Scenario attributes
(declare-fun works_full_time (Person) Bool)
(declare-fun shares_responsibility_at_birth (Person) Bool)
; Leave rules
(declare-fun allowed_same_time (Person Person) Bool)
(declare-fun take_spl_same_time (Person Person) Bool)

; 3. Declare Constants
(declare-const me Person)
(declare-const partner Person)

; 4. Assert Knowledge Base (Rules derived from Document)

; Rule 1: Eligibility Criteria
; Document: "both parents must: share responsibility for the child at birth... meet work and pay criteria"
; We model 'works_full_time' as meeting work/pay criteria for this scenario.
(assert (forall ((p Person))
  (=> (and (works_full_time p) (shares_responsibility_at_birth p))
      (is_eligible p))))

; Rule 2: Simultaneity Permission
; Document: "If your partner is also eligible for SPL... You can take leave... both at the same time."
(assert (=> (and (is_eligible me) (is_eligible partner))
            (allowed_same_time me partner)))

; Rule 3: Action Constraint
; One cannot take leave at the same time unless allowed.
(assert (forall ((p1 Person) (p2 Person))
  (=> (take_spl_same_time p1 p2)
      (allowed_same_time p1 p2))))

; 5. Assert Scenario Facts
; Document Scenario: "both work full-time", "I will have parental responsibility for the new baby"
(assert (works_full_time me))
(assert (works_full_time partner))
(assert (shares_responsibility_at_birth me))
(assert (shares_responsibility_at_birth partner))

; 6. Verification Query
; Question: "Can I take shared parental leave at the same time as my partner?"
; We assert the action and check for satisfiability (consistency with rules).
(assert (take_spl_same_time me partner))

; 7. Check Satisfiability
(check-sat)
(get-model)