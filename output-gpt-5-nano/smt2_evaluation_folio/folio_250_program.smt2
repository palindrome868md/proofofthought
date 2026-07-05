; Sorts
(declare-sort Neighborhood 0)
(declare-sort Person 0)

; Constants
(declare-const tom Person)
(declare-const lawton-park Neighborhood)
(declare-const daniel Person)

; Predicates / Functions
(declare-fun is-citizen (Person Neighborhood) Bool)
(declare-fun uses-zip (Person Int) Bool)

; Knowledge Base
; 1) Tom is a citizen of Lawton Park
(assert (is-citizen tom lawton-park))

; 2) All citizens of Lawton Park use the zip code 98199
(assert (forall ((p Person)) (=> (is-citizen p lawton-park) (uses-zip p 98199))))

; 3) Daniel uses the zip code 98199
(assert (uses-zip daniel 98199))

; Question: "Tom doesn't use the zip code 98199."
; Test by asserting the negation of the statement
(assert (not (uses-zip tom 98199)))

; Check satisfiability
(check-sat)
(get-model)