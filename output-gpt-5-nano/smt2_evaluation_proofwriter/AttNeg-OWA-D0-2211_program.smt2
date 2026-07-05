(declare-sort Person 0)

(declare-fun blue (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun quiet (Person) Bool)

(declare-const anne Person)
(declare-const bob  Person)
(declare-const gary Person)

; Facts
(assert (blue anne))
(assert (not (blue bob)))
(assert (blue gary))

; Rules
(assert (forall ((p Person)) (=> (rough p) (big p))))
(assert (forall ((p Person)) (=> (and (furry p) (kind p)) (big p))))
(assert (forall ((p Person)) (=> (furry p) (big p))))
(assert (forall ((p Person)) (=> (green p) (rough p))))
(assert (forall ((p Person)) (=> (and (blue p) (quiet p)) (not (furry p)))))
(assert (=> (quiet gary) (rough gary)))

; Test: Is Bob blue?
(assert (blue bob))

(check-sat)