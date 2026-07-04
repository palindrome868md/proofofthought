; Care to Learn Eligibility Verification
; Question: Can a 19-year-old niece with a baby qualify for Care to Learn 
;          if she wants to join Bath University for a pharmacy degree?

; =============================================================================
; 1. DECLARE SORTS
; =============================================================================
(declare-sort Person 0)
(declare-sort Course 0)
(declare-sort Location 0)

; =============================================================================
; 2. DECLARE FUNCTIONS
; =============================================================================
; Person properties
(declare-fun age (Person) Int)
(declare-fun is-parent (Person) Bool)
(declare-fun is-main-carer (Person) Bool)
(declare-fun lives-in (Person Location) Bool)
(declare-fun is-british-citizen (Person) Bool)
(declare-fun has-legal-right-to-study (Person) Bool)

; Course properties
(declare-fun enrolled-in (Person Course) Bool)
(declare-fun is-university-course (Course) Bool)
(declare-fun is-publicly-funded (Course) Bool)
(declare-fun course-location (Course Location) Bool)
(declare-fun is-apprenticeship (Course) Bool)
(declare-fun provides-salary (Course) Bool)

; Eligibility
(declare-fun qualifies-for-care-to-learn (Person) Bool)

; =============================================================================
; 3. DECLARE CONSTANTS
; =============================================================================
(declare-const niece Person)
(declare-const pharmacy-degree Course)
(declare-const england Location)
(declare-const bath-university Location)

; =============================================================================
; 4. ASSERT KNOWLEDGE BASE (Eligibility Rules from Document)
; =============================================================================

; Rule 1: Must be under 20 at start of course
(assert (forall ((p Person))
  (=> (qualifies-for-care-to-learn p)
      (< (age p) 20))))

; Rule 2: Must be the main carer for the child
(assert (forall ((p Person))
  (=> (qualifies-for-care-to-learn p)
      (is-main-carer p))))

; Rule 3: Must live in England
(assert (forall ((p Person))
  (=> (qualifies-for-care-to-learn p)
      (lives-in p england))))

; Rule 4: Must be British citizen or have legal right to live and study
(assert (forall ((p Person))
  (=> (qualifies-for-care-to-learn p)
      (or (is-british-citizen p)
          (has-legal-right-to-study p)))))

; Rule 5: Course must be publicly funded
(assert (forall ((p Person) (c Course))
  (=> (and (qualifies-for-care-to-learn p) (enrolled-in p c))
      (is-publicly-funded c))))

; Rule 6: Course must be in England
(assert (forall ((p Person) (c Course))
  (=> (and (qualifies-for-care-to-learn p) (enrolled-in p c))
      (course-location c england))))

; Rule 7: CANNOT be an apprentice who gets a salary
(assert (forall ((p Person) (c Course))
  (=> (and (qualifies-for-care-to-learn p) (enrolled-in p c))
      (not (and (is-apprenticeship c) (provides-salary c))))))

; Rule 8: CANNOT be a higher education course at university (CRITICAL)
(assert (forall ((p Person) (c Course))
  (=> (and (qualifies-for-care-to-learn p) (enrolled-in p c))
      (not (is-university-course c)))))

; =============================================================================
; 5. ASSERT FACTS ABOUT THE NIECE (From Scenario)
; =============================================================================

; Niece is 19 years old
(assert (= (age niece) 19))

; Niece is a parent (has a 2-year-old baby)
(assert (is-parent niece))

; Niece is the main carer (implied from scenario)
(assert (is-main-carer niece))

; Niece lives in England (Bath is in England)
(assert (lives-in niece england))

; Assume legal right to study (not specified, assume yes for testing)
(assert (has-legal-right-to-study niece))

; Niece is enrolled in pharmacy degree at Bath University
(assert (enrolled-in niece pharmacy-degree))

; Pharmacy degree at university IS a university course
(assert (is-university-course pharmacy-degree))

; University courses are publicly funded (typically)
(assert (is-publicly-funded pharmacy-degree))

; Course is in England
(assert (course-location pharmacy-degree england))

; Not an apprenticeship
(assert (not (is-apprenticeship pharmacy-degree)))

; =============================================================================
; 6. VERIFICATION TEST
; =============================================================================
; Question: Can she qualify for Care to Learn?
; We assert that she DOES qualify and check if this is satisfiable.
; If unsat, she CANNOT qualify. If sat, she CAN qualify.

(assert (qualifies-for-care-to-learn niece))

; =============================================================================
; 7. CHECK SATISFIABILITY
; =============================================================================
(check-sat)
(get-model)

; EXPECTED RESULT: unsat
; REASON: Rule 8 states you cannot qualify if doing a higher education 
;         course at university. The niece is enrolled in a pharmacy degree 
;         at Bath University, which is a university course.
;         This contradicts the eligibility requirements.