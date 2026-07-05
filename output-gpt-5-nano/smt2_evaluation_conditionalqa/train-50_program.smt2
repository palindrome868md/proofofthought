(declare-sort Person 0)

; Individuals
(declare-const husband Person)
(declare-const wife Person)

; Predicates and relations
(declare-fun ex_employee (Person) Bool)
(declare-fun would_be_eligible (Person) Bool)
(declare-fun is_widow (Person) Bool)
(declare-fun spouse (Person) Person)
(declare-fun eligible (Person) Bool)

; Facts about the scenario
(assert (ex_employee husband))
(assert (would_be_eligible husband))
(assert (is_widow wife))
(assert (= (spouse husband) wife))

; Rule: If p is an ex-employee who would have been eligible and is married to someone who is a widow,
; then that widow is eligible for NCFS.
(assert (forall ((p Person))
  (=> (and (ex_employee p)
           (would_be_eligible p)
           (= (spouse p) wife)
           (is_widow wife))
      (eligible wife))))

; Test scenario: Am I eligible? (Is the wife eligible?)
(assert (eligible wife))

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)