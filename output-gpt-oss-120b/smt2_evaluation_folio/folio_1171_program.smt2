; ------------------------------------------------------------
; 1. Sort declaration
; ------------------------------------------------------------
(declare-sort Student 0)

; ------------------------------------------------------------
; 2. Predicate (function) declarations
; ------------------------------------------------------------
(declare-fun good_math (Student) Bool)
(declare-fun good_chem (Student) Bool)
(declare-fun enjoys_exp (Student) Bool)
(declare-fun good_plan (Student) Bool)
(declare-fun failed (Student) Bool)
(declare-fun passed (Student) Bool)

; ------------------------------------------------------------
; 3. Constant declarations
; ------------------------------------------------------------
(declare-const James Student)
(declare-const witness Student)   ; witness for the existential premise

; ------------------------------------------------------------
; 4. Knowledge base (premises)
; ------------------------------------------------------------

; 4.1  Some students are good at math and also good at chemistry
(assert (and (good_math witness) (good_chem witness)))

; 4.2  All students good at chemistry enjoy conducting experiments
(assert (forall ((s Student))
          (=> (good_chem s) (enjoys_exp s))))

; 4.3  All students that enjoy experiments are good at planning
(assert (forall ((s Student))
          (=> (enjoys_exp s) (good_plan s))))

; 4.4  No student that is good at planning failed the class
(assert (forall ((s Student))
          (=> (good_plan s) (not (failed s)))))

; 4.5  Passed and failed are mutually exclusive
(assert (forall ((s Student)) (=> (passed s) (not (failed s)))))
(assert (forall ((s Student)) (=> (failed s) (not (passed s)))))

; 4.6  James is either (good_chem ∧ failed) or (¬good_chem ∧ passed)
(assert (or (and (good_chem James) (failed James))
            (and (not (good_chem James)) (passed James))))

; ------------------------------------------------------------
; 5. Statement to be verified:
;    "James failed the class and is good at math."
; ------------------------------------------------------------
(assert (and (failed James) (good_math James)))

; ------------------------------------------------------------
; 6. Check satisfiability
; ------------------------------------------------------------
(check-sat)   ; expected result: unsat  (statement is false)
(get-model)