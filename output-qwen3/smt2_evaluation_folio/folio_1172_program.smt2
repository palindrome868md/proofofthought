; 1. Declare sorts
(declare-sort Individual 0)

; 2. Declare functions (predicates)
(declare-fun is_student (Individual) Bool)
(declare-fun good_at_math (Individual) Bool)
(declare-fun good_at_chem (Individual) Bool)
(declare-fun enjoys_exp (Individual) Bool)
(declare-fun good_at_plan (Individual) Bool)
(declare-fun failed_class (Individual) Bool)

; 3. Declare constants
(declare-const James Individual)
(declare-const witness Individual)

; 4. Assert knowledge base

; James is a student
(assert (is_student James))

; Premise 1: Some students in the class who are good at math are also good at chemistry.
; We represent "Some" by declaring a witness constant.
(assert (is_student witness))
(assert (good_at_math witness))
(assert (good_at_chem witness))

; Premise 2: All students in the class who are good at chemistry enjoy conducting experiments.
(assert (forall ((x Individual))
  (=> (and (is_student x) (good_at_chem x))
      (enjoys_exp x))))

; Premise 3: All students in the class that enjoy conducting experiments are good at planning.
(assert (forall ((x Individual))
  (=> (and (is_student x) (enjoys_exp x))
      (good_at_plan x))))

; Premise 4: None of the students who are good at planning failed the class.
(assert (forall ((x Individual))
  (=> (and (is_student x) (good_at_plan x))
      (not (failed_class x)))))

; Premise 5: James is either (good at chemistry and failed) or (bad at chemistry and passed).
; "Passed" is equivalent to "Not Failed".
(assert (or 
  (and (good_at_chem James) (failed_class James))
  (and (not (good_at_chem James)) (not (failed_class James)))
))

; 5. Assert the Statement to Verify
; Statement: If James is good at Chemistry or failed the class, 
;            then James is either good at planning or good at math.
(assert (=> 
  (or (good_at_chem James) (failed_class James))
  (or (good_at_plan James) (good_at_math James))
))

; 6. Check satisfiability
; sat = Statement is True (consistent with KB)
; unsat = Statement is False (contradicts KB)
(check-sat)
(get-model)