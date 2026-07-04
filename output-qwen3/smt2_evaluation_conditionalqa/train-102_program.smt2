; SMT-LIB 2.0 Program for Court of Protection Application Question
; Question: Can I seek a court protection order without informing my other family members?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Application 0)

; 2. Declare functions
(declare-fun is-applicant (Person) Bool)
(declare-fun is-family-member (Person) Bool)
(declare-fun is-connected-to-application (Person Application) Bool)
(declare-fun must-serve-notice (Person Application) Bool)
(declare-fun can-apply-without-notifying-family (Application) Bool)

; 3. Declare constants
(declare-const me Person)
(declare-const grandmother Person)
(declare-const other-family-member Person)
(declare-const my-application Application)

; 4. Assert knowledge base from document

; I am the applicant for my grandmother
(assert (is-applicant me))

; Other family members exist who would be affected by will changes
(assert (is-family-member other-family-member))

; Family members are connected to the application (they have interest in grandmother's property/will)
(assert (is-connected-to-application other-family-member my-application))

; Document Rule 1: "You must tell people connected to the application"
; "You must tell (serve) certain people about the application within 14 days of the issue date"
(assert (forall ((p Person) (a Application))
  (=> (is-connected-to-application p a)
      (must-serve-notice p a))))

; Document Rule 2: Must confirm you've told people within 7 days (COP20B for other people)
(assert (forall ((p Person) (a Application))
  (=> (and (is-family-member p) (must-serve-notice p a))
      (not (can-apply-without-notifying-family a)))))

; 5. Test the question: Can I apply without informing other family members?
(assert (can-apply-without-notifying-family my-application))

; 6. Check satisfiability
(check-sat)
; Expected result: unsat (FALSE - you CANNOT seek court protection without informing family members)
; The document clearly states you MUST serve notice to people connected to the application
; within 14 days, and confirm service within 7 days using form COP20B

; 7. Get model to understand why (will show contradiction)
(get-model)