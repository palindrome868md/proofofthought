; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const me Person)

; Declare predicates/functions
(declare-fun is-full-time-student (Person) Bool)
(declare-fun has-children (Person) Bool)
(declare-fun eligible-for-PLA (Person) Bool)
(declare-fun is-working (Person) Bool)

; Knowledge base
(assert (is-full-time-student me))
(assert (has-children me))
; Scenario: currently not working
(assert (not (is-working me)))

; Rule: full-time student with dependent children => eligible for Parents' Learning Allowance
(assert (forall ((p Person))
  (=> (and (is-full-time-student p) (has-children p))
      (eligible-for-PLA p))))

; Test: Can I make a claim for PLA?
(assert (eligible-for-PLA me))

; Check satisfiability
(check-sat)
(get-model)