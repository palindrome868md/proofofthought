; SMT-LIB 2.0 Program for Mental Health Tribunal Application Question
; Question: Can I apply for my mother's discharge as her nearest relative?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort AdmissionType 0)

; 2. Declare constants for admission types
(declare-const section2 AdmissionType)  ; assessment
(declare-const section3 AdmissionType)  ; treatment

; 3. Declare functions
(declare-fun is-nearest-relative (Person Person) Bool)
(declare-fun admission-type (Person) AdmissionType)
(declare-fun months-since-admission (Person) Int)
(declare-fun can-apply-on-behalf (Person Person) Bool)
(declare-fun within-application-deadline (Person) Bool)

; 4. Declare constants for the people involved
(declare-const questioner Person)
(declare-const mother Person)

; 5. Knowledge Base from Document

; Rule 1: You can apply on a patient's behalf if you're their 'nearest relative'
(assert (forall ((q Person) (p Person))
  (=> (is-nearest-relative q p)
      (can-apply-on-behalf q p))))

; Rule 2: Section 3 (treatment) has 6 month deadline for first application
(assert (forall ((p Person))
  (=> (= (admission-type p) section3)
      (=> (<= (months-since-admission p) 6)
          (within-application-deadline p)))))

; Rule 3: Can apply if nearest relative AND within deadline
(assert (forall ((q Person) (p Person))
  (=> (and (can-apply-on-behalf q p)
           (within-application-deadline p))
      (can-apply-on-behalf q p))))

; 6. Facts from the Scenario
; The questioner is the mother's nearest relative
(assert (is-nearest-relative questioner mother))

; Mother was admitted for treatment (section 3)
(assert (= (admission-type mother) section3))

; Mother was sectioned one month ago
(assert (= (months-since-admission mother) 1))

; 7. Test Question: Can the questioner apply for mother's discharge?
; We assert this and check if it's satisfiable with the knowledge base
(assert (can-apply-on-behalf questioner mother))
(assert (within-application-deadline mother))

; 8. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (true)
; Reasoning: 
; - Questioner is nearest relative (can apply on behalf)
; - Mother is section 3 (treatment) with 6 month deadline
; - Only 1 month has passed (within deadline)
; - Therefore, application is possible