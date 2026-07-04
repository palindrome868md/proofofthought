; Sorts
(declare-sort Person 0)

; Predicates and functions
(declare-fun is-citizen-of-lp (Person) Bool)
(declare-fun zip (Person) Int)

; Constants
(declare-const tom Person)
(declare-const daniel Person)

; Knowledge base
(assert (is-citizen-of-lp tom))

; All citizens of Lawton Park use the zip code 98199
(assert (forall ((p Person))
  (=> (is-citizen-of-lp p)
      (= (zip p) 98199))))

; Given fact: Daniel uses the zip code 98199
(assert (= (zip daniel) 98199))

; Test: Does Tom use the zip code 98199?
(assert (= (zip tom) 98199))

; Check satisfiability
(check-sat)
(get-model)