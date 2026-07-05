; Declare sorts
(declare-sort Animal 0)
(declare-sort Pouch 0)

; Declare constants
(declare-const scooby-doo Animal)
(declare-const kangaroo-pouch Pouch)

; Declare functions
(declare-fun volume-animal (Animal) Real)
(declare-fun volume-pouch (Pouch) Real)
(declare-fun fits_in_pouch (Animal Pouch) Bool)

; Knowledge base: sizes
(assert (= (volume-animal scooby-doo) 120))
(assert (= (volume-pouch kangaroo-pouch) 50))

; Bi-implication: fits_in_pouch iff Scooby's volume <= pouch volume
(assert (forall ((a Animal) (p Pouch))
  (and
    (=> (fits_in_pouch a p) (<= (volume-animal a) (volume-pouch p)))
    (=> (<= (volume-animal a) (volume-pouch p)) (fits_in_pouch a p))
  )))

; Test scenario: Could Scooby Doo fit in the kangaroo pouch?
(assert (fits_in_pouch scooby-doo kangaroo-pouch))

; Check satisfiability and produce a model
(check-sat)
(get-model)