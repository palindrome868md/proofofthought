; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun big (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun white (Person) Bool)

; Constants
(declare-const bob Person)
(declare-const dave Person)

; Facts about Bob
(assert (not (big bob)))
(assert (furry bob))
(assert (green bob))
(assert (rough bob))
(assert (round bob))
(assert (smart bob))
(assert (not (white bob)))  ; Bob is not white (given)

; Facts about Dave
(assert (big dave))
(assert (furry dave))
(assert (green dave))
(assert (rough dave))
(assert (not (round dave)))
(assert (not (smart dave)))
(assert (white dave))

; Rules
; 1. Smart ∧ White -> Big
(assert (forall ((x Person)) (=> (and (smart x) (white x)) (big x))))
; 2. If White then Big (explicitly stated for Dave, but keep as general rule if desired)
(assert (forall ((x Person)) (=> (white x) (big x))))
; 3. White ∧ ¬Big -> Round
(assert (forall ((x Person)) (=> (and (white x) (not (big x))) (round x))))
; 4. Big ∧ White -> ¬Round
(assert (forall ((x Person)) (=> (and (big x) (white x)) (not (round x))))
)
; 5. Big ∧ Smart -> Round
(assert (forall ((x Person)) (=> (and (big x) (smart x)) (round x))))
; 6. White -> Furry
(assert (forall ((x Person)) (=> (white x) (furry x))))
; 7. Round ∧ Rough -> Furry
(assert (forall ((x Person)) (=> (and (round x) (rough x)) (furry x))))
; 8. If Dave is Round ∧ Green then Dave is Furry
(assert (=> (and (round dave) (green dave)) (furry dave)))

; Test: Is Bob white?
(assert (white bob))

; Check satisfiability
(check-sat)
(get-model)