; Task: Determine if the statement "P values don't represent metrics of effect" is true given premises.

(declare-const B Bool) ; B: "P values are thresholds for belief"
(declare-const A Bool) ; A: "P values don't represent metrics of effect"

; Premises
(assert B)
(assert (=> B A)) ; If P values are thresholds for belief, then they don't represent metrics of effect

; Test: The statement A
(assert A)

(check-sat)
(get-model)