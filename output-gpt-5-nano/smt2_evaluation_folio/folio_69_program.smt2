; Sorts
(declare-sort Problem 0)

; Predicates and functions
(declare-fun easy (Problem) Bool)
(declare-fun hard (Problem) Bool)
(declare-fun novice_rec (Problem) Bool)
(declare-fun ac_rate (Problem) Int)
(declare-fun star_count (Problem) Int)

; Constants
(declare-const twoSum Problem)
(declare-const fourSum Problem)

; Knowledge base

; All novice-recommended problems are easy
(assert (forall ((p Problem)) (=> (novice_rec p) (easy p))))

; If a problem is easy, its AC rate is < 20
(assert (forall ((p Problem)) (=> (easy p) (< (ac_rate p) 20))))

; A Leetcode problem is either easy or hard
(assert (forall ((p Problem)) (or (easy p) (hard p))))

; Problems starred by more than 1000 users are hard
(assert (forall ((p Problem)) (=> (> (star_count p) 1000) (hard p))))

; Facts given in the problem
(assert (novice_rec twoSum))
(assert (> (star_count fourSum) 1000))

; Test: Is twoSum an easy problem?
(assert (easy twoSum))

; Verification
(check-sat)
(get-model)