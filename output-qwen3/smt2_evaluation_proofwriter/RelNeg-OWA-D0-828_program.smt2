; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare constants
(declare-const cat Entity)
(declare-const rabbit Entity)

; 3. Declare functions (predicates)
(declare-fun eats (Entity Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun nice (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)

; 4. Assert knowledge base (facts)
(assert (eats cat rabbit))
(assert (cold cat))
(assert (green cat))
(assert (nice cat))
(assert (round cat))
(assert (young cat))
(assert (likes cat rabbit))
(assert (visits cat rabbit))
(assert (eats rabbit cat))
(assert (not (cold rabbit)))
(assert (green rabbit))
(assert (nice rabbit))
(assert (round rabbit))
(assert (young rabbit))
(assert (not (likes rabbit cat)))
(assert (visits rabbit cat))

; 5. Assert rules
; If someone eats the cat and they are not nice then the cat does not eat the rabbit.
(assert (forall ((x Entity))
  (=> (and (eats x cat) (not (nice x)))
      (not (eats cat rabbit)))))

; If the cat is cold then the cat eats the rabbit.
(assert (=> (cold cat) (eats cat rabbit)))

; All nice people are young.
(assert (forall ((x Entity))
  (=> (nice x) (young x))))

; If someone is green then they do not like the cat.
(assert (forall ((x Entity))
  (=> (green x) (not (likes x cat)))))

; If someone likes the cat then the cat visits the rabbit.
(assert (forall ((x Entity))
  (=> (likes x cat) (visits cat rabbit))))

; If someone eats the rabbit and the rabbit does not eat the cat then the rabbit visits the cat.
(assert (forall ((x Entity))
  (=> (and (eats x rabbit) (not (eats rabbit cat)))
      (visits rabbit cat))))

; If someone likes the rabbit and they do not like the cat then the rabbit visits the cat.
(assert (forall ((x Entity))
  (=> (and (likes x rabbit) (not (likes x cat)))
      (visits rabbit cat))))

; If someone likes the cat and the cat does not visit the rabbit then the cat likes the rabbit.
(assert (forall ((x Entity))
  (=> (and (likes x cat) (not (visits cat rabbit)))
      (likes cat rabbit))))

; 6. Verify Question: "The rabbit is not young."
; Assert the statement to check if it is consistent with the knowledge base.
(assert (not (young rabbit)))

; 7. Check satisfiability
(check-sat)
(get-model)