; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun LeaderForLife (Person) Bool)
(declare-fun Power (Person) Bool)
(declare-fun King (Person) Bool)
(declare-fun Queen (Person) Bool)
(declare-fun Female (Person) Bool)
(declare-fun Male (Person) Bool)

; Constants
(declare-const elizabeth Person)

; Knowledge base (premises)
(assert (forall ((p Person)) (=> (LeaderForLife p) (Power p))))
(assert (forall ((p Person)) (=> (LeaderForLife p) (or (King p) (Queen p)))))
(assert (forall ((p Person)) (=> (Queen p) (Female p))))
(assert (forall ((p Person)) (=> (King p) (Male p))))
(assert (Queen elizabeth))
(assert (LeaderForLife elizabeth))

; Test scenario: Does Elizabeth have power?
(assert (Power elizabeth))

; Check satisfiability
(check-sat)
(get-model)