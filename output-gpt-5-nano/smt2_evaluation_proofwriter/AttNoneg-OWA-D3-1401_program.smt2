; Sorts
(declare-sort Person 0)

; Predicates / unary properties
(declare-fun cold (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)

; Individuals
(declare-const charlie Person)
(declare-const dave Person)
(declare-const erin Person)

; Facts about individuals
(assert (cold charlie))
(assert (furry charlie))
(assert (green charlie))
(assert (red charlie))
(assert (round charlie))
(assert (smart charlie))
(assert (white charlie))

(assert (cold dave))
(assert (green dave))

(assert (furry erin))

; Rules
(assert (forall ((p Person)) (=> (green p) (round p))))
(assert (forall ((p Person)) (=> (and (smart p) (green p)) (white p))))
(assert (forall ((p Person)) (=> (round p) (smart p))))

; Test: Is Dave round?
(assert (round dave))

(check-sat)
(get-model)