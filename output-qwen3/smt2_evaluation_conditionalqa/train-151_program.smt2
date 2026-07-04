; SMT-LIB 2.0 Program: Can I make a will on my grandmother's behalf?
; Based on Court of Protection statutory will guidelines

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Court 0)
(declare-sort Will 0)
(declare-sort Application 0)

; 2. Declare functions
(declare-fun has-dementia (Person) Bool)
(declare-fun lacks-capacity (Person) Bool)
(declare-fun can-apply-for-statutory-will (Person Person) Bool)
(declare-fun has-court-approval (Application) Bool)
(declare-fun is-valid-statutory-will (Will) Bool)
(declare-fun made-on-behalf-of (Will Person Person) Bool)
(declare-fun in-best-interest (Will Person) Bool)
(declare-fun submitted-application (Person Person Court) Bool)

; 3. Declare constants
(declare-const grandmother Person)
(declare-const user Person)
(declare-const court-of-protection Court)
(declare-const proposed-will Will)
(declare-const will-application Application)

; 4. Assert knowledge base (rules from the document)

; Rule 1: If someone has dementia, they may lack capacity to make a will
(assert (forall ((p Person))
  (=> (has-dementia p) (lacks-capacity p))))

; Rule 2: You can apply for statutory will if person lacks capacity
(assert (forall ((applicant Person) (subject Person))
  (=> (lacks-capacity subject)
      (can-apply-for-statutory-will applicant subject))))

; Rule 3: Statutory will requires Court of Protection application
(assert (forall ((applicant Person) (subject Person))
  (=> (can-apply-for-statutory-will applicant subject)
      (submitted-application applicant subject court-of-protection))))

; Rule 4: Will made on behalf requires court approval
(assert (forall ((w Will) (applicant Person) (subject Person))
  (=> (and (made-on-behalf-of w subject applicant)
           (submitted-application applicant subject court-of-protection))
      (has-court-approval will-application))))

; Rule 5: Decisions must be in the person's best interest
(assert (forall ((w Will) (subject Person))
  (=> (made-on-behalf-of w subject user)
      (in-best-interest w subject))))

; Rule 6: If court approves and in best interest, will is valid
(assert (forall ((w Will))
  (=> (and (has-court-approval will-application)
           (in-best-interest w grandmother))
      (is-valid-statutory-will w))))

; 5. Assert scenario facts

; Fact: Grandmother has dementia
(assert (has-dementia grandmother))

; Fact: User wants to make will on grandmother's behalf
(assert (made-on-behalf-of proposed-will grandmother user))

; Fact: User can apply because grandmother lacks capacity (due to dementia)
(assert (can-apply-for-statutory-will user grandmother))

; 6. Test: Can user make a will on grandmother's behalf?
; This tests if the scenario is satisfiable (possible)
(assert (submitted-application user grandmother court-of-protection))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (true)
; Explanation: According to the Court of Protection guidelines,
; you CAN make a statutory will on behalf of someone with dementia
; by applying to the Court of Protection with proper forms and
; ensuring it's in their best interest.