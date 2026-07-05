; Sorts
(declare-sort Person 0)

; Constants
(declare-const elizabeth Person)

; Predicates / Functions
(declare-fun leader_for_life (Person) Bool)
(declare-fun queen (Person) Bool)
(declare-fun king (Person) Bool)
(declare-fun female (Person) Bool)
(declare-fun male (Person) Bool)
(declare-fun power (Person) Bool)

; Knowledge base (premises)
; Elizabeth is a queen.
(assert (queen elizabeth))

; Elizabeth is a leader of a country for life.
(assert (leader_for_life elizabeth))

; Leaders for life are either king or queen.
(assert (forall ((p Person)) (=> (leader_for_life p) (or (king p) (queen p)))))

; Queens are female.
(assert (forall ((p Person)) (=> (queen p) (female p))))

; Kings are male.
(assert (forall ((p Person)) (=> (king p) (male p))))

; If leader_for_life then power.
(assert (forall ((p Person)) (=> (leader_for_life p) (power p))))

; Test scenario: Is Elizabeth a leader_for_life?
(assert (leader_for_life elizabeth))

; Check satisfiability and produce a model
(check-sat)
(get-model)