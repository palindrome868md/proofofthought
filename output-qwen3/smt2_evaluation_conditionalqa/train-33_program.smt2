; SMT-LIB 2.0 Program to verify adoption leave eligibility for a couple
; Based on the provided document "Adoption pay and leave"

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
; Predicate: Are two people a couple?
(declare-fun is_couple (Person Person) Bool)
; Predicate: Does the person meet eligibility criteria (employment, earnings, etc.)?
(declare-fun meets_eligibility_criteria (Person) Bool)
; Predicate: Does the person take Statutory Adoption Leave?
(declare-fun takes_adoption_leave (Person) Bool)

; 3. Declare constants
(declare-const me Person)
(declare-const husband Person)

; 4. Assert knowledge base (facts and rules from the document)

; Fact: The scenario states "Me and my husband"
(assert (is_couple me husband))

; Fact: The scenario states "both secondary school teachers"
; We assume they meet the employment and earnings criteria for the sake of testing the couple constraint
(assert (meets_eligibility_criteria me))
(assert (meets_eligibility_criteria husband))

; Rule: To take adoption leave, one must meet eligibility criteria
(assert (forall ((p Person))
  (=> (takes_adoption_leave p) (meets_eligibility_criteria p))))

; Rule: "Only 1 person in a couple can take adoption leave."
; This means it is impossible for both partners in a couple to take adoption leave simultaneously.
(assert (forall ((p1 Person) (p2 Person))
  (=> (and (is_couple p1 p2) 
           (takes_adoption_leave p1) 
           (takes_adoption_leave p2))
      false)))

; 5. Assert the test scenario
; Question: "Can we take both paid time off during school hours?"
; Interpretation: Can both partners take Statutory Adoption Leave (the paid time off described)?
(assert (takes_adoption_leave me))
(assert (takes_adoption_leave husband))

; 6. Check satisfiability
; If UNSAT, it means the scenario contradicts the knowledge base (Answer: No)
; If SAT, it means the scenario is possible (Answer: Yes)
(check-sat)

; 7. Get model (if SAT)
(get-model)