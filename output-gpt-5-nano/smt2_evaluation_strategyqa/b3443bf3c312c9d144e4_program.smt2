; Question: Is there a full Neptunian orbit between the first two burials of women in the Panthéon?
; Model years as integers. A "full Neptunian orbit" is approximated by 165 years.

(declare-const first_woman_burial_year Int)
(declare-const second_woman_burial_year Int)
(assert (< first_woman_burial_year second_woman_burial_year))

(declare-const neptunian_period Int)
(assert (= neptunian_period 165))

; Test: is the time between the two burials at least one full Neptunian orbit?
(assert (>= (- second_woman_burial_year first_woman_burial_year) neptunian_period))

(check-sat)
(get-model)