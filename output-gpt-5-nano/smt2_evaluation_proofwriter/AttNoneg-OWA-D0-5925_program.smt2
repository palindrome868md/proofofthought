; Knowledge base for the question
(declare-sort Person 0)

; Individuals
(declare-const Charlie Person)
(declare-const Gary Person)

; Predicates (properties)
(declare-fun is-smart (Person) Bool)
(declare-fun is-red   (Person) Bool)
(declare-fun is-cold  (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-nice  (Person) Bool)
(declare-fun is-big   (Person) Bool)

; Facts
(assert (is-smart Charlie))
(assert (is-red Gary))

; Rules
; If something is cold and rough, then it is nice
(assert (forall ((p Person))
  (=> (and (is-cold p) (is-rough p))
      (is-nice p))))

; If something is smart, then it is big
(assert (forall ((p Person))
  (=> (is-smart p)
      (is-big p))))

; Test scenario: Charlie is not smart
(assert (not (is-smart Charlie)))

; Check satisfiability for the scenario
(check-sat)
(get-model)