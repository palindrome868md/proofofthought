; Sorts
(declare-sort Spirit 0)

; Constants
(declare-const spirit Spirit)

; Functions
(declare-fun broadcasts (Spirit Int) Bool)
(declare-fun makes_news (Spirit Int) Bool)

; Knowledge base
; If a Spirit broadcasts in year y, it makes the news in year y
(assert (forall ((s Spirit) (y Int))
  (=> (broadcasts s y) (makes_news s y))))

; Fact: Spirit broadcasts in 2020
(assert (broadcasts spirit 2020))

; Test scenario: Would a broadcast from Spirit make the news in 2020?
(assert (makes_news spirit 2020))

; Check satisfiability and obtain a model
(check-sat)
(get-model)