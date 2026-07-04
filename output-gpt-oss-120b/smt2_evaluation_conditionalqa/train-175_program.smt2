; ------------------------------------------------------------
; Declarations
; ------------------------------------------------------------
; We only need an integer for the amount owed and a Boolean
; indicating whether the applicant can borrow another budgeting loan.
(declare-const owe_amount Int)          ; amount already owed (£)
(declare-const can_borrow Bool)        ; true iff a further loan is possible

; ------------------------------------------------------------
; Knowledge Base (policy rules)
; ------------------------------------------------------------
; Rule: If the total owed for Budgeting Loans (and Crisis Loans) exceeds
; £1,500, the applicant is NOT allowed to borrow any more.
(assert (forall ((amt Int) (b Bool))
        (=> (and (> amt 1500) b) false)))   ; (=> (> amt 1500) (not b))

; ------------------------------------------------------------
; Facts about the user
; ------------------------------------------------------------
; The user currently owes £1,600 in budgeting loans.
(assert (= owe_amount 1600))

; ------------------------------------------------------------
; Test the claim: "Can I borrow any more?"
; ------------------------------------------------------------
; We assert that the user *can* borrow another loan.
(assert (= can_borrow true))

; ------------------------------------------------------------
; Verification
; ------------------------------------------------------------
; If the constraints are consistent, the answer is "yes" (sat).
; If they are contradictory, the answer is "no" (unsat).
(check-sat)
(get-model)