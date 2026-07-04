; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const tom Person)
(declare-const daniel Person)

; Declare predicates/functions
(declare-fun citizen-of-lawton-park (Person) Bool)
(declare-fun zip (Person) Int)

; Knowledge base
(assert (citizen-of-lawton-park tom))
(assert (forall ((p Person)) (=> (citizen-of-lawton-park p) (= (zip p) 98199))))
(assert (= (zip daniel) 98199))

; Test: Tom doesn't use zip code 98199
(assert (not (= (zip tom) 98199)))

; Check satisfiability and model
(check-sat)
(get-model)