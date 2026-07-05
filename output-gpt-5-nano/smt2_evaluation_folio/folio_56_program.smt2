; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const thomas-barber Person)
(declare-const witness Person)

; Declare predicates
(declare-fun is-english (Person) Bool)
(declare-fun is-professional-footballer (Person) Bool)
(declare-fun scored-winning-goal-fa-cup-1913 (Person) Bool)

; Knowledge base
(assert (is-english thomas-barber))
(assert (is-professional-footballer thomas-barber))
(assert (scored-winning-goal-fa-cup-1913 thomas-barber))

; Test: There exists a person who is English, a professional footballer, and scored the winning goal in the 1913 FA Cup Final
(assert (and (is-english witness)
             (is-professional-footballer witness)
             (scored-winning-goal-fa-cup-1913 witness)))

; Check satisfiability
(check-sat)
(get-model)