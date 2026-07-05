; Sort declarations
(declare-sort Papaya 0)
(declare-sort Part 0)

; Constants
(declare-const papaya1 Papaya)
(declare-const center Part)
(declare-const flesh Part)
(declare-const skin Part)
(declare-const seeds Part)

; Distinct parts of the papaya
(assert (distinct center flesh skin seeds))

; Score function: taste-score papaya part -> Int
(declare-fun taste-score (Papaya Part) Int)

; Knowledge base: scores for papaya1
(assert (= (taste-score papaya1 center) 9))
(assert (= (taste-score papaya1 flesh) 7))
(assert (= (taste-score papaya1 skin) 3))
(assert (= (taste-score papaya1 seeds) 2))

; Test scenario: is the center the best-tasting part?
(assert (> (taste-score papaya1 center) (taste-score papaya1 flesh)))
(assert (> (taste-score papaya1 center) (taste-score papaya1 skin)))
(assert (> (taste-score papaya1 center) (taste-score papaya1 seeds)))

(check-sat)