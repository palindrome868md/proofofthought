; 1. Declare sorts
(declare-sort Problem 0)

; 2. Declare functions
(declare-fun is-easy (Problem) Bool)
(declare-fun is-hard (Problem) Bool)
(declare-fun ac-rate-low (Problem) Bool)
(declare-fun is-recommended (Problem) Bool)
(declare-fun is-starred-high (Problem) Bool)

; 3. Declare constants
(declare-const problem-2Sum Problem)
(declare-const problem-4Sum Problem)

; 4. Assert knowledge base (Premises)

; Premise 1: If a Leetcode problem is at the easy level, then its AC rate is lower than 20 percent.
(assert (forall ((p Problem))
  (=> (is-easy p) (ac-rate-low p))))

; Premise 2: All Leetcode problems that are recommended to novices are easy.
(assert (forall ((p Problem))
  (=> (is-recommended p) (is-easy p))))

; Premise 3: A Leetcode problem is either easy or hard.
; This implies exhaustiveness (Easy OR Hard)
(assert (forall ((p Problem))
  (or (is-easy p) (is-hard p))))

; Premise 3 (Semantic): Easy and Hard are mutually exclusive difficulty levels.
; This is necessary to derive a contradiction for the verification.
(assert (forall ((p Problem))
  (not (and (is-easy p) (is-hard p)))))

; Premise 4: Leetcode problems that are starred by more than one thousand users are hard.
(assert (forall ((p Problem))
  (=> (is-starred-high p) (is-hard p))))

; Premise 5: 2Sum is recommended to novices.
(assert (is-recommended problem-2Sum))

; Premise 6: 4Sum is starred by more than 1,000 users.
(assert (is-starred-high problem-4Sum))

; 5. Verification
; Statement to test: 4Sum is a Leetcode problem recommended to the novice.
; We assert the statement and check for satisfiability against the Knowledge Base.
; If 'unsat', the statement contradicts the premises (is False).
(assert (is-recommended problem-4Sum))

; 6. Check satisfiability
(check-sat)
(get-model)