; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun cold (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun white (Person) Bool)

; Individuals
(declare-const bob Person)
(declare-const charlie Person)
(declare-const erin Person)
(declare-const harry Person)

; Knowledge base (facts)
(assert (cold bob))
(assert (quiet charlie))
(assert (quiet erin))
(assert (big harry))

; Rules
; All big, round things are green
(assert (forall ((p Person))
  (=> (and (big p) (round p)) (green p))))
; Cold, red things are green
(assert (forall ((p Person))
  (=> (and (cold p) (red p)) (green p))))
; White, cold things are big
(assert (forall ((p Person))
  (=> (and (white p) (cold p)) (big p))))
; Cold things are big
(assert (forall ((p Person))
  (=> (cold p) (big p))))
; If something is big then it is red
(assert (forall ((p Person))
  (=> (big p) (red p))))
; If something is red and not white then it is not round
(assert (forall ((p Person))
  (=> (and (red p) (not (white p))) (not (round p)))))

; Test scenario: "Harry is not big."
(assert (not (big harry)))

; Check satisfiability
(check-sat)
(get-model)