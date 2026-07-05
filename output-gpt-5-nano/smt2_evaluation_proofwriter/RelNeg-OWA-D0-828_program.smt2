; Sorts
(declare-sort Entity 0)

; Entities
(declare-const cat Entity)
(declare-const rabbit Entity)

; Predicates
(declare-fun eats (Entity Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun nice (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)

; Facts about cat
(assert (eats cat rabbit))
(assert (cold cat))
(assert (green cat))
(assert (nice cat))
(assert (round cat))
(assert (young cat))
(assert (likes cat rabbit))
(assert (visits cat rabbit))

; Facts about rabbit
(assert (eats rabbit cat))
(assert (not (cold rabbit)))
(assert (green rabbit))
(assert (nice rabbit))
(assert (round rabbit))
(assert (young rabbit))
(assert (not (likes rabbit cat)))
(assert (visits rabbit cat))

; Rules
; If someone eats the cat and they are not nice then the cat does not eat the rabbit.
(assert (forall ((x Entity))
  (=> (and (eats x cat) (not (nice x)))
      (not (eats cat rabbit)))))

; If the cat is cold then the cat eats the rabbit.
(assert (forall ((c Entity))
  (=> (cold c) (eats cat rabbit))))

; All nice people are young.
(assert (forall ((p Entity))
  (=> (nice p) (young p))))

; If someone is green then they do not like the cat.
(assert (forall ((p Entity))
  (=> (green p) (not (likes p cat)))))

; If someone likes the cat then the cat visits the rabbit.
(assert (forall ((p Entity))
  (=> (likes p cat) (visits cat rabbit))))

; If someone eats the rabbit and the rabbit does not eat the cat then the rabbit visits the cat.
(assert (forall ((p Entity))
  (=> (and (eats p rabbit) (not (eats rabbit cat)))
      (visits rabbit cat))))

; If someone likes the rabbit and they do not like the cat then the rabbit visits the cat.
(assert (forall ((p Entity))
  (=> (and (likes p rabbit) (not (likes p cat)))
      (visits rabbit cat))))

; If someone likes the cat and the cat does not visit the rabbit then the cat likes the rabbit.
(assert (forall ((p Entity))
  (=> (and (likes p cat) (not (visits cat rabbit)))
      (likes cat rabbit))))

; Query: The rabbit is not young.
(assert (not (young rabbit)))
(check-sat)