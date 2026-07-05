; Sorts
(declare-sort Person 0)
(declare-sort Place 0)

; Constants
(declare-const you Person)
(declare-const mcdonalds Place)

; Predicates
(declare-fun on_diet (Person) Bool)
(declare-fun eats_at_lunch (Person Place) Bool)

; Knowledge base
(assert (on_diet you))

; Rule: If on a diet, you do not eat lunch at McDonald's
(assert (forall ((p Person) (pl Place))
  (=> (and (on_diet p) (= pl mcdonalds))
      (not (eats_at_lunch p pl)))))

; Test: Would you eat lunch at McDonald's?
(assert (eats_at_lunch you mcdonalds))

; Check satisfiability
(check-sat)
(get-model)