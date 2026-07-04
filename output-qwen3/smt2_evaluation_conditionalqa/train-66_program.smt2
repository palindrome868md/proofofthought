; SMT-LIB 2.0 Program to verify compensation claim eligibility
; Question: Can I claim compensation for the injury I suffered during my service?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Injury 0)
(declare-sort CompensationScheme 0)

; 2. Declare functions
(declare-fun served-in-armed-forces (Person) Bool)
(declare-fun former-member (Person) Bool)
(declare-fun injured-during-service (Person Injury) Bool)
(declare-fun no-longer-serving (Person) Bool)
(declare-fun can-claim-compensation (Person) Bool)
(declare-fun eligible-for-afcs (Person) Bool)
(declare-fun eligible-for-wps (Person) Bool)
(declare-fun within-7-years (Person) Bool)

; 3. Declare constants
(declare-const claimant Person)
(declare-const leg-injury Injury)

; 4. Assert knowledge base (from document)

; Rule 1: You can claim compensation if injured while serving in armed forces
(assert (forall ((p Person) (i Injury))
  (=> (and (injured-during-service p i)
           (or (served-in-armed-forces p) (former-member p)))
      (can-claim-compensation p))))

; Rule 2: AFCS eligibility (injuries after 5 April 2005)
(assert (forall ((p Person))
  (=> (and (former-member p)
           (within-7-years p))
      (eligible-for-afcs p))))

; Rule 3: WPS eligibility (injuries before 6 April 2005)
(assert (forall ((p Person))
  (=> (and (former-member p)
           (no-longer-serving p))
      (eligible-for-wps p))))

; Rule 4: Either scheme allows compensation claim
(assert (forall ((p Person))
  (=> (or (eligible-for-afcs p) (eligible-for-wps p))
      (can-claim-compensation p))))

; 5. Assert scenario facts (from the question)
(assert (served-in-armed-forces claimant))
(assert (former-member claimant))
(assert (injured-during-service claimant leg-injury))
(assert (no-longer-serving claimant))

; Note: We don't know exact injury date, but scenario shows:
; - 10 years of service (former member)
; - Injury during service (leg injury)
; - No longer able to serve (discharged)

; 6. Test: Can the claimant claim compensation?
(assert (can-claim-compensation claimant))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (True)
; Reasoning: The claimant meets the core eligibility criteria:
; - Was a member of armed forces (10 years service)
; - Was injured during service (right leg injury)
; - Is no longer serving (discharged due to injury)
; - Can claim under either AFCS or WPS depending on injury date