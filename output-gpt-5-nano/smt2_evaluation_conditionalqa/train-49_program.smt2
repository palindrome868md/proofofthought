; Inheritance Tax scenario:
; - Estate value (home left to child): £400,000
; - Threshold for home to child: £500,000
; - Gifts within last 3 years: £250,000
; - Threshold for gifts within 7 years: £325,000
; - No other reliefs considered for simplicity

(declare-const estate-total Int)
(declare-const threshold-estate Int)
(declare-const estate-tax-due Bool)

(declare-const gifts-total Int)
(declare-const threshold-gifts Int)
(declare-const gifts-tax-due Bool)

(declare-const tax-due Bool)

; Facts about estate
(assert (= estate-total 400000))
(assert (= threshold-estate 500000))
(assert (= estate-tax-due (> (- estate-total threshold-estate) 0)))

; Facts about gifts
(assert (= gifts-total 250000))
(assert (= threshold-gifts 325000))
(assert (= gifts-tax-due (> (- gifts-total threshold-gifts) 0)))

; Overall tax due (true if either estate or gifts tax is due)
(assert (= tax-due (or estate-tax-due gifts-tax-due)))

; Test: is there any inheritance tax due?
(assert tax-due)
(check-sat)