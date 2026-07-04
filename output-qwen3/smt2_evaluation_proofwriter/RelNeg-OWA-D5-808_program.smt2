; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-young (Entity) Bool)
(declare-fun is-round (Entity) Bool)
(declare-fun is-nice (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun needs (Entity Entity) Bool)

; 3. Declare constants
(declare-const cat Entity)
(declare-const cow Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)

; 4. Assert knowledge base (facts)
(assert (is-young cat))
(assert (is-young cow))
(assert (visits cow mouse))
(assert (eats mouse cat))
(assert (needs mouse cat))
(assert (needs mouse rabbit))
(assert (not (visits mouse cow)))
(assert (visits mouse rabbit))
(assert (is-round rabbit))
(assert (not (needs rabbit cat)))
(assert (visits rabbit mouse))

; Assert rules
; "If someone eats the cat and they eat the cow then they do not need the mouse."
(assert (forall ((x Entity))
  (=> (and (eats x cat) (eats x cow))
      (not (needs x mouse)))))

; "If someone visits the cat then the cat eats the cow."
(assert (forall ((x Entity))
  (=> (visits x cat)
      (eats cat cow))))

; "All nice people are red."
(assert (forall ((x Entity))
  (=> (is-nice x)
      (is-red x))))

; "If the mouse needs the rabbit and the mouse eats the cat then the mouse eats the cow."
(assert (=> (and (needs mouse rabbit) (eats mouse cat))
    (eats mouse cow)))

; "If someone is red and they visit the mouse then the mouse needs the cow."
(assert (forall ((x Entity))
  (=> (and (is-red x) (visits x mouse))
      (needs mouse cow))))

; "If someone needs the cow then the cow visits the cat."
(assert (forall ((x Entity))
  (=> (needs x cow)
      (visits cow cat))))

; "All round people are nice."
(assert (forall ((x Entity))
  (=> (is-round x)
      (is-nice x))))

; "If someone needs the cat and the cat visits the rabbit then they do not eat the rabbit."
(assert (forall ((x Entity))
  (=> (and (needs x cat) (visits cat rabbit))
      (not (eats x rabbit)))))

; 5. Verification
; Question: "The cat does not eat the cow."
; We assert the statement to check consistency. 
; If unsat, the statement is False (contradicts KB).
; If sat, the statement is True/Possible (consistent with KB).
(assert (not (eats cat cow)))

; 6. Check satisfiability
(check-sat)
(get-model)