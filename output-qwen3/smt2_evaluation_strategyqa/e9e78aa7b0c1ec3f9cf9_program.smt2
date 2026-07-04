; Question: Is average number of peas in a pod enough commas for a billion?
; This asks: Is (average peas per pod) >= (number of commas in 1 billion)?

; Declare functions for the quantities
(declare-fun average-peas-per-pod () Int)
(declare-fun commas-in-billion () Int)

; Knowledge Base:
; Average number of peas in a garden pea pod is typically 5-7
; We use 6 as the average
(assert (= average-peas-per-pod 6))

; One billion written as 1,000,000,000 has commas every 3 digits
; Counting: 1,000,000,000 has 3 commas
(assert (= commas-in-billion 3))

; Test: Is average peas per pod >= commas in a billion?
; If sat, then YES (enough peas)
; If unsat, then NO (not enough peas)
(assert (>= average-peas-per-pod commas-in-billion))

; Check satisfiability
(check-sat)
(get-model)