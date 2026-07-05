; Sorts
(declare-sort Thing 0)

; Predicates
(declare-fun rough (Thing) Bool)
(declare-fun nice  (Thing) Bool)
(declare-fun red   (Thing) Bool)
(declare-fun round (Thing) Bool)
(declare-fun likes (Thing Thing) Bool)
(declare-fun visits (Thing Thing) Bool)
(declare-fun kind  (Thing) Bool)

; Constants
(declare-const mouse Thing)
(declare-const rabbit Thing)
(declare-const tiger Thing)

; Knowledge base
(assert (rough mouse))
(assert (likes mouse rabbit))
(assert (likes mouse tiger))
(assert (visits mouse rabbit))
(assert (red rabbit))
(assert (round rabbit))
(assert (likes rabbit tiger))
(assert (visits rabbit tiger))
(assert (nice tiger))
(assert (rough tiger))

; Rules
(assert (forall ((p Thing)) (=> (and (red p) (nice p)) (kind p))))
(assert (forall ((x Thing)) (=> (likes x rabbit) (nice rabbit))))

; Test: Is the rabbit kind? (assert the negation to test entailment)
(assert (not (kind rabbit)))

; Check satisfiability
(check-sat)