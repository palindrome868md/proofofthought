; The Childcare Grant is a financial aid that does not have to be paid back.
; We model this by declaring a Grant type and a repayable predicate.

(declare-sort Grant 0)
(declare-const childcare-grant Grant)

; repayable: Grant -> Bool
(declare-fun repayable (Grant) Bool)

; Knowledge base: childcare-grant is not repayable
(assert (not (repayable childcare-grant)))

; Test: Do you repay it? (i.e., is repayable true for the childcare grant?)
(assert (repayable childcare-grant))

(check-sat)
(get-model)