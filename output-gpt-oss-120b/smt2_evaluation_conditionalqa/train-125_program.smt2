; ------------------------------------------------------------
;  Declarations
; ------------------------------------------------------------
(declare-sort Person 0)

; Ages and monetary amounts are integers or reals
(declare-const kid Person)
(declare-const age Int)                ; age of the child
(declare-const total_income Real)      ; total contract amount (£)
(declare-const weeks Int)              ; length of contract in weeks
(declare-const weekly_income Real)     ; derived weekly pay
(declare-const personal_allowance Real) ; 2023/24 Personal Allowance (£)

; Boolean flag: does the employer need to operate PAYE for this child?
(declare-const needPAYE Bool)

; ------------------------------------------------------------
;  Knowledge Base (facts about the situation)
; ------------------------------------------------------------
(assert (= age 10))                     ; child is 10 years old
(assert (= total_income 10000))         ; £10 000 total
(assert (= weeks 26))                   ; six months ≈ 26 weeks
(assert (= weekly_income (/ total_income (to_real weeks)))) ; £/week
(assert (= personal_allowance 12570))   ; current Personal Allowance

; ------------------------------------------------------------
;  PAYE Rules extracted from the document
; ------------------------------------------------------------
; Rule 1: any employee paid > £120 per week triggers PAYE
(assert (=> (> weekly_income 120) needPAYE))

; Rule 2: children under 16 trigger PAYE only if total income > Personal Allowance
(assert (=> (and (< age 16) (> total_income personal_allowance)) needPAYE))

; Rule 3: if neither condition holds, PAYE is NOT required
(assert (=> (and (not (> weekly_income 120))
                 (not (and (< age 16) (> total_income personal_allowance))))
            (not needPAYE)))

; ------------------------------------------------------------
;  Test the question: "Do I have to ask the salary to be paid through PAYE?"
;  We assert the opposite (that PAYE is required) and expect UNSAT.
; ------------------------------------------------------------
(assert needPAYE)   ; assume PAYE is required

(check-sat)        ; should be unsat → answer is NO
(get-model)        ; (optional) model if it were sat