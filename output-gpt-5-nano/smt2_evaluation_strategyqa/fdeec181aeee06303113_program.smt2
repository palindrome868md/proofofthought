; Sorts
(declare-sort City 0)
(declare-sort Item 0)

; Predicates
(declare-fun is-crucifix (Item) Bool)
(declare-fun located-in (Item City) Bool)

; Constants
(declare-const karachi City)
(declare-const crucifix-1 Item)

; Knowledge base (assumptions reflecting no crucifix in Karachi)
(assert (forall ((i Item))
  (=> (located-in i karachi)
      (not (is-crucifix i)))))

; Test object for the question: a crucifix located in Karachi
(assert (is-crucifix crucifix-1))
(assert (located-in crucifix-1 karachi))

; Question: Are you likely to find a crucifix in Karachi?
(check-sat)