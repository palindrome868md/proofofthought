; Sorts
(declare-sort Person 0)

; Predicates (properties)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun kind  (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun big   (Person) Bool)

; Persons
(declare-const alan Person)
(declare-const bob  Person)
(declare-const charlie Person)
(declare-const eric  Person)

; Knowledge base (facts)
; Alan: rough, round, kind
(assert (rough alan))
(assert (round alan))
(assert (kind alan))

; Bob: cold, red, green, kind
(assert (cold bob))
(assert (red bob))
(assert (green bob))
(assert (kind bob))

; Charlie: rough, red, kind
(assert (rough charlie))
(assert (red charlie))
(assert (kind charlie))

; Eric: round
(assert (round eric))

; Rules
; 1) rough ∧ red ∧ green -> blue
(assert (forall ((p Person))
  (=> (and (rough p) (red p) (green p)) (blue p))))

; 2) big ∧ round ∧ kind -> rough
(assert (forall ((p Person))
  (=> (and (big p) (round p) (kind p)) (rough p))))

; 3) kind ∧ red -> green
(assert (forall ((p Person))
  (=> (and (kind p) (red p)) (green p))))

; 4) kind ∧ rough -> red
(assert (forall ((p Person))
  (=> (and (kind p) (rough p)) (red p))))

; 5) blue ∧ red ∧ big -> cold
(assert (forall ((p Person))
  (=> (and (blue p) (red p) (big p)) (cold p))))

; Test scenario: Is Alan not red?
(assert (not (red alan)))

; Verification
(check-sat)
(get-model)