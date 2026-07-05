(declare-sort Animal 0)

; Constants
(declare-const bald-eagle Animal)
(declare-const squirrel Animal)

; Predicates
(declare-fun roundp (Animal) Bool)
(declare-fun bluep (Animal) Bool)
(declare-fun kindp (Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)

; Facts (Knowledge Base)
(assert (roundp bald-eagle))
(assert (bluep squirrel))
(assert (kindp squirrel))
(assert (eats squirrel bald-eagle))
(assert (likes bald-eagle squirrel))
(assert (likes squirrel bald-eagle))
(assert (visits squirrel bald-eagle))

; Rules / Inference
; If something is kind then it visits the squirrel
(assert (forall ((x Animal)) (=> (kindp x) (visits x squirrel))))
; If something eats the bald eagle and it is blue then the bald eagle likes the squirrel
(assert (forall ((x Animal)) (=> (and (eats x bald-eagle) (bluep x)) (likes bald-eagle squirrel))))
; All round, blue things are kind
(assert (forall ((x Animal)) (=> (and (roundp x) (bluep x)) (kindp x))))
; If something visits the squirrel then the squirrel visits the bald eagle
(assert (forall ((x Animal)) (=> (visits x squirrel) (visits squirrel bald-eagle))))
; If the squirrel is blue then the squirrel likes the bald eagle
(assert (=> (bluep squirrel) (likes squirrel bald-eagle)))
; If something is round then it eats the bald eagle
(assert (forall ((x Animal)) (=> (roundp x) (eats x bald-eagle))))

; Query: The bald eagle does not like the squirrel.
(assert (not (likes bald-eagle squirrel)))

(check-sat)
(get-model)