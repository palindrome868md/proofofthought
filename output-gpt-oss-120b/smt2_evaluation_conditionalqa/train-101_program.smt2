;-------------------------------------------------
; 1. Declarations
;-------------------------------------------------
(declare-const normal_hours Int)   ; usual weekly caring hours
(declare-const break_weeks  Int)   ; length of the current break (weeks)
(declare-const current_hours Int)  ; caring hours in the week we are checking

;-------------------------------------------------
; 2. Knowledge base (facts from the scenario)
;-------------------------------------------------
; The carer normally provides 25 hours per week
(assert (= normal_hours 25))

; The current break lasts 6 weeks
(assert (= break_weeks 6))

; While on holiday the carer does not provide care (0 hours this week)
(assert (= current_hours 0))

;-------------------------------------------------
; 3. Eligibility rule for Carer’s Credit
;    - either 20+ hours per week normally, OR
;    - a break of caring that is ≤ 12 weeks in a row
;-------------------------------------------------
(define-fun eligible () Bool
  (or (>= normal_hours 20)
      (and (= current_hours 0) (<= break_weeks 12))))

;-------------------------------------------------
; 4. Test the claim: "Am I still eligible while on holiday?"
;-------------------------------------------------
(assert eligible)

;-------------------------------------------------
; 5. Query
;-------------------------------------------------
(check-sat)   ; expected result: sat  (i.e., eligible)
(get-model)   ; optional: shows a concrete model satisfying the constraints