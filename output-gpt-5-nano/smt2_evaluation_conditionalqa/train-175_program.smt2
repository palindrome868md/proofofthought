; Eligibility and debt context for Budgeting Loans
(declare-const has-pension-credit Bool)
(declare-const on-universal-credit Bool)
(declare-const total-debt Int)

; Scenario facts
(assert has-pension-credit)
(assert (not on-universal-credit))
(assert (= total-debt 1600))

; Question: can you borrow any more?
; There must exist a new borrowing amount b (minimum £100) such that
; total debt after borrowing does not exceed £1500.
(assert (exists ((b Int))
  (and (>= b 100)
       (<= (+ total-debt b) 1500))))

(check-sat)