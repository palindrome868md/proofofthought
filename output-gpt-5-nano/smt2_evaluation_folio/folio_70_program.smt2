; Declare sorts
(declare-sort Problem 0)

; Predicates and functions
(declare-fun easy (Problem) Bool)
(declare-fun hard (Problem) Bool)
(declare-fun novice-recommended (Problem) Bool)
(declare-fun ac-rate (Problem) Int)
(declare-fun stars (Problem) Int)

; Constants
(declare-const twoSum Problem)
(declare-const fourSum Problem)

; Knowledge base

; 1. If novice-recommended then easy
(assert (forall ((p Problem)) (=> (novice-recommended p) (easy p))))

; 2. If easy then AC rate < 20
(assert (forall ((p Problem)) (=> (easy p) (< (ac-rate p) 20))))

; 3. A problem is either easy or hard (exclusive)
(assert (forall ((p Problem)) (or (easy p) (hard p))))
(assert (forall ((p Problem)) (not (and (easy p) (hard p)))))

; 4. If stars > 1000 then hard
(assert (forall ((p Problem)) (=> (> (stars p) 1000) (hard p))))

; 5. 4Sum is starred by more than 1000 users
(assert (> (stars fourSum) 1000))

; 6. 2Sum is novice-recommended
(assert (novice-recommended twoSum))

; Test: Is fourSum novice-recommended?
(assert (novice-recommended fourSum))

; Check satisfiability
(check-sat)
(get-model)