; Question: Is average number of peas in a pod enough commas for a billion?
; Model as an integer to avoid real/coercion issues.

(declare-const avg_peas_in_pod Int)

; Knowledge base: plausible realistic bounds
(assert (>= avg_peas_in_pod 0))
(assert (<= avg_peas_in_pod 3))  ; assume average <= 3 peas per pod (reasonable bound)

; Test: would the average be at least a billion?
(assert (>= avg_peas_in_pod 1000000000))

(check-sat)