(declare-sort Currency 0)

(declare-const pound-sterling Currency)

(declare-fun valuable (Currency) Bool)

; Knowledge base: Pound Sterling is valuable
(assert (valuable pound-sterling))

; Test: Is Pound Sterling valuable?
(assert (valuable pound-sterling))

(check-sat)
(get-model)