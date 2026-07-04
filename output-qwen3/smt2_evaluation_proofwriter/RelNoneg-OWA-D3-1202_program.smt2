; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare constants
(declare-const bald-eagle Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)

; 3. Declare functions
(declare-fun eats (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-rough (Entity) Bool)
(declare-fun is-young (Entity) Bool)
(declare-fun is-big (Entity) Bool)

; 4. Assert distinctness of entities
(assert (distinct bald-eagle mouse rabbit))

; 5. Assert knowledge base (facts)
(assert (eats bald-eagle mouse))
(assert (sees bald-eagle mouse))
(assert (sees bald-eagle rabbit))
(assert (visits bald-eagle mouse))
(assert (eats mouse bald-eagle))
(assert (eats mouse rabbit))
(assert (sees mouse bald-eagle))
(assert (visits mouse rabbit))
(assert (eats rabbit bald-eagle))
(assert (is-cold rabbit))
(assert (is-kind rabbit))
(assert (is-rough rabbit))
(assert (is-young rabbit))
(assert (sees rabbit bald-eagle))
(assert (sees rabbit mouse))
(assert (visits rabbit bald-eagle))

; 6. Assert knowledge base (rules)
(assert (forall ((x Entity)) (=> (visits x rabbit) (is-young x))))
(assert (forall ((x Entity)) (=> (sees x mouse) (visits mouse bald-eagle))))
(assert (forall ((x Entity)) (=> (is-big x) (is-cold x))))
(assert (forall ((x Entity)) (=> (sees x rabbit) (visits x rabbit))))
(assert (forall ((x Entity)) (=> (is-young x) (is-cold x))))
(assert (forall ((x Entity)) (=> (and (sees x mouse) (visits x mouse)) (eats mouse rabbit))))
(assert (forall ((x Entity)) (=> (sees x mouse) (is-big mouse))))
(assert (forall ((x Entity)) (=> (and (visits x mouse) (is-rough mouse)) (eats x mouse))))

; 7. Verify Question: "The mouse does not eat the bald eagle."
; Assert the statement to check if it is consistent with the KB
(assert (not (eats mouse bald-eagle)))

; 8. Check satisfiability
(check-sat)
(get-model)