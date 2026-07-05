; Sorts
(declare-sort Person 0)

; Predicates (unary relations)
(declare-fun round   (Person) Bool)
(declare-fun young   (Person) Bool)
(declare-fun cold    (Person) Bool)
(declare-fun rough   (Person) Bool)
(declare-fun green   (Person) Bool)
(declare-fun red     (Person) Bool)
(declare-fun nice    (Person) Bool)
(declare-fun kind    (Person) Bool)
(declare-fun big     (Person) Bool)
(declare-fun blue    (Person) Bool)

; Constants (persons)
(declare-const Alan  Person)
(declare-const Dave  Person)
(declare-const Gary  Person)
(declare-const Harry Person)

; Knowledge base (facts)
; Alan is round and kind
(assert (round Alan))
(assert (kind Alan))

; Dave is round and kind
(assert (round Dave))
(assert (kind Dave))

; Gary is young, round, and cold
(assert (young Gary))
(assert (round Gary))
(assert (cold Gary))

; Harry is young, rough, green, cold, and nice
(assert (young Harry))
(assert (rough Harry))
(assert (green Harry))
(assert (cold Harry))
(assert (nice Harry))

; Rules (universal)

; 1) red -> kind and young
(assert (forall ((p Person))
  (=> (red p)
      (and (kind p) (young p)))))

; 2) young ∧ rough ∧ round -> kind
(assert (forall ((p Person))
  (=> (and (young p) (rough p) (round p))
      (kind p))))

; 3) nice ∧ rough -> big
(assert (forall ((p Person))
  (=> (and (nice p) (rough p))
      (big p))))

; 4) big ∧ round -> red
(assert (forall ((p Person))
  (=> (and (big p) (round p))
      (red p))))

; 5) red ∧ nice -> blue
(assert (forall ((p Person))
  (=> (and (red p) (nice p))
      (blue p))))

; 6) cold ∧ rough ∧ red -> kind
(assert (forall ((p Person))
  (=> (and (cold p) (rough p) (red p))
      (kind p))))

; 7) young ∧ big ∧ rough -> round
(assert (forall ((p Person))
  (=> (and (young p) (big p) (rough p))
      (round p))))

; Query: Is Harry big?
; We test the negation to see if KB entails the statement
(assert (not (big Harry)))

; Check satisfiability: exactly one (check-sat) to answer the question
(check-sat)