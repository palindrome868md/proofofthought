; Sorts
(declare-sort Neighborhood 0)
(declare-sort Person 0)

; Constants
(declare-const lawton-park Neighborhood)
(declare-const tom Person)
(declare-const daniel Person)

; Predicates / functions
(declare-fun citizen_of (Person Neighborhood) Bool)
(declare-fun zip (Person) Int)

; Knowledge base
; All citizens of Lawton Park use zip 98199
(assert (forall ((p Person))
  (=> (citizen_of p lawton-park)
      (= (zip p) 98199))))
; Tom is a citizen of Lawton Park
(assert (citizen_of tom lawton-park))
; Daniel uses the zip code 98199
(assert (= (zip daniel) 98199))

; Test: Tom uses zip 98199
(assert (= (zip tom) 98199))

(check-sat)
(get-model)