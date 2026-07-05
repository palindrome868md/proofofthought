; Declare sorts
(declare-sort Person 0)

; Declare constants (the scenario: you as applicant, missing partner as the subject)
(declare-const applicant Person)
(declare-const missing Person)

; Predicates
(declare-fun is-missing (Person) Bool)
(declare-fun is-business-partner (Person Person) Bool)
(declare-fun days-missing (Person) Int)
(declare-fun can-apply-guardianship (Person Person) Bool)

; Knowledge base
(assert (is-missing missing))
(assert (is-business-partner applicant missing))
(assert (>= (days-missing missing) 90))

; Rule: if the missing person is missing for at least 90 days and the applicant is their business partner, then the applicant can apply
(assert (forall ((a Person) (m Person))
  (=> (and (is-missing m) (is-business-partner a m) (>= (days-missing m) 90))
      (can-apply-guardianship a m))))

; Test: Can the applicant apply to guardianship the missing partner's finances?
(assert (can-apply-guardianship applicant missing))

; Check satisfiability and obtain a model
(check-sat)
(get-model)