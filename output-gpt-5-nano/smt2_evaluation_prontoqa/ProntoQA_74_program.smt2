; Sorts
(declare-sort Person 0)

; Constants
(declare-const sam Person)

; Predicates (unary predicates for each category/property)
(declare-fun Vumpus (Person) Bool)
(declare-fun Zumpus (Person) Bool)
(declare-fun Tumpus (Person) Bool)
(declare-fun Yumpus (Person) Bool)
(declare-fun Rompus (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Impus (Person) Bool)
(declare-fun Dumpus (Person) Bool)
(declare-fun Wumpus (Person) Bool)

(declare-fun Sour (Person) Bool)
(declare-fun Small (Person) Bool)
(declare-fun Blue (Person) Bool)
(declare-fun Angry (Person) Bool)
(declare-fun Hot (Person) Bool)
(declare-fun Transparent (Person) Bool)
(declare-fun Wooden (Person) Bool)
(declare-fun Jompus (Person) Bool)
(declare-fun Fruity (Person) Bool)

; Knowledge base (universal rules)
(assert (forall ((x Person)) (=> (Vumpus x) (Zumpus x))))
(assert (forall ((x Person)) (=> (Vumpus x) (Sour x))))
(assert (forall ((x Person)) (=> (Zumpus x) (Angry x))))
(assert (forall ((x Person)) (=> (Zumpus x) (Tumpus x))))
(assert (forall ((x Person)) (=> (Tumpus x) (not (Small x)))))
(assert (forall ((x Person)) (=> (Tumpus x) (Yumpus x))))
(assert (forall ((x Person)) (=> (Yumpus x) (not (Blue x)))))
(assert (forall ((x Person)) (=> (Yumpus x) (Rompus x))))
(assert (forall ((x Person)) (=> (Rompus x) (not (Fruity x)))))
(assert (forall ((x Person)) (=> (Wumpus x) (Fruity x))))
(assert (forall ((x Person)) (=> (Rompus x) (Numpus x))))
(assert (forall ((x Person)) (=> (Numpus x) (Hot x))))
(assert (forall ((x Person)) (=> (Numpus x) (Impus x))))
(assert (forall ((x Person)) (=> (Impus x) (Transparent x))))
(assert (forall ((x Person)) (=> (Impus x) (Dumpus x))))
(assert (forall ((x Person)) (=> (Dumpus x) (Wooden x))))
(assert (forall ((x Person)) (=> (Dumpus x) (Jompus x))))

; Facts
(assert (Vumpus sam))

; Test: Is Sam not fruity? (i.e., (not Fruity Sam))
(assert (not (Fruity sam)))

; Check and model
(check-sat)
(get-model)