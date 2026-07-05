(declare-sort Person 0)

; Constants
(declare-const cat Person)
(declare-const cow Person)
(declare-const mouse Person)
(declare-const rabbit Person)

; Predicates
(declare-fun young (Person) Bool)
(declare-fun visits (Person Person) Bool)
(declare-fun eats (Person Person) Bool)
(declare-fun needs (Person Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)

; Facts
(assert (young cat))
(assert (young cow))

; The cow visits the mouse.
(assert (visits cow mouse))
; The mouse eats the cat.
(assert (eats mouse cat))
; The mouse needs the cat.
(assert (needs mouse cat))
; The mouse needs the rabbit.
(assert (needs mouse rabbit))
; The mouse does not visit the cow.
(assert (not (visits mouse cow)))
; The mouse visits the rabbit.
(assert (visits mouse rabbit))
; The rabbit is round.
(assert (round rabbit))
; The rabbit does not need the cat.
(assert (not (needs rabbit cat)))
; The rabbit visits the mouse.
(assert (visits rabbit mouse))

; Rule: If someone eats the cat and they eat the cow then they do not need the mouse.
(assert (forall ((x Person))
  (=> (and (eats x cat) (eats x cow))
      (not (needs x mouse)))))

; Rule: If someone visits the cat then the cat eats the cow.
(assert (forall ((x Person))
  (=> (visits x cat)
      (eats cat cow))))

; All nice people are red.
(assert (forall ((p Person)) (=> (nice p) (red p))))

; The mouse eats the cow if the mouse needs the rabbit and the mouse eats the cat
(assert (=> (and (needs mouse rabbit) (eats mouse cat)) (eats mouse cow)))

; If red and visit the mouse then the mouse needs cow
(assert (forall ((p Person))
  (=> (and (red p) (visits p mouse)) (needs mouse cow))))

; If someone needs the cow then the cow visits the cat
(assert (forall ((p Person))
  (=> (needs p cow) (visits cow cat))))

; All round people are nice
(assert (forall ((p Person)) (=> (round p) (nice p))))

; If someone needs the cat and the cat visits the rabbit then they do not eat the rabbit
(assert (forall ((p Person))
  (=> (and (needs p cat) (visits cat rabbit))
      (not (eats p rabbit)))))

; Query: The cat does not eat the cow
(assert (not (eats cat cow)))

(check-sat)