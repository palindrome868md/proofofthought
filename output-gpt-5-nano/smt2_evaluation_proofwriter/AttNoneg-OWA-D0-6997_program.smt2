(declare-sort Person 0)

; Constant representing Dave
(declare-const dave Person)

; Predicates / properties
(declare-fun red (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun kind (Person) Bool)

; Knowledge base
(assert (red dave))
(assert (rough dave))
(assert (round dave))

; All kind people are round
(assert (forall ((p Person)) (=> (kind p) (round p))))

; If Dave is white and Dave is big then Dave is rough
(assert (=> (and (white dave) (big dave)) (rough dave)))

; Test: Is Dave rough? (assert the negation to check entailedness)
(assert (not (rough dave)))

(check-sat)