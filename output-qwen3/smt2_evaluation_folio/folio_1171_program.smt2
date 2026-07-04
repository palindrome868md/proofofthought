; Declare sorts
(declare-sort Student 0)

; Declare functions/predicates
(declare-fun good-at-math (Student) Bool)
(declare-fun good-at-chemistry (Student) Bool)
(declare-fun enjoys-experiments (Student) Bool)
(declare-fun good-at-planning (Student) Bool)
(declare-fun failed-class (Student) Bool)

; Declare constant for James
(declare-const james Student)

; Premise 1: Some students good at math are also good at chemistry (existential)
(declare-const some-student Student)
(assert (and (good-at-math some-student) (good-at-chemistry some-student)))

; Premise 2: All students good at chemistry enjoy experiments
(assert (forall ((s Student))
  (=> (good-at-chemistry s) (enjoys-experiments s))))

; Premise 3: All students who enjoy experiments are good at planning
(assert (forall ((s Student))
  (=> (enjoys-experiments s) (good-at-planning s))))

; Premise 4: None of the students good at planning failed the class
(assert (forall ((s Student))
  (=> (good-at-planning s) (not (failed-class s)))))

; Premise 5: James is either (good at chemistry AND failed) OR (bad at chemistry AND passed)
(assert (or 
  (and (good-at-chemistry james) (failed-class james))
  (and (not (good-at-chemistry james)) (not (failed-class james)))))

; Test statement: James failed the class AND is good at math
(assert (and (failed-class james) (good-at-math james)))

; Check satisfiability
(check-sat)
(get-model)