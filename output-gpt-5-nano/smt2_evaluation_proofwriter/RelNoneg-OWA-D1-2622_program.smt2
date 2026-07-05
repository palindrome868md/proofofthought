(declare-sort Person 0)

(declare-const cat Person)
(declare-const dog Person)
(declare-const lion Person)
(declare-const rabbit Person)

(declare-fun nice (Person) Bool)
(declare-fun sees (Person Person) Bool)
(declare-fun chases (Person Person) Bool)
(declare-fun eats (Person Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun kind (Person) Bool)

; Facts
(assert (nice cat))
(assert (sees cat dog))
(assert (chases dog rabbit))
(assert (eats dog rabbit))
(assert (round dog))
(assert (sees dog lion))
(assert (sees dog rabbit))
(assert (chases lion cat))
(assert (chases lion dog))
(assert (eats lion cat))
(assert (eats lion rabbit))
(assert (chases rabbit cat))
(assert (eats rabbit cat))
(assert (eats rabbit dog))
(assert (sees rabbit cat))

; Rules
(assert (forall ((x Person))
  (=> (eats x lion) (chases lion rabbit))))

(assert (forall ((x Person))
  (=> (and (chases x dog) (eats x cat)) (eats x dog))))

(assert (forall ((x Person))
  (=> (kind x) (round x))))

; Test: The rabbit does not eat the cat
(assert (not (eats rabbit cat)))

(check-sat)