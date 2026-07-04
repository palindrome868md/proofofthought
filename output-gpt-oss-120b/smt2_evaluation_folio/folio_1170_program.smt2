; -------------------------------------------------
;  Sort declaration
; -------------------------------------------------
(declare-sort Student 0)

; -------------------------------------------------
;  Predicate declarations (return Bool)
; -------------------------------------------------
(declare-fun good-math   (Student) Bool)
(declare-fun good-chem   (Student) Bool)
(declare-fun enjoys-exp  (Student) Bool)
(declare-fun good-plan   (Student) Bool)
(declare-fun failed      (Student) Bool)
(declare-fun passed      (Student) Bool)

; -------------------------------------------------
;  Constant for the particular student James
; -------------------------------------------------
(declare-const James Student)

; -------------------------------------------------
;  Knowledge base (premises)
; -------------------------------------------------

; 1. Some student is good at math and chemistry
(declare-const witness Student)
(assert (good-math witness))
(assert (good-chem witness))

; 2. All chemistry‑good students enjoy experiments
(assert (forall ((x Student))
        (=> (good-chem x) (enjoys-exp x))))

; 3. All who enjoy experiments are good at planning
(assert (forall ((x Student))
        (=> (enjoys-exp x) (good-plan x))))

; 4. No student who is good at planning failed the class
(assert (forall ((x Student))
        (=> (good-plan x) (not (failed x)))))

; 5. James is either (good‑chem ∧ failed) or (¬good‑chem ∧ passed)
(assert (or (and (good-chem James) (failed James))
            (and (not (good-chem James)) (passed James))))

; -------------------------------------------------
;  Statement to be verified:
;  "James is good at math and chemistry."
; -------------------------------------------------
(assert (and (good-math James) (good-chem James)))

; -------------------------------------------------
;  Check the consistency of the whole set
; -------------------------------------------------
(check-sat)   ; expected result: unsat (the statement cannot hold)
(get-model)   ; optional, will be empty because the problem is unsat