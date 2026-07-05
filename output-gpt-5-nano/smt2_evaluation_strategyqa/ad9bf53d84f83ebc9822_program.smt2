(declare-sort Franchise 0)

(declare-const dragon_ball Franchise)
(declare-const friday_13th Franchise)

(declare-fun projects (Franchise) Int)

; Knowledge base: number of projects (shows + movies) for each franchise
(assert (= (projects dragon_ball) 8))
(assert (= (projects friday_13th) 12))

; Test: Does Dragon Ball show and movie projects fall short of Friday the 13th?
(assert (< (projects dragon_ball) (projects friday_13th)))

(check-sat)
(get-model)