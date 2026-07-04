;--- Declarations -------------------------------------------------
(declare-sort Problem 0)

(declare-fun easy (Problem) Bool)          ; problem is easy
(declare-fun hard (Problem) Bool)          ; problem is hard
(declare-fun recommended (Problem) Bool)   ; recommended to novices
(declare-fun starred (Problem) Bool)       ; starred by >1000 users
(declare-fun low_ac (Problem) Bool)        ; AC‑rate < 20 %

(declare-const twoSum Problem)
(declare-const fourSum Problem)

;--- Knowledge base (premises) ------------------------------------
; 1. Easy → low AC rate
(assert (forall ((p Problem))
        (=> (easy p) (low_ac p))))

; 2. Recommended → Easy
(assert (forall ((p Problem))
        (=> (recommended p) (easy p))))

; 3. (Optional) Every problem is Easy or Hard
; (assert (forall ((p Problem)) (or (easy p) (hard p))))

; 4. Starred → Hard
(assert (forall ((p Problem))
        (=> (starred p) (hard p))))

; 5. 2Sum is recommended to novices
(assert (recommended twoSum))

; 6. 4Sum is starred by >1000 users
(assert (starred fourSum))

;--- Test the statement -------------------------------------------
; Statement: "2Sum has an AC rate higher than 20 %"  ⇔  ¬low_ac(twoSum)
(assert (not (low_ac twoSum)))

;--- Solve ---------------------------------------------------------
(check-sat)
(get-model)