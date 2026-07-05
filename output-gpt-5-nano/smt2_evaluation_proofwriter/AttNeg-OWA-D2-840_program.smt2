; Declare sorts
(declare-sort Person 0)

; Declare unary predicates
(declare-fun big (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun white (Person) Bool)

; Declare constants
(declare-const bob Person)
(declare-const gary Person)

; Knowledge base (facts)
(assert (not (big bob)))
(assert (blue bob))
(assert (green bob))
(assert (red bob))
(assert (rough bob))
(assert (round bob))
(assert (not (white bob)))

(assert (big gary))
(assert (green gary))
(assert (rough gary))
(assert (round gary))
(assert (white gary))

; Rules
(assert (forall ((p Person)) (=> (and (red p) (rough p)) (round p))))
(assert (forall ((p Person)) (=> (green p) (round p))))
(assert (forall ((p Person)) (=> (and (red p) (white p)) (round p))))
(assert (forall ((p Person)) (=> (and (blue p) (round p)) (red p))))
(assert (forall ((p Person)) (=> (and (round p) (white p)) (big p))))
(assert (forall ((p Person)) (=> (round p) (blue p))))

; Test scenario: Bob is green
(assert (green bob))

; Check satisfiability
(check-sat)
(get-model)