(declare-sort Person 0)

(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun big (Person) Bool)

(declare-const bob Person)
(declare-const charlie Person)

; Facts about Bob
(assert (round bob))
(assert (smart bob))
(assert (white bob))
(assert (young bob))

; Facts about Charlie
(assert (green charlie))
(assert (smart charlie))
(assert (white charlie))

; Rules
(assert (forall ((p Person)) (=> (red p) (big p))))
(assert (=> (red bob) (white bob)))
(assert (forall ((p Person)) (=> (and (young p) (red p)) (white p))))
(assert (forall ((p Person)) (=> (white p) (green p))))
(assert (=> (green bob) (red bob)))
(assert (forall ((p Person)) (=> (smart p) (green p))))

; Test: Is Bob smart?
(assert (smart bob))

(check-sat)
(get-model)