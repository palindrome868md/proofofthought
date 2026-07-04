; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (properties and relationships)
(declare-fun is-young (Animal) Bool)
(declare-fun is-blue (Animal) Bool)
(declare-fun is-green (Animal) Bool)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-nice (Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)

; 3. Declare constants
(declare-const lion Animal)
(declare-const mouse Animal)
(declare-const rabbit Animal)

; 4. Assert knowledge base (facts)
(assert (is-young lion))
(assert (not (likes lion mouse)))
(assert (likes lion rabbit))
(assert (visits lion mouse))
(assert (not (eats mouse rabbit)))
(assert (is-blue mouse))
(assert (is-green mouse))
(assert (visits mouse lion))
(assert (visits mouse rabbit))
(assert (eats rabbit lion))
(assert (eats rabbit mouse))
(assert (is-cold rabbit))
(assert (is-green rabbit))
(assert (not (is-nice rabbit)))
(assert (visits rabbit lion))
(assert (not (visits rabbit mouse)))

; 5. Assert knowledge base (rules)
; If someone likes the rabbit and the rabbit visits the mouse then they are not green.
(assert (forall ((x Animal))
  (=> (and (likes x rabbit) (visits rabbit mouse))
      (not (is-green x)))))

; If someone visits the mouse then the mouse visits the rabbit.
(assert (forall ((x Animal))
  (=> (visits x mouse)
      (visits mouse rabbit))))

; If someone is cold then they like the mouse.
(assert (forall ((x Animal))
  (=> (is-cold x)
      (likes x mouse))))

; If someone eats the mouse then the mouse likes the lion.
(assert (forall ((x Animal))
  (=> (eats x mouse)
      (likes mouse lion))))

; If someone is nice then they like the lion.
(assert (forall ((x Animal))
  (=> (is-nice x)
      (likes x lion))))

; If someone likes the rabbit and the rabbit eats the lion then the rabbit is green.
(assert (forall ((x Animal))
  (=> (and (likes x rabbit) (eats rabbit lion))
      (is-green rabbit))))

; 6. Test Question: The rabbit likes the mouse.
; Based on the fact that the rabbit is cold and the rule "If someone is cold then they like the mouse",
; this statement should be consistent (sat).
(assert (likes rabbit mouse))

; 7. Check satisfiability
(check-sat)
(get-model)