; --- Sorts ---------------------------------------------------------
; (Int is a built‑in sort, no declaration needed)

; --- Constants -----------------------------------------------------
(declare-const avg_peas_per_pod Int)   ; average number of peas in a pod
(declare-const billion          Int)   ; the number 1,000,000,000

; --- Knowledge base ------------------------------------------------
; A realistic average: about 6 peas per pod
(assert (= avg_peas_per_pod 6))

; Define a billion explicitly
(assert (= billion 1000000000))

; --- Test the claim ------------------------------------------------
; "enough commas for a billion" is interpreted as "≥ 1 billion"
(assert (>= avg_peas_per_pod billion))

; --- Decision ------------------------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)   ; optional: shows the concrete values used