; Sorts
(declare-sort Person 0)

; Constants
(declare-const dina Person)

; Predicates / Functions
(declare-fun detained (Person) Bool)
(declare-fun will-assess-health (Person) Bool)

; Knowledge base
(assert (detained dina))

; Rule: If a person is detained, the tribunal will assess their health
(assert (forall ((p Person))
  (=> (detained p)
      (will-assess-health p))))

; Test scenario: Will the tribunal assess Dina's health?
(assert (will-assess-health dina))

; Verification
(check-sat)
(get-model)