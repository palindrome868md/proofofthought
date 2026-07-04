; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Constants
(declare-const bald-eagle Thing)
(declare-const squirrel Thing)

; 3. Declare Functions (Predicates)
(declare-fun round (Thing) Bool)
(declare-fun likes (Thing Thing) Bool)
(declare-fun eats (Thing Thing) Bool)
(declare-fun blue (Thing) Bool)
(declare-fun kind (Thing) Bool)
(declare-fun visits (Thing Thing) Bool)

; 4. Assert Knowledge Base (Facts)
; The bald eagle is round.
(assert (round bald-eagle))
; The bald eagle likes the squirrel.
(assert (likes bald-eagle squirrel))
; The squirrel eats the bald eagle.
(assert (eats squirrel bald-eagle))
; The squirrel is blue.
(assert (blue squirrel))
; The squirrel is kind.
(assert (kind squirrel))
; The squirrel likes the bald eagle.
(assert (likes squirrel bald-eagle))
; The squirrel visits the bald eagle.
(assert (visits squirrel bald-eagle))

; 5. Assert Knowledge Base (Rules)
; If something is kind then it visits the squirrel.
(assert (forall ((x Thing)) (=> (kind x) (visits x squirrel))))
; If something eats the bald eagle and it is blue then the bald eagle likes the squirrel.
(assert (forall ((x Thing)) (=> (and (eats x bald-eagle) (blue x)) (likes bald-eagle squirrel))))
; All round, blue things are kind.
(assert (forall ((x Thing)) (=> (and (round x) (blue x)) (kind x))))
; If something visits the squirrel then the squirrel visits the bald eagle.
(assert (forall ((x Thing)) (=> (visits x squirrel) (visits squirrel bald-eagle))))
; If the squirrel is blue then the squirrel likes the bald eagle.
(assert (=> (blue squirrel) (likes squirrel bald-eagle)))
; If something is round then it eats the bald eagle.
(assert (forall ((x Thing)) (=> (round x) (eats x bald-eagle))))

; 6. Verify Question: The bald eagle does not like the squirrel.
; We assert the statement to check if it is consistent with the KB.
(assert (not (likes bald-eagle squirrel)))

; 7. Check Satisfiability
(check-sat)
(get-model)