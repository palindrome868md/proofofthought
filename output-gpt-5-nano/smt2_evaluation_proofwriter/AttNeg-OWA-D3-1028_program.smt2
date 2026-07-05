; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun blue (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun white (Person) Bool)

; Constants
(declare-const bob Person)
(declare-const erin Person)
(declare-const fiona Person)
(declare-const harry Person)

; Facts
(assert blue bob)
(assert quiet erin)
(assert cold fiona)
(assert cold harry)

; Rules
(assert (forall ((p Person))
  (=> (quiet p) (blue p))))
(assert (forall ((p Person))
  (=> (blue p) (young p))))
(assert (forall ((p Person))
  (=> (and (blue p) (round p)) (cold p))))
(assert (forall ((p Person))
  (=> (and (blue p) (not (red p))) (round p))))
(assert (forall ((p Person))
  (=> (young p) (white p))))
; Erin-specific conditional rules
(assert (=> (and (red erin) (not (round erin))) (young erin)))
(assert (=> (and (red erin) (not (cold erin))) (white erin)))

; Test: Is Erin not blue?
(assert (not (blue erin)))
(check-sat)
(get-model)