; SMT-LIB 2.0 Program to verify Budgeting Loan eligibility based on existing debt
; Based on UK Government Guidance: Budgeting Loans

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
; Tracks total owed amount for Crisis Loans and Budgeting Loans
(declare-fun total-debt (Person) Int)
; Determines if a person is eligible to borrow more via Budgeting Loan
(declare-fun can-borrow-budgeting-loan (Person) Bool)

; 3. Declare constants
(declare-const applicant Person)

; 4. Assert knowledge base (facts and rules from document)

; Rule from document: "You cannot get a Budgeting Loan if: ... you owe more than £1,500 
; in total for Crisis Loans and Budgeting Loans"
(assert (forall ((p Person))
  (=> (> (total-debt p) 1500)
      (not (can-borrow-budgeting-loan p)))))

; Fact from scenario: "I already owe £1600 in budgeting loans"
(assert (= (total-debt applicant) 1600))

; Context from scenario: Applicant is on Pension Credit, not Universal Credit
; (This satisfies the basic eligibility type, isolating the debt constraint)
(declare-fun receives-pension-credit (Person) Bool)
(declare-fun receives-universal-credit (Person) Bool)
(assert (receives-pension-credit applicant))
(assert (not (receives-universal-credit applicant)))

; 5. Verification
; Question: "Can I borrow any more?"
; We assert that the applicant CAN borrow and check for satisfiability.
; If unsat, it means the assertion contradicts the knowledge base (Answer: No).
; If sat, it means it is possible (Answer: Yes).
(assert (can-borrow-budgeting-loan applicant))

(check-sat)
(get-model)