; -------------------------------------------------
; 1. Declare sorts (uninterpreted types)
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Disability 0)
(declare-sort Course 0)

; -------------------------------------------------
; 2. Declare predicates (functions returning Bool)
; -------------------------------------------------
(declare-fun is_student (Person) Bool)                 ; enrolment status
(declare-fun has_disability (Person Disability) Bool) ; person’s disability
(declare-fun disability_affects_study (Disability) Bool) ; relevance to study
(declare-fun qualifies_finance (Person) Bool)        ; eligible for Student Finance England
(declare-fun eligible_course (Course) Bool)           ; course type allowed for DSA
(declare-fun studies (Person Course) Bool)            ; person is enrolled in the course
(declare-fun course_duration_at_least_one (Course) Bool) ; ≥ 1 year
(declare-fun entitles_DSA (Person) Bool)              ; final entitlement

; -------------------------------------------------
; 3. Knowledge‑base: eligibility rule (forward implication)
; -------------------------------------------------
; If a person satisfies *all* eligibility conditions, they are entitled to DSA.
(assert (forall ((p Person) (d Disability) (c Course))
  (=> (and (is_student p)
           (has_disability p d)
           (disability_affects_study d)
           (qualifies_finance p)
           (eligible_course c)
           (studies p c)
           (course_duration_at_least_one c))
      (entitles_DSA p))))

; -------------------------------------------------
; 4. Facts describing the concrete scenario
; -------------------------------------------------
(declare-const me Person)
(declare-const asperger Disability)
(declare-const hnd Course)

; You are a student (undergraduate HND)
(assert (is_student me))
(assert (studies me hnd))

; Your disability is Asperger and it affects study
(assert (has_disability me asperger))
(assert (disability_affects_study asperger))

; You qualify for Student Finance England
(assert (qualifies_finance me))

; The HND is an eligible course type and lasts at least a year
(assert (eligible_course hnd))
(assert (course_duration_at_least_one hnd))

; -------------------------------------------------
; 5. Test the question: “Do I have entitlement to DSA?”
; -------------------------------------------------
(assert (entitles_DSA me))

; -------------------------------------------------
; 6. Solve
; -------------------------------------------------
(check-sat)   ; Expected: sat (the entitlement follows from the rules)
(get-model)