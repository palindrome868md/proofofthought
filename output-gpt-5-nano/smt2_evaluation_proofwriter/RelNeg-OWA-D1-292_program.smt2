; Sorts
(declare-sort Person 0)

; Constants
(declare-const lion Person)
(declare-const mouse Person)
(declare-const rabbit Person)

; Predicates
(declare-fun young (Person) Bool)
(declare-fun likes (Person Person) Bool)
(declare-fun visits (Person Person) Bool)
(declare-fun eats (Person Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun cold (Person) Bool)

; Facts (Knowledge Base)
(assert (young lion))
(assert (not (likes lion mouse)))
(assert (likes lion rabbit))
(assert (visits lion mouse))
(assert (not (eats mouse rabbit)))
(assert (blue mouse))
(assert (green mouse))
(assert (visits mouse lion))
(assert (visits mouse rabbit))
(assert (eats rabbit lion))
(assert (eats rabbit mouse))
(assert (cold rabbit))
(assert (green rabbit))
(assert (not (nice rabbit)))
(assert (visits rabbit lion))
(assert (not (visits rabbit mouse)))

; Rules
; If someone is cold then they like the mouse
(assert (forall ((p Person))
  (=> (cold p)
      (likes p mouse))))

; If someone visits the mouse then the mouse visits the rabbit
(assert (forall ((p Person))
  (=> (visits p mouse)
      (visits mouse rabbit))))

; If someone eats the mouse then the mouse likes the lion
(assert (forall ((p Person))
  (=> (eats p mouse)
      (likes mouse lion))))

; If someone is nice then they like the lion
(assert (forall ((p Person))
  (=> (nice p)
      (likes p lion))))

; If someone likes the rabbit and the rabbit visits the mouse then they are not green
(assert (forall ((p Person))
  (=> (and (likes p rabbit) (visits rabbit mouse))
      (not (green p)))))

; If someone likes the rabbit and the rabbit eats the lion then the rabbit is green
(assert (forall ((p Person))
  (=> (and (likes p rabbit) (eats rabbit lion))
      (green rabbit))))

; Test: The rabbit likes the mouse
(assert (likes rabbit mouse))

; Check satisfiability
(check-sat)
(get-model)