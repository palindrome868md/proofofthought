; Sorts
(declare-sort Person 0)

; Constants
(declare-const Bob Person)
(declare-const Erin Person)

; Predicates
(declare-fun cold (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun big (Person) Bool)

; Facts about Bob
(assert (cold Bob))
(assert (furry Bob))
(assert (nice Bob))
(assert (red Bob))
(assert (round Bob))
(assert (smart Bob))

; Fact about Erin
(assert (red Erin))

; Rules
; Red -> Furry
(assert (forall ((p Person)) (=> (red p) (furry p))))
; Furry -> Red
(assert (forall ((p Person)) (=> (furry p) (red p))))
; Furry -> Round
(assert (forall ((p Person)) (=> (furry p) (round p))))
; Furry ∧ Big -> Round
(assert (forall ((p Person)) (=> (and (furry p) (big p)) (round p))))
; Red ∧ Round -> Nice
(assert (forall ((p Person)) (=> (and (red p) (round p)) (nice p))))
; Big ∧ Cold -> Red
(assert (forall ((p Person)) (=> (and (big p) (cold p)) (red p))))
; Big -> Cold
(assert (forall ((p Person)) (=> (big p) (cold p))))

; Bob-specific rule: If Bob is Nice and Bob is Big, then Bob is Smart
(assert (=> (and (nice Bob) (big Bob)) (smart Bob)))

; Test scenario: Erin is not nice
(assert (not (nice Erin)))

; Check satisfiability
(check-sat)