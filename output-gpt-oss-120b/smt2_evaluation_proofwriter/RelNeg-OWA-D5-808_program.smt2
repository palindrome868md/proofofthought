;--- Sorts ----------------------------------------------------
(declare-sort Entity 0)

;--- Predicates (functions returning Bool) --------------------
(declare-fun young (Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)
(declare-fun needs  (Entity Entity) Bool)
(declare-fun round  (Entity) Bool)
(declare-fun nice   (Entity) Bool)
(declare-fun red    (Entity) Bool)

;--- Individuals ---------------------------------------------
(declare-const cat   Entity)
(declare-const cow   Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)

;--- Facts ----------------------------------------------------
(assert (young cat))
(assert (young cow))

(assert (visits cow mouse))
(assert (eats mouse cat))
(assert (needs mouse cat))
(assert (needs mouse rabbit))
(assert (not (visits mouse cow)))   ; mouse does NOT visit cow
(assert (visits mouse rabbit))
(assert (round rabbit))
(assert (not (needs rabbit cat)))   ; rabbit does NOT need cat
(assert (visits rabbit mouse))

;--- Rules (universally quantified) --------------------------
; 1. If someone eats the cat and they eat the cow then they do not need the mouse.
(assert (forall ((x Entity))
  (=> (and (eats x cat) (eats x cow))
      (not (needs x mouse)))))

; 2. If someone visits the cat then the cat eats the cow.
(assert (forall ((x Entity))
  (=> (visits x cat)
      (eats cat cow))))

; 3. All nice people are red.
(assert (forall ((x Entity))
  (=> (nice x) (red x))))

; 4. If the mouse needs the rabbit and the mouse eats the cat then the mouse eats the cow.
(assert (=> (and (needs mouse rabbit) (eats mouse cat))
            (eats mouse cow)))

; 5. If someone is red and they visit the mouse then the mouse needs the cow.
(assert (forall ((x Entity))
  (=> (and (red x) (visits x mouse))
      (needs mouse cow))))

; 6. If someone needs the cow then the cow visits the cat.
(assert (forall ((x Entity))
  (=> (needs x cow)
      (visits cow cat))))

; 7. All round people are nice.
(assert (forall ((x Entity))
  (=> (round x) (nice x))))

; 8. If someone needs the cat and the cat visits the rabbit then they do not eat the rabbit.
(assert (forall ((x Entity))
  (=> (and (needs x cat) (visits cat rabbit))
      (not (eats x rabbit)))))

;--- Statement to test: "The cat does not eat the cow." -----
(assert (not (eats cat cow)))

;--- Check consistency ----------------------------------------
(check-sat)
(get-model)