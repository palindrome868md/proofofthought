; Declare sorts
(declare-sort Problem 0)

; Declared datatype Level with constructors easy and hard
(declare-datatypes () ((Level easy hard)))

; Functions
(declare-fun novice (Problem) Bool)
(declare-fun level (Problem) Level)
(declare-fun ac (Problem) Int)
(declare-fun stars (Problem) Int)

; Constants (problems)
(declare-const twoSum Problem)
(declare-const fourSum Problem)

; Premises

; 1. If a Leetcode problem is at the easy level, then its AC rate is lower than 20 percent.
(assert (forall ((p Problem)) (=> (= (level p) easy) (< (ac p) 20))))

; 2. All Leetcode problems that are recommended to novices are easy.
(assert (forall ((p Problem)) (=> (novice p) (= (level p) easy))))

; 3. A Leetcode problem is either easy or hard.
(assert (forall ((p Problem)) (or (= (level p) easy) (= (level p) hard))))

; 4. Leetcode problems that are starred by more than one thousand users are hard.
(assert (forall ((p Problem)) (=> (> (stars p) 1000) (= (level p) hard))))

; 5. 2Sum is recommended to novices.
(assert (novice twoSum))

; 6. 4Sum is starred by more than 1,000 users.
(assert (> (stars fourSum) 1000))

; Test: Is 2Sum at the easy level?
(assert (= (level twoSum) easy))

; Check satisfiability (one check)
(check-sat)
(get-model)