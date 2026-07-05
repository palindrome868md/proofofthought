(declare-sort Entity 0)

; Predicates
(declare-fun likes (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun round (Entity) Bool)

; Constants (entities)
(declare-const bald-eagle Entity)
(declare-const bear Entity)
(declare-const mouse Entity)
(declare-const squirrel Entity)

; Knowledge base
(assert (likes bald-eagle mouse))
(assert (likes bear squirrel))
(assert (round mouse))
(assert (eats squirrel mouse))

; Rule: If something eats the mouse, then the mouse chases the squirrel
(assert (forall ((p Entity)) (=> (eats p mouse) (chases mouse squirrel))))

; Test: Would the bald-eagle like the mouse?
(assert (likes bald-eagle mouse))

(check-sat)
(get-model)