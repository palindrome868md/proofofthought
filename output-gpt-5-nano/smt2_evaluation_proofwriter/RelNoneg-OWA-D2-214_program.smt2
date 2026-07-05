; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun chases (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)

(declare-fun red (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun kind (Entity) Bool)

; Constants (entities)
(declare-const cat Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)

; Knowledge base (facts)
(assert (chases cat rabbit))
(assert (kind cat))
(assert (red cat))
(assert (rough cat))

(assert (visits cat mouse))

(assert (chases mouse cat))
(assert (chases mouse rabbit))
(assert (eats mouse rabbit))

(assert (red mouse))
(assert (rough mouse))

(assert (visits mouse cat))
(assert (visits mouse rabbit))

(assert (chases rabbit mouse))
(assert (eats rabbit cat))
(assert (eats rabbit mouse))
(assert (red rabbit))

; Rules
(assert (forall ((x Entity))
  (=> (and (visits x rabbit) (visits x cat))
      (chases rabbit cat))))

(assert (forall ((x Entity))
  (=> (chases x cat)
      (visits x mouse))))

; Test: Does the rabbit chase the cat?
(assert (chases rabbit cat))

; Check satisfiability and model
(check-sat)
(get-model)