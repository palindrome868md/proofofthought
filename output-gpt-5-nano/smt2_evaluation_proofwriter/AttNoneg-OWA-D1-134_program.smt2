(declare-sort Person 0)

(declare-const bob Person)
(declare-const dave Person)
(declare-const fiona Person)

; Predicates
(declare-fun green (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun furry (Person) Bool)

; Knowledge base
(assert (green bob))
(assert (rough bob))
(assert (smart bob))

(assert (big dave))
(assert (blue dave))
(assert (quiet dave))
(assert (rough dave))
(assert (smart dave))

(assert (rough fiona))
(assert (smart fiona))

; Rules
(assert (forall ((p Person)) (=> (and (smart p) (big p)) (blue p))))
(assert (forall ((p Person)) (=> (smart p) (furry p))))
(assert (forall ((p Person)) (=> (and (rough p) (green p)) (big p))))
(assert (forall ((p Person)) (=> (and (green p) (rough p)) (smart p))))
(assert (forall ((p Person)) (=> (and (blue p) (rough p)) (quiet p))))
(assert (forall ((p Person)) (=> (quiet p) (big p))))
(assert (forall ((p Person)) (=> (big p) (furry p))))
; Optional Bob-specific rule (consistent with the above)
(assert (=> (and (blue bob) (smart bob)) (big bob)))

; Test: Bob is not furry
(assert (not (furry bob)))

(check-sat)
(get-model)