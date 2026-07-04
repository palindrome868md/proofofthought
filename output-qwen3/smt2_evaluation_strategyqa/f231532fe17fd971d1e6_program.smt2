; Declare sorts
(declare-sort Aircraft 0)
(declare-sort Film 0)

; Declare functions
(declare-fun aircraft-cost (Aircraft) Int)
(declare-fun box-office-receipts (Film) Int)

; Declare constants
(declare-const boeing-737 Aircraft)
(declare-const wonder-woman-2017 Film)

; Knowledge base - values in USD
; Boeing 737 cost: approximately 80 million USD (varies by model, range 50-100 million)
(assert (= (aircraft-cost boeing-737) 80000000))

; Wonder Woman (2017) box office: approximately 822 million USD worldwide
(assert (= (box-office-receipts wonder-woman-2017) 822000000))

; Test: Does Wonder Woman box office cover Boeing 737 cost?
; Assert the condition we want to verify
(assert (>= (box-office-receipts wonder-woman-2017) (aircraft-cost boeing-737)))

; Check satisfiability
; sat = Yes, box office covers the cost
; unsat = No, box office does not cover the cost
(check-sat)
(get-model)