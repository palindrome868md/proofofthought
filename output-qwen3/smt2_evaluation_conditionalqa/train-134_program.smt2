; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Condition 0)

; 2. Declare functions
(declare-fun has_condition (Person Condition) Bool)
(declare-fun affects_work (Condition) Bool)
(declare-fun eligible_for_esa (Person) Bool)

; 3. Declare constants
(declare-const applicant Person)
(declare-const mental_health_condition Condition)

; 4. Assert knowledge base (Rules from Document)
; Document states: "You can apply for ... ESA if you have a disability or health condition that affects how much you can work."
; We model this as: If a person has a condition AND that condition affects work, they are eligible.
(assert (forall ((p Person) (c Condition))
  (=> (and (has_condition p c) (affects_work c))
      (eligible_for_esa p))))

; 5. Assert Scenario Facts
; Scenario states: "I am unable to work due to a mental health condition."
; This implies the applicant has the condition and it affects their work.
(assert (has_condition applicant mental_health_condition))
(assert (affects_work mental_health_condition))

; 6. Verification Query
; Question: "Are people with mental health problems eligible for ESA?"
; To verify "Yes", we assert eligibility and check for satisfiability (sat = True).
(assert (eligible_for_esa applicant))

; 7. Check satisfiability
(check-sat)
(get-model)