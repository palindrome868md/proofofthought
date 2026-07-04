; -------------------------------------------------
; 1. Declare the uninterpreted sort for LeetCode problems
; -------------------------------------------------
(declare-sort Problem 0)

; -------------------------------------------------
; 2. Declare predicates (functions returning Bool)
; -------------------------------------------------
(declare-fun easy          (Problem) Bool)   ; problem is at the easy level
(declare-fun hard          (Problem) Bool)   ; problem is at the hard level
(declare-fun low_ac        (Problem) Bool)   ; AC‑rate < 20 %
(declare-fun recommended   (Problem) Bool)   ; recommended to novices
(declare-fun starred       (Problem) Bool)   ; starred by > 1000 users

; -------------------------------------------------
; 3. Name the two concrete problems
; -------------------------------------------------
(declare-const twoSum  Problem)
(declare-const fourSum Problem)

; -------------------------------------------------
; 4. Encode the premises
; -------------------------------------------------
; (1) Easy ⇒ low AC‑rate
(assert (forall ((p Problem))
  (=> (easy p) (low_ac p))))

; (2) Recommended ⇒ Easy
(assert (forall ((p Problem))
  (=> (recommended p) (easy p))))

; (3) Every problem is Easy or Hard (exclusive interpretation)
(assert (forall ((p Problem))
  (or (easy p) (hard p))))
; optional exclusivity (not required for the entailment)
(assert (forall ((p Problem))
  (not (and (easy p) (hard p)))))

; (4) Starred ⇒ Hard
(assert (forall ((p Problem))
  (=> (starred p) (hard p))))

; (5) 2Sum is recommended to novices
(assert (recommended twoSum))

; (6) 4Sum is starred by >1000 users
(assert (starred fourSum))

; -------------------------------------------------
; 5. Test the statement: "2Sum is a Leetcode problem at the easy level."
; -------------------------------------------------
(assert (easy twoSum))

; -------------------------------------------------
; 6. Ask Z3 whether the whole set of constraints is satisfiable
; -------------------------------------------------
(check-sat)
(get-model)