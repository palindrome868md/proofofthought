; Sorts
(declare-sort Person 0)
(declare-sort Location 0)
(declare-sort Animal 0)

; Constants
(declare-const you Person)
(declare-const memphis Location)
(declare-const saltwater-crocodile Animal)

; Predicates
(declare-fun present-in (Animal Location) Bool)
(declare-fun takes-photo (Person Animal Location) Bool)

; Knowledge base
; The Saltwater crocodile exists (as an Animal) but is not present in Memphis
(assert (not (present-in saltwater-crocodile memphis)))

; Rule: if someone takes a photo of an animal in a location, the animal is present there
(assert (forall ((p Person) (a Animal) (l Location))
  (=> (takes-photo p a l)
      (present-in a l))))

; Test: Would you take a photo of a Saltwater crocodile in Memphis?
(assert (takes-photo you saltwater-crocodile memphis))

; Check satisfiability (ONE check-sat to answer the question)
(check-sat)
(get-model)