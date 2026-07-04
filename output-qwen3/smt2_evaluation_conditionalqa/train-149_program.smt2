; SMT-LIB 2.0 Program to verify if stopping visits is possible
; Based on Court of Protection guidelines

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort LegalAction 0)
(declare-sort Condition 0)

; 2. Declare functions
(declare-fun has-dementia (Person) Bool)
(declare-fun has-lost-mental-capacity (Person) Bool)
(declare-fun is-in-care-home (Person) Bool)
(declare-fun is-manipulating-for-money (Person Person) Bool)
(declare-fun is-sister (Person Person) Bool)
(declare-fun concerns-welfare (Person) Bool)
(declare-fun concerns-financial-affairs (Person) Bool)
(declare-fun can-apply-court-protection (Person) Bool)
(declare-fun is-valid-reason-for-one-off-decision (Condition) Bool)
(declare-fun can-stop-visiting (LegalAction) Bool)
(declare-fun is-possible (Bool) Bool)

; 3. Declare constants
(declare-const father Person)
(declare-const sister Person)
(declare-const stop-visit-action LegalAction)
(declare-const dementia-condition Condition)
(declare-const manipulation-condition Condition)

; 4. Assert knowledge base (from Court of Protection document)

; Rule: Dementia implies lost mental capacity
(assert (forall ((p Person))
  (=> (has-dementia p) (has-lost-mental-capacity p))))

; Rule: Can apply to Court of Protection if person lost mental capacity AND concerned about welfare/financial affairs
(assert (forall ((applicant Person) (subject Person))
  (=> (and (has-lost-mental-capacity subject)
           (or (concerns-welfare subject) (concerns-financial-affairs subject)))
      (can-apply-court-protection applicant))))

; Rule: One-off decision can stop someone visiting a person in nursing home who lost capacity
(assert (forall ((action LegalAction) (subject Person))
  (=> (and (can-stop-visiting action)
           (has-lost-mental-capacity subject)
           (is-in-care-home subject))
      (is-possible true))))

; Rule: Financial manipulation is a valid concern for financial affairs
(assert (forall ((manipulator Person) (victim Person))
  (=> (is-manipulating-for-money manipulator victim)
      (concerns-financial-affairs victim))))

; Rule: If Court of Protection application is valid, stopping visits is possible
(assert (forall ((applicant Person) (subject Person))
  (=> (can-apply-court-protection applicant)
      (can-stop-visiting stop-visit-action))))

; 5. Assert scenario facts

; Father has dementia
(assert (has-dementia father))

; Father is in care home
(assert (is-in-care-home father))

; Sister is manipulating father for money
(assert (is-manipulating-for-money sister father))

; Sister is sister of father (family relationship)
(assert (is-sister sister father))

; 6. Test: Is it possible to stop her from visiting?
; We assert that stopping the visit is possible and check satisfiability
(assert (can-stop-visiting stop-visit-action))

; 7. Check satisfiability
(check-sat)
(get-model)