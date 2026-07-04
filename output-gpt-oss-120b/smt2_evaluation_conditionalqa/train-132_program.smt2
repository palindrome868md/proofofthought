;----------------------------------------------
;  Declarations
;----------------------------------------------
(declare-sort Person 0)

(declare-fun income (Person) Int)          ; adjusted net income of a person
(declare-const self Person)                ; "me"
(declare-const partner Person)             ; "my partner"

(declare-const childBenefit Bool)          ; we (or partner) receive Child Benefit

;----------------------------------------------
;  Knowledge base (facts from the scenario)
;----------------------------------------------
; Combined income is just over £50,000
(assert (> (+ (income self) (income partner)) 50000))

; Each individual is at most £50,000 (so neither exceeds the threshold)
(assert (<= (income self) 50000))
(assert (<= (income partner) 50000))

; Child Benefit is (or will be) received
(assert childBenefit)

;----------------------------------------------
;  Rule: when does the High Income Child Benefit Tax Charge apply?
;----------------------------------------------
; The charge applies if an individual's income > 50,000 and childBenefit is true.
; We express the *necessity* of the charge as a boolean expression `mustPay`.
(declare-const mustPay Bool)
(assert (= mustPay (or (and (> (income self) 50000) childBenefit)
                       (and (> (income partner) 50000) childBenefit))))

;----------------------------------------------
;  Test the question:
;  "Do we have to pay the High Income Child Benefit Tax Charge?"
;  → assert that we must pay and see if this is possible.
;----------------------------------------------
(assert mustPay)        ; assume we have to pay

;----------------------------------------------
;  Check satisfiability
;----------------------------------------------
(check-sat)   ; expected: unsat (the situation cannot force a tax charge)
(get-model)