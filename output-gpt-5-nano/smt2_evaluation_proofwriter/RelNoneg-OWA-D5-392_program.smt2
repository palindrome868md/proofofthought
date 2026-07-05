; Sorts
(declare-sort Entity 0)

; Predicates / Relations
(declare-fun likes (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun big (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun young (Entity) Bool)

; Constants
(declare-const bald_eagle Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)
(declare-const tiger Entity)

; Knowledge Base (Facts)
(assert (likes bald_eagle mouse))
(assert (likes mouse bald_eagle))
(assert (likes rabbit mouse))
(assert (chases tiger mouse))
(assert (chases tiger rabbit))
(assert (big tiger))
(assert (sees tiger bald_eagle))

; Rules / Inference
; A) If p likes tiger and tiger sees bald_eagle then p is rough
(assert (forall ((p Entity)) (=> (and (likes p tiger) (sees tiger bald_eagle)) (rough p))))
; B) If x sees rabbit then rabbit likes tiger
(assert (forall ((x Entity)) (=> (sees x rabbit) (likes rabbit tiger))))
; C) If someone likes bald_eagle and bald_eagle likes rabbit then rabbit is big
(assert (forall ((x Entity)) (=> (and (likes x bald_eagle) (likes bald_eagle rabbit)) (big rabbit))))
; D) If someone likes bald_eagle then bald_eagle is rough
(assert (forall ((x Entity)) (=> (likes x bald_eagle) (rough bald_eagle))))
; E) If mouse chases rabbit then rabbit chases tiger
(assert (forall ((x Entity)) (=> (chases mouse rabbit) (chases rabbit tiger))))
; F) If rabbit sees bald_eagle then bald_eagle chases rabbit
(assert (=> (sees rabbit bald_eagle) (chases bald_eagle rabbit)))
; G) If someone is young and chases mouse then they see the mouse
(assert (forall ((p Entity)) (=> (and (young p) (chases p mouse)) (sees p mouse))))
; H) If someone likes the mouse and they are rough then they see the rabbit
(assert (forall ((p Entity)) (=> (and (likes p mouse) (rough p)) (sees p rabbit))))

; Question: "The rabbit does not like the mouse."
(assert (not (likes rabbit mouse)))

; Verification
(check-sat)
(get-model)