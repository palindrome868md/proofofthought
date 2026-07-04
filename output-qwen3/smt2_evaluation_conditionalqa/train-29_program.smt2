; Reasoning Steps:
; 1. Analyze the Question: "Can I apply to manage my missing business partner's finances?"
; 2. Extract Rules from Document:
;    - Condition 1: Person must be missing for at least 90 days (Scenario: 6 months = 180 days).
;    - Condition 2: Applicant must have 'sufficient interest'.
;      - Example of sufficient interest: Business partner needing to continue running the business.
;    - Condition 3: Applicant must be over 18 (Scenario: Implied adult business owner).
;    - Condition 4: Person must be missing from home/usual activities.
; 3. Formulate Logic:
;    - If (is-missing AND duration >= 90 AND is-business-partner AND needs-to-run AND is-adult) THEN can-apply.
; 4. Map to SMT-LIB 2.0:
;    - Declare sorts, functions, constants.
;    - Assert the implication rule as Knowledge Base.
;    - Assert the scenario facts.
;    - Assert the claim (can-apply) to test for satisfiability.
; 5. Verification Semantics:
;    - (check-sat) returning 'sat' means the claim is consistent with the KB and Facts (Answer: Yes/True).
;    - (check-sat) returning 'unsat' means the claim contradicts the KB (Answer: No/False).

(declare-sort Person 0)

; Functions
(declare-fun is-missing (Person) Bool)
(declare-fun missing-duration (Person) Int)
(declare-fun is-business-partner (Person Person) Bool)
(declare-fun needs-to-run-business (Person Person) Bool)
(declare-fun is-adult (Person) Bool)
(declare-fun can-apply (Person Person) Bool)

; Constants
(declare-const me Person)
(declare-const friend Person)

; Knowledge Base Rules
; Rule: Eligibility for Guardianship Application
; You can apply if the person is missing >= 90 days, you have sufficient interest (business partner), and you are an adult.
(assert (forall ((applicant Person) (missing-person Person))
  (=> (and 
        (is-missing missing-person)
        (>= (missing-duration missing-person) 90)
        (is-business-partner applicant missing-person)
        (needs-to-run-business applicant missing-person)
        (is-adult applicant))
      (can-apply applicant missing-person))))

; Scenario Facts
; Fact 1: Friend is missing
(assert (is-missing friend))

; Fact 2: Friend has been missing for 6 months (180 days)
(assert (= (missing-duration friend) 180))

; Fact 3: I am the business partner
(assert (is-business-partner me friend))

; Fact 4: I need to continue to run the business
(assert (needs-to-run-business me friend))

; Fact 5: I am an adult (required to apply)
(assert (is-adult me))

; Verification Question: Can I apply?
; We assert the positive claim. If 'sat', the answer is True (Yes).
(assert (can-apply me friend))

; Check Satisfiability
(check-sat)
(get-model)