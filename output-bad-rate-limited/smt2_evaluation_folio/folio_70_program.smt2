; Sorts
(declare-sort Problem 0)

; Predicates
(declare-fun easy (Problem) Bool)
(declare-fun hard (Problem) Bool)
(declare-fun novice-recommended (Problem) Bool)
(declare-fun starred (Problem) Bool)
(declare-fun ac-rate (Problem) Real)

; Constants (Leetcode problems)
(declare-const twoSum Problem)
(declare-const fourSum Problem)

; Knowledge base

; 1) If a Leetcode problem is easy, then its AC rate is lower than 20 percent
(assert (forall ((p Problem)) (=> (easy p) (< (ac-rate p) 20))))

; 2) All problems recommended to novices are easy
(assert (forall ((p Problem)) (=> (novice-recommended p) (easy p))))

; 3) A Leetcode problem is either easy or hard
(assert (forall ((p Problem)) (or (easy p) (hard p))))
;   Exclusivity: not both easy and hard
(assert (forall ((p Problem)) (not (and (easy p) (hard p)))))

; 4) Problems starred by more than 1000 users are hard
(assert (forall ((p Problem)) (=> (starred p) (hard p))))

; Facts from premises
; 5) 2Sum is recommended to novices
(assert (novice-recommended twoSum))

; 6) 4Sum is starred by more than 1,000 users
(assert (starred fourSum))

; Test the statement: "4Sum is a Leetcode problem recommended to the novice."
(assert (novice-recommended fourSum))

; Check satisfiability to determine truth of the statement
(check-sat)