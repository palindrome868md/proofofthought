; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const erin Person)

; Declare predicates
(declare-fun red (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun big (Person) Bool)

; Knowledge base
(assert (forall ((p Person)) (=> (red p) (nice p))))
(assert (=> (nice erin) (cold erin)))
(assert (=> (cold erin) (big erin)))
(assert (red erin))

; Test: Erin is not cold
(assert (not (cold erin)))

; Check satisfiability
(check-sat)