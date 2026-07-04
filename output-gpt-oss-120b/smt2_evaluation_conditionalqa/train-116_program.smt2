; -------------------------------------------------
; Sorts
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; Predicates / Functions
; -------------------------------------------------
; Benefit predicates (true if the person receives the benefit)
(declare-fun receives_income_support (Person) Bool)
(declare-fun receives_jobseeker (Person) Bool)
(declare-fun receives_esa (Person) Bool)               ; income‑related Employment & Support Allowance
(declare-fun receives_pension_credit (Person) Bool)

; Disqualifying predicates
(declare-fun receives_universal_credit (Person) Bool)
(declare-fun industrial_action (Person) Bool)

; Money owed for Crisis/Budgeting Loans
(declare-fun owes (Person) Int)   ; total amount owed in £

; Eligibility predicate (derived)
(declare-fun eligible (Person) Bool)

; -------------------------------------------------
; Eligibility rule (derived from the policy)
; -------------------------------------------------
(assert (forall ((p Person))
  (=> (and (or (receives_income_support p)
               (receives_jobseeker p)
               (receives_esa p)
               (receives_pension_credit p))           ; must have a qualifying benefit
           (not (receives_universal_credit p))       ; not on Universal Credit
           (not (industrial_action p))               ; not on strike/lockout
           (<= (owes p) 1500))                        ; owe ≤ £1500
      (eligible p))))

; -------------------------------------------------
; Applicant information (derived from the scenario)
; -------------------------------------------------
(declare-const applicant Person)

; The scenario gives no indication that the applicant receives any qualifying benefit,
; so we assert that they receive none of them.
(assert (not (receives_income_support applicant)))
(assert (not (receives_jobseeker applicant)))
(assert (not (receives_esa applicant)))
(assert (not (receives_pension_credit applicant)))

; The scenario also does not mention Universal Credit, industrial action, or large debt.
; We assume they are not on Universal Credit, not on strike, and owe nothing.
(assert (not (receives_universal_credit applicant)))
(assert (not (industrial_action applicant)))
(assert (= (owes applicant) 0))

; -------------------------------------------------
; Test the question: "Am I eligible for a Budgeting Loan?"
; -------------------------------------------------
(assert (eligible applicant))

; -------------------------------------------------
; Solve
; -------------------------------------------------
(check-sat)   ; Expected: unsat (the applicant is NOT eligible)
(get-model)