; Declare sorts
(declare-sort Person 0)

; Declare constants representing the two people in the scenario
(declare-const me Person)
(declare-const husband Person)

; Ensure the two constants refer to distinct individuals
(assert (not (= me husband)))

; Adoption-leave predicate: true if a person takes statutory adoption leave
(declare-fun adoption-leave (Person) Bool)

; Constraint: Only one person in a couple can take adoption leave
; If two (not necessarily distinct) people both have adoption leave, they must be the same person
(assert (forall ((p Person) (q Person))
  (=> (and (adoption-leave p) (adoption-leave q))
      (= p q))))

; Test scenario: both partners take adoption leave
(assert (adoption-leave me))
(assert (adoption-leave husband))

; Check whether this scenario is satisfiable (i.e., can both take paid time off)
(check-sat)
(get-model)