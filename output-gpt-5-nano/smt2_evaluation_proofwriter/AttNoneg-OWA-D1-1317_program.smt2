; Sorts
(declare-sort Person 0)

; Constants
(declare-const Bob Person)
(declare-const Dave Person)
(declare-const Fiona Person)
(declare-const Harry Person)

; Predicates
(declare-fun cold (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun rough (Person) Bool)

; Knowledge base (facts)
(assert (cold Bob))
(assert (white Bob))

(assert (big Dave))
(assert (cold Dave))
(assert (quiet Dave))
(assert (smart Dave))

(assert (kind Fiona))
(assert (smart Fiona))

(assert (big Harry))
(assert (cold Harry))
(assert (rough Harry))
(assert (smart Harry))

; Rules
; Big and rough people are white
(assert (forall ((p Person)) (=> (and (big p) (rough p)) (white p))))

; If Fiona is big and Fiona is cold then Fiona is kind
(assert (=> (and (big Fiona) (cold Fiona)) (kind Fiona)))

; If Dave is cold then Dave is quiet
(assert (=> (cold Dave) (quiet Dave)))

; Test: Is Bob cold?
(assert (cold Bob))

; Check satisfiability for the query
(check-sat)
(get-model)