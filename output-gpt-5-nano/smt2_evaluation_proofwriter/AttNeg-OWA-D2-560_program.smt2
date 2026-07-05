; Question: Erin is not cold

; Sorts
(declare-sort Person 0)

; Constants
(declare-const anne Person)
(declare-const dave Person)
(declare-const erin Person)

; Predicates
(declare-fun young (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun smart (Person) Bool)

; Facts
(assert (young anne))
(assert (young dave))
(assert (white erin))

; Rules
(assert (forall ((p Person)) (=> (white p) (green p))))
(assert (forall ((p Person)) (=> (green p) (not (cold p)))))
(assert (forall ((p Person)) (=> (green p) (blue p))))
(assert (forall ((p Person)) (=> (and (white p) (blue p)) (nice p))))
(assert (=> (nice anne) (green anne)))
(assert (=> (and (nice anne) (cold anne)) (not (young anne))))
(assert (forall ((p Person)) (=> (young p) (not (blue p)))))
(assert (forall ((p Person)) (=> (and (young p) (not (green p))) (not (smart p)))))

; Query: Erin is not cold
(assert (not (cold erin)))

(check-sat)
(get-model)