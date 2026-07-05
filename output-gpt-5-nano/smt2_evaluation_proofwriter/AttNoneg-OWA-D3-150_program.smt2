(declare-sort Person 0)

(declare-const dave Person)
(declare-const erin Person)
(declare-const gary Person)
(declare-const harry Person)

(declare-fun smart (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun big (Person) Bool)

; Facts
(assert (smart dave))
(assert (furry erin))
(assert (nice erin))
(assert (nice gary))
(assert (nice harry))
(assert (red harry))

; Rules
(assert (forall ((p Person)) (=> (big p) (furry p))))
(assert (forall ((p Person)) (=> (blue p) (big p))))
(assert (forall ((p Person)) (=> (red p) (blue p))))

; Test: Is Harry blue?
(assert (blue harry))

(check-sat)
(get-model)