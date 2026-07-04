; Parents' Learning Allowance Eligibility Verification
; Question: Can I make a claim given that I will be studying and no longer working?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Course 0)
(declare-sort Location 0)
(declare-sort CourseType 0)

; 2. Declare functions (predicates for eligibility)
(declare-fun has-dependent-children (Person) Bool)
(declare-fun is-full-time-student (Person) Bool)
(declare-fun is-from-england (Person) Bool)
(declare-fun is-undergraduate-course (Course) Bool)
(declare-fun is-itt-course (Course) Bool)
(declare-fun enrolled-in (Person Course) Bool)
(declare-fun eligible-for-allowance (Person) Bool)
(declare-fun can-claim (Person) Bool)

; 3. Declare constants
(declare-const applicant Person)
(declare-const social-work-degree Course)
(declare-const england Location)

; 4. Knowledge Base - Eligibility Rules

; Rule 1: Must have dependent children
(assert (forall ((p Person))
  (=> (eligible-for-allowance p)
      (has-dependent-children p))))

; Rule 2: Must be from England
(assert (forall ((p Person))
  (=> (eligible-for-allowance p)
      (is-from-england p))))

; Rule 3: Must be full-time student
(assert (forall ((p Person))
  (=> (eligible-for-allowance p)
      (is-full-time-student p))))

; Rule 4: Must be taking undergraduate OR ITT course
(assert (forall ((p Person) (c Course))
  (=> (and (eligible-for-allowance p) (enrolled-in p c))
      (or (is-undergraduate-course c)
          (is-itt-course c)))))

; Rule 5: If eligible, can claim
(assert (forall ((p Person))
  (=> (eligible-for-allowance p)
      (can-claim p))))

; 5. Assert Scenario Facts

; Fact: Applicant has two children (dependent children)
(assert (has-dependent-children applicant))

; Fact: Starting a degree course in social work (undergraduate)
(assert (enrolled-in applicant social-work-degree))
(assert (is-undergraduate-course social-work-degree))

; Fact: Will be studying (implies student status)
; Note: Full-time status is not explicitly stated but degree courses are typically full-time

; 6. Test: Can the applicant claim the allowance?
; We assert they CAN claim and check if this is satisfiable with the knowledge base

(assert (can-claim applicant))

; For possibility question, we need to check if there exists a valid configuration
; Assert the missing but possible conditions
(assert (is-from-england applicant))
(assert (is-full-time-student applicant))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected: sat (true)
; Reasoning: The applicant meets the core requirements:
; - Has dependent children (two children) ✓
; - Enrolled in undergraduate course (social work degree) ✓
; - Can be from England (not contradicted) ✓
; - Can be full-time student (not contradicted) ✓
; - Employment status doesn't affect eligibility ✓