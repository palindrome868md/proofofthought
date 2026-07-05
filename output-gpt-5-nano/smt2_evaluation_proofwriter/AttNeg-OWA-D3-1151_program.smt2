(declare-sort Person 0)

(declare-fun red (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun nice (Person) Bool)

(declare-const anne Person)
(declare-const bob Person)
(declare-const charlie Person)

; Facts
(assert (red anne))
(assert (not (nice bob)))
(assert (blue charlie))

; Rules
(assert (forall ((p Person)) (=> (young p) (green p))))
(assert (forall ((p Person)) (=> (and (young p) (green p)) (not (red p)))))
(assert (forall ((p Person)) (=> (red p) (white p))))
(assert (=> (white charlie) (blue charlie)))
(assert (forall ((p Person)) (=> (white p) (not (young p)))))
(assert (forall ((p Person)) (=> (and (red p) (not (young p))) (nice p))))

; Test: Anne is nice
(assert (nice anne))

(check-sat)
(get-model)