; Reasoning Steps:
; 1. Analyze the Premises:
;    - P1: is_easy(p) => ac_rate(p) < 20
;    - P2: recommended_to_novices(p) => is_easy(p)
;    - P3: is_easy(p) OR is_hard(p)
;    - P4: starred_by_more_than_1000(p) => is_hard(p)
;    - P5: recommended_to_novices(2Sum)
;    - P6: starred_by_more_than_1000(4Sum)
;
; 2. Analyze the Statement to Verify:
;    - S: ac_rate(2Sum) > 20
;
; 3. Logical Deduction:
;    - From P5 and P2: 2Sum is Easy.
;    - From P1: Since 2Sum is Easy, ac_rate(2Sum) < 20.
;    - Statement S claims ac_rate(2Sum) > 20.
;    - ac_rate < 20 and ac_rate > 20 are contradictory.
;
; 4. Verification Strategy:
;    - Assert all Premises (Knowledge Base).
;    - Assert the Statement S.
;    - Run (check-sat).
;    - Expected Result: unsat (indicating S contradicts KB, so S is False).

; 1. Declare sorts
(declare-sort Problem 0)

; 2. Declare functions
(declare-fun is_easy (Problem) Bool)
(declare-fun is_hard (Problem) Bool)
(declare-fun ac_rate (Problem) Int)
(declare-fun recommended_to_novices (Problem) Bool)
(declare-fun starred_by_more_than_1000 (Problem) Bool)

; 3. Declare constants
; Using 'twoSum' and 'fourSum' as identifiers cannot start with digits
(declare-const twoSum Problem)
(declare-const fourSum Problem)

; 4. Assert knowledge base (premises)

; Premise 1: If a Leetcode problem is at the easy level, then its AC rate is lower than 20 percent.
(assert (forall ((p Problem))
  (=> (is_easy p) (< (ac_rate p) 20))))

; Premise 2: All Leetcode problems that are recommended to novices are easy.
(assert (forall ((p Problem))
  (=> (recommended_to_novices p) (is_easy p))))

; Premise 3: A Leetcode problem is either easy or hard.
(assert (forall ((p Problem))
  (or (is_easy p) (is_hard p))))

; Premise 4: Leetcode problems that are starred by more than one thousand users are hard.
(assert (forall ((p Problem))
  (=> (starred_by_more_than_1000 p) (is_hard p))))

; Premise 5: 2Sum is recommended to novices.
(assert (recommended_to_novices twoSum))

; Premise 6: 4Sum is starred by more than 1,000 users.
(assert (starred_by_more_than_1000 fourSum))

; 5. Assert the statement to be verified
; Statement: 2Sum has an AC rate higher than 20 percent.
(assert (> (ac_rate twoSum) 20))

; 6. Check satisfiability
; If 'unsat', the statement is False (contradicts premises).
; If 'sat', the statement is True (consistent with premises).
(check-sat)
(get-model)