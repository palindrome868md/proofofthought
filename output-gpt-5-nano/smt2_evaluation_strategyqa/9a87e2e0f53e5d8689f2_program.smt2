; Sorts
(declare-sort Food 0)

; Predicates / Functions
(declare-fun made-with-black-salt (Food) Bool)
(declare-fun smells-sulfur (Food) Bool)

; Constants
(declare-const test-dish Food)

; Knowledge base
(assert (made-with-black-salt test-dish))
(assert (forall ((f Food))
  (=> (made-with-black-salt f)
      (smells-sulfur f))))

; Test: Would food made with black salt smell of sulfur?
(assert (smells-sulfur test-dish))

; Check satisfiability and model
(check-sat)
(get-model)