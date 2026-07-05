; Sorts
(declare-sort Problem 0)

; Predicates
(declare-fun is-easy (Problem) Bool)
(declare-fun is-hard (Problem) Bool)
(declare-fun is-novice-recommended (Problem) Bool)
(declare-fun ac-rate (Problem) Real)
; Stars (popularity measure)
(declare-fun stars (Problem) Int)

; Constants
(declare-const two-sum Problem)
(declare-const four-sum Problem)

; Knowledge base

; 1. A problem is either easy or hard (exclusive)
(assert (forall ((p Problem))
  (or (is-easy p) (is-hard p))))
(assert (forall ((p Problem))
  (not (and (is-easy p) (is-hard p)))))

; 2. Novice-recommended -> easy
(assert (forall ((p Problem))
  (=> (is-novice-recommended p)
      (is-easy p))))

; 3. If easy, then AC rate < 20
(assert (forall ((p Problem))
  (=> (is-easy p)
      (< (ac-rate p) 20))))

; 4. Hard if stars > 1000
(assert (forall ((p Problem))
  (=> (> (stars p) 1000)
      (is-hard p))))

; 5. 2Sum is novice-recommended
(assert (is-novice-recommended two-sum))

; 6. 4Sum is starred by more than 1000 users
(assert (> (stars four-sum) 1000))

; Test scenario: Does 2Sum have AC rate higher than 20%?
(assert (> (ac-rate two-sum) 20))

; Check satisfiability and model
(check-sat)
(get-model)