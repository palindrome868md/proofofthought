(declare-sort Person 0)

(declare-const anne Person)
(declare-const bob Person)
(declare-const fiona Person)
(declare-const gary Person)

(declare-fun big   (Person) Bool)
(declare-fun nice  (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)

; Facts
(assert (big anne))
(assert (nice anne))

(assert (big bob))
(assert (cold bob))
(assert (nice bob))

(assert (cold fiona))

(assert (not (cold gary)))

; Rules
(assert (forall ((p Person))
  (=> (and (nice p) (cold p)) (smart p))))

(assert (forall ((p Person))
  (=> (and (nice p) (big p)) (cold p))))

(assert (forall ((p Person))
  (=> (furry p) (round p))))

; Test: Would Anne be not cold?
(assert (not (cold anne)))

(check-sat)
(get-model)