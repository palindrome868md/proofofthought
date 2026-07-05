; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun sees (Entity Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun young (Entity) Bool)

; Constants
(declare-const bald-eagle Entity)
(declare-const rabbit Entity)
(declare-const squirrel Entity)

; Facts
(assert (sees bald-eagle rabbit))
(assert (likes rabbit bald-eagle))
(assert (blue squirrel))

; Rules
; If something likes the bald eagle then it is blue
(assert (forall ((x Entity)) (=> (likes x bald-eagle) (blue x))))
; If something likes the bald eagle and it sees the bald eagle then the bald eagle is blue
(assert (forall ((x Entity)) (=> (and (likes x bald-eagle) (sees x bald-eagle)) (blue bald-eagle))))
; If something chases the rabbit then the rabbit is young
(assert (forall ((x Entity)) (=> (chases x rabbit) (young rabbit))))

; Test: Is the rabbit blue?
(assert (blue rabbit))

; Check satisfiability
(check-sat)
(get-model)