; SMT-LIB 2.0 Program to verify funeral grant eligibility
; Based on War Widow(er) Pension document

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort TimePeriod 0)
(declare-sort ServiceType 0)

; 2. Declare functions
(declare-fun served-in-period (Person TimePeriod) Bool)
(declare-fun death-due-to-service (Person) Bool)
(declare-fun served-before-date (Person TimePeriod) Bool)
(declare-fun receiving-constant-attendance-allowance (Person) Bool)
(declare-fun receiving-unemployability-supplement (Person) Bool)
(declare-fun war-disablement-pension-rate (Person) Int)
(declare-fun eligible-for-funeral-grant (Person) Bool)

; 3. Declare constants
(declare-const husband Person)
(declare-const period-1990s TimePeriod)
(declare-const period-before-april-2005 TimePeriod)
(declare-const nuclear-submarine-service ServiceType)

; 4. Knowledge Base from Document

; Rule 1: Funeral grant eligibility - death due to service before 6 April 2005
(assert (forall ((p Person))
  (=> (and (served-before-date p period-before-april-2005)
           (death-due-to-service p))
      (eligible-for-funeral-grant p))))

; Rule 2: Funeral grant eligibility - Constant Attendance Allowance
(assert (forall ((p Person))
  (=> (receiving-constant-attendance-allowance p)
      (eligible-for-funeral-grant p))))

; Rule 3: Funeral grant eligibility - Unemployability Supplement + 80%+ pension
(assert (forall ((p Person))
  (=> (and (receiving-unemployability-supplement p)
           (>= (war-disablement-pension-rate p) 80))
      (eligible-for-funeral-grant p))))

; Rule 4: 1990s service is before April 2005
(assert (forall ((p Person))
  (=> (served-in-period p period-1990s)
      (served-before-date p period-before-april-2005))))

; 5. Scenario Facts

; Husband worked on nuclear submarines in the 1990s
(assert (served-in-period husband period-1990s))

; Cancer thought to be caused by radiation exposure during service
(assert (death-due-to-service husband))

; 6. Test: Can the widow get a funeral grant?
; We assert eligibility and check if it's satisfiable
(assert (eligible-for-funeral-grant husband))

; 7. Check satisfiability
(check-sat)
(get-model)