; -------------------------------------------------
; Sorts
; -------------------------------------------------
(declare-sort Student 0)

; -------------------------------------------------
; Functions (unary predicates)
; -------------------------------------------------
(declare-fun good_math (Student) Bool)
(declare-fun good_chem (Student) Bool)
(declare-fun enjoy_exp (Student) Bool)
(declare-fun good_plan (Student) Bool)
(declare-fun failed (Student) Bool)

; -------------------------------------------------
; Constants
; -------------------------------------------------
(declare-const james Student)
(declare-const some_student Student)   ; witnesses the existential fact

; -------------------------------------------------
; Knowledge base (premises)
; -------------------------------------------------
; 1. Some student is good at math and good at chemistry
(assert (and (good_math some_student) (good_chem some_student)))

; 2. All students good at chemistry enjoy experiments
(assert (forall ((s Student))
  (=> (good_chem s) (enjoy_exp s))))

; 3. All students who enjoy experiments are good at planning
(assert (forall ((s Student))
  (=> (enjoy_exp s) (good_plan s))))

; 4. No student who is good at planning failed the class
(assert (forall ((s Student))
  (=> (good_plan s) (not (failed s)))))

; 5. James: (good_chem ∧ failed)  or  (¬good_chem ∧ passed)
;    “passed” is interpreted as ¬failed
(assert (or (and (good_chem james) (failed james))
            (and (not (good_chem james)) (not (failed james)))))

; -------------------------------------------------
; Negation of the target statement
; -------------------------------------------------
; Statement: (good_chem(james) ∨ failed(james)) → (good_plan(james) ∨ good_math(james))
; Negation:   (good_chem(james) ∨ failed(james)) ∧ ¬(good_plan(james) ∨ good_math(james))
(assert (and (or (good_chem james) (failed james))
             (not (or (good_plan james) (good_math james)))))

; -------------------------------------------------
; Check whether the premises together with the
; negated statement are satisfiable.
; -------------------------------------------------
(check-sat)
(get-model)