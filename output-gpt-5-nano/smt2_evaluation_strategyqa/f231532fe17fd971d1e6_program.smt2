; Declare money-related constants (in USD)
(declare-const cost-boeing737 Real)
(declare-const box-office-wonder-ww Real)

; Known amounts
(assert (= cost-boeing737 100000000))     ; Cost of a Boeing 737 ~ $100,000,000
(assert (= box-office-wonder-ww 821000000)) ; Wonder Woman (2017) worldwide box office ~ $821,000,000

; Test: Is the box office enough to cover the Boeing 737 cost?
(assert (>= box-office-wonder-ww cost-boeing737))

(check-sat)
(get-model)