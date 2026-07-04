; SMT-LIB 2.0 Program to verify eligibility for Care to Learn scheme
; Question: Can I claim help with my childminding costs under the Care to Learn scheme?

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Properties of a Person)
(declare-fun age (Person) Int)
(declare-fun lives-in-england (Person) Bool)
(declare-fun attends-qualifying-course (Person) Bool)
(declare-fun course-publicly-funded (Person) Bool)
(declare-fun has-child (Person) Bool)
(declare-fun has-legal-right (Person) Bool)
(declare-fun is-apprentice-with-salary (Person) Bool)
(declare-fun attends-university (Person) Bool)
(declare-fun can-claim (Person) Bool)

; 3. Declare Constants
(declare-const me Person)

; 4. Assert Knowledge Base (Rules from Document)

; Eligibility Requirements (All must apply to be eligible)
; Rule: Must be under 20 at start of course
(assert (forall ((p Person))
  (=> (can-claim p) (< (age p) 20))))

; Rule: Must live in England
(assert (forall ((p Person))
  (=> (can-claim p) (lives-in-england p))))

; Rule: Course must be qualifying (e.g. sixth-form college)
(assert (forall ((p Person))
  (=> (can-claim p) (attends-qualifying-course p))))

; Rule: Course must be publicly funded
(assert (forall ((p Person))
  (=> (can-claim p) (course-publicly-funded p))))

; Rule: Must be a parent/main carer
(assert (forall ((p Person))
  (=> (can-claim p) (has-child p))))

; Rule: Must have legal right to live/study in England
(assert (forall ((p Person))
  (=> (can-claim p) (has-legal-right p))))

; Exclusion Criteria (Who cannot get Care to Learn)
; Rule: Cannot be an apprentice with salary
(assert (forall ((p Person))
  (=> (can-claim p) (not (is-apprentice-with-salary p)))))

; Rule: Cannot be doing higher education at university
(assert (forall ((p Person))
  (=> (can-claim p) (not (attends-university p)))))

; 5. Assert Scenario Facts
; Fact: I am 19
(assert (= (age me) 19))

; Fact: I live in London (London is in England)
(assert (lives-in-england me))

; Fact: I attend a sixth form college (Qualifying course)
(assert (attends-qualifying-course me))

; Fact: I believe the course is publicly funded
(assert (course-publicly-funded me))

; Fact: I have a daughter (Almost 2 years old)
(assert (has-child me))

; Fact: Legal right (Assumed true as not contradicted, required for possibility)
(assert (has-legal-right me))

; Fact: Not an apprentice (Scenario implies college course, not apprenticeship)
(assert (not (is-apprentice-with-salary me)))

; Fact: Not a university student (Sixth form college is not university)
(assert (not (attends-university me)))

; 6. Verification Test
; Question: Can I claim help?
; We assert the claim is possible and check satisfiability.
(assert (can-claim me))

; 7. Check Satisfiability
(check-sat)
(get-model)