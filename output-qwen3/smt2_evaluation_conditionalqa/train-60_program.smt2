; War Widow Pension Eligibility Check
; Question: Can the aunt claim for a War Widow Pension?

; ==================== DECLARE SORTS ====================
(declare-sort Person 0)
(declare-sort Date 0)

; ==================== DECLARE CONSTANTS ====================
; Key date threshold from document
(declare-const april-6-2005 Date)

; People in scenario
(declare-const aunt Person)
(declare-const husband Person)

; ==================== DECLARE FUNCTIONS ====================
; Relationship and status functions
(declare-fun spouse-of (Person) Person)
(declare-fun is-widow (Person) Bool)
(declare-fun died-from-service (Person) Bool)
(declare-fun service-start-date (Person) Date)
(declare-fun death-date (Person) Date)

; Eligibility functions
(declare-fun served-before-threshold (Person) Bool)
(declare-fun eligible-for-war-widow-pension (Person) Bool)
(declare-fun eligible-for-armed-forces-compensation (Person) Bool)

; ==================== KNOWLEDGE BASE (From Document) ====================

; Rule 1: War Widow Pension requires spouse served before 6 April 2005
(assert (forall ((p Person))
  (=> (eligible-for-war-widow-pension p)
      (served-before-threshold (spouse-of p)))))

; Rule 2: If spouse died from service BEFORE 6 April 2005, eligible for War Widow Pension
(assert (forall ((p Person))
  (=> (and (died-from-service (spouse-of p))
           (served-before-threshold (spouse-of p)))
      (eligible-for-war-widow-pension p))))

; Rule 3: If spouse died from service ON OR AFTER 6 April 2005, must use Armed Forces Compensation Scheme
(assert (forall ((p Person))
  (=> (and (died-from-service (spouse-of p))
           (not (served-before-threshold (spouse-of p))))
      (eligible-for-armed-forces-compensation p))))

; Rule 4: War Widow Pension and Armed Forces Compensation are mutually exclusive pathways
(assert (forall ((p Person))
  (=> (eligible-for-armed-forces-compensation p)
      (not (eligible-for-war-widow-pension p)))))

; Rule 5: Definition of served-before-threshold
(assert (forall ((p Person))
  (=> (served-before-threshold p)
      (< (service-start-date p) april-6-2005))))

; ==================== SCENARIO FACTS ====================

; Fact 1: Aunt is a widow
(assert (is-widow aunt))

; Fact 2: Husband was aunt's spouse
(assert (= (spouse-of aunt) husband))

; Fact 3: Husband died from service (ambush in Iraq)
(assert (died-from-service husband))

; Fact 4: Iraq ambush suggests recent service (post-2005)
; The scenario states "a year now" indicating recent death
; Iraq conflict context suggests post-2005 service
(assert (not (served-before-threshold husband)))

; Fact 5: Death date is recent (within last year)
(assert (> (death-date husband) april-6-2005))

; ==================== VERIFICATION TEST ====================
; Question: Can she claim for a War Widow Pension?
; We test if the claim is satisfiable given the knowledge base

(assert (eligible-for-war-widow-pension aunt))

; ==================== CHECK SATISFIABILITY ====================
(check-sat)
(get-model)

; Expected Result: unsat
; Reasoning: Since husband served after 6 April 2005 (Iraq ambush, recent death),
; the aunt is NOT eligible for War Widow Pension.
; She should claim through Armed Forces Compensation Scheme instead.