; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun is-kind (Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun blue (Entity) Bool)

; Constants
(declare-const bald-eagle Entity)
(declare-const cow Entity)
(declare-const lion Entity)
(declare-const mouse Entity)

; Knowledge base
(assert (is-kind bald-eagle))
(assert (blue cow))
(assert (chases lion mouse))
(assert (chases mouse lion))

; Rules
; If someone chases the mouse then the mouse is not rough
(assert (forall ((p Entity)) (=> (chases p mouse) (not (rough mouse)))))

; If someone sees the mouse then they chase the cow
(assert (forall ((p Entity)) (=> (sees p mouse) (chases p cow))))

; If someone is kind then they are cold
(assert (forall ((p Entity)) (=> (is-kind p) (cold p))))

; If someone chases the lion and they do not see the mouse then they are not kind
(assert (forall ((p Entity)) (=> (and (chases p lion) (not (sees p mouse))) (not (is-kind p)))))

; If someone is cold then they like the lion
(assert (forall ((p Entity)) (=> (cold p) (likes p lion))))

; If someone likes the lion then the lion chases the cow
(assert (forall ((p Entity)) (=> (likes p lion) (chases lion cow))))

; Test: Does the bald eagle not like the lion?
(assert (not (likes bald-eagle lion)))

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)