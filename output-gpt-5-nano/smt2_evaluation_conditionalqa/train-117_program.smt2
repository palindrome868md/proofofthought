; Sorts
(declare-sort Person 0)

; Predicates / Properties
(declare-fun live-in-england (Person) Bool)
(declare-fun is-undergraduate (Person) Bool)
(declare-fun qualifies-student-finance (Person) Bool)
(declare-fun course-lasts-year (Person) Bool)
(declare-fun has-disability-affecting-study (Person) Bool)

; Entitlement predicate
(declare-fun dsa-entitled (Person) Bool)

; Test subject
(declare-const me Person)

; Knowledge base: DSA eligibility rules
(assert (forall ((p Person))
  (=> (and (live-in-england p)
           (is-undergraduate p)
           (qualifies-student-finance p)
           (course-lasts-year p)
           (has-disability-affecting-study p))
      (dsa-entitled p))))

; Facts about the scenario (the student)
(assert (live-in-england me))
(assert (is-undergraduate me))
(assert (qualifies-student-finance me))
(assert (course-lasts-year me))
(assert (has-disability-affecting-study me))

; Test scenario: Does this student have DSA entitlement?
(assert (dsa-entitled me))

; Check satisfiability and produce a model
(check-sat)
(get-model)