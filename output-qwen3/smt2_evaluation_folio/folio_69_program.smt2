; 1. Declare sorts
(declare-sort Problem 0)

; 2. Declare functions
(declare-fun is-easy (Problem) Bool)
(declare-fun is-hard (Problem) Bool)
(declare-fun ac-rate (Problem) Int)
(declare-fun is-recommended (Problem) Bool)
(declare-fun starred-count (Problem) Int)

; 3. Declare constants
; Using quoted symbols because identifiers cannot start with digits in SMT-LIB 2.0
(declare-const |2Sum| Problem)
(declare-const |4Sum| Problem)

; 4. Assert knowledge base (premises)

; Premise 1: If a Leetcode problem is at the easy level, then its AC rate is lower than 20 percent.
(assert (forall ((p Problem))
  (=> (is-easy p) (< (ac-rate p) 20))))

; Premise 2: All Leetcode problems that are recommended to novices are easy.
(assert (forall ((p Problem))
  (=> (is-recommended p) (is-easy p))))

; Premise 3: A Leetcode problem is either easy or hard.
(assert (forall ((p Problem))
  (or (is-easy p) (is-hard p))))

; Premise 4: Leetcode problems that are starred by more than one thousand users are hard.
(assert (forall ((p Problem))
  (=> (> (starred-count p) 1000) (is-hard p))))

; Premise 5: 2Sum is recommended to novices.
(assert (is-recommended |2Sum|))

; Premise 6: 4Sum is starred by more than 1,000 users.
(assert (> (starred-count |4Sum|) 1000))

; 5. Test the statement: 2Sum is a Leetcode problem at the easy level.
; According to Premise 2 and Premise 5, 2Sum must be easy.
; Asserting this should result in 'sat' (True).
(assert (is-easy |2Sum|))

; 6. Check satisfiability
(check-sat)
(get-model)