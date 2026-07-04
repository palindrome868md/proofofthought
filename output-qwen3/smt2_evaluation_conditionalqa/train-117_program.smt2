; DSA Eligibility Verification for Student with Asperger's
; Question: Does my disability entitle me to claim DSA?

; Declare sorts
(declare-sort Person 0)
(declare-sort Disability 0)
(declare-sort Course 0)

; Declare functions
(declare-fun age (Person) Int)
(declare-fun has-disability (Person Disability) Bool)
(declare-fun is-qualifying-disability (Disability) Bool)
(declare-fun enrolled-in (Person Course) Bool)
(declare-fun is-qualifying-course (Course) Bool)
(declare-fun course-duration-years (Course) Int)
(declare-fun lives-in-england (Person) Bool)
(declare-fun qualifies-for-student-finance (Person) Bool)
(declare-fun entitled-to-dsa (Person) Bool)

; Declare constants
(declare-const me Person)
(declare-const aspergers Disability)
(declare-const hnd-course Course)

; Knowledge Base - DSA Eligibility Rules from Document

; Rule 1: Asperger's qualifies as a disability (specific learning difficulty/mental health condition)
(assert (is-qualifying-disability aspergers))

; Rule 2: HND is a qualifying course type
(assert (is-qualifying-course hnd-course))

; Rule 3: Qualifying courses must last at least 1 year
(assert (>= (course-duration-years hnd-course) 1))

; Rule 4: DSA entitlement requires qualifying disability
(assert (forall ((p Person) (d Disability))
  (=> (and (has-disability p d) (is-qualifying-disability d))
      (has-qualifying-disability p))))

; Rule 5: DSA entitlement requires qualifying course
(assert (forall ((p Person) (c Course))
  (=> (and (enrolled-in p c) (is-qualifying-course c))
      (in-qualifying-course p))))

; Rule 6: Full DSA eligibility requires all conditions
(declare-fun has-qualifying-disability (Person) Bool)
(declare-fun in-qualifying-course (Person) Bool)

(assert (forall ((p Person))
  (=> (and (has-qualifying-disability p)
           (in-qualifying-course p)
           (lives-in-england p)
           (qualifies-for-student-finance p))
      (entitled-to-dsa p))))

; Scenario Facts
(assert (= (age me) 19))
(assert (has-disability me aspergers))
(assert (enrolled-in me hnd-course))

; Assumed conditions (not specified in scenario but required for eligibility)
(assert (lives-in-england me))
(assert (qualifies-for-student-finance me))

; Test: Am I entitled to DSA given my disability and course?
(assert (entitled-to-dsa me))

; Check satisfiability
(check-sat)
(get-model)