(declare-sort Person 0)
(declare-sort Field 0)

; Predicates
(declare-fun is-geographer (Person) Bool)
(declare-fun uses (Person Field) Bool)

; Test constants
(declare-const witness Person)
(declare-const biochemistry Field)

; Scenario: Would a geographer use biochemistry in their work?
(assert (is-geographer witness))
(assert (uses witness biochemistry))

(check-sat)
(get-model)