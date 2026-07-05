; Sorts
(declare-sort Thing 0)

; Constants
(declare-const bald_eagle Thing)
(declare-const bear Thing)
(declare-const cow Thing)
(declare-const lion Thing)

; Predicates
(declare-fun chases (Thing Thing) Bool)
(declare-fun likes  (Thing Thing) Bool)
(declare-fun eats   (Thing Thing) Bool)
(declare-fun rough  (Thing) Bool)
(declare-fun cold   (Thing) Bool)
(declare-fun big    (Thing) Bool)
(declare-fun round  (Thing) Bool)

; Facts (Knowledge Base)
(assert (chases bald_eagle cow))
(assert (likes bald_eagle lion))
(assert (chases bear lion))
(assert (not (eats bear bald_eagle)))
(assert (eats bear lion))
(assert (chases cow bald_eagle))
(assert (chases cow lion))
(assert (likes cow bald_eagle))
(assert (rough lion))
(assert (likes lion bald_eagle))

; Rules / Inference
; If something is rough then it eats the cow
(assert (forall ((x Thing)) (=> (rough x) (eats x cow))))
; If something likes the cow then it eats the cow
(assert (forall ((x Thing)) (=> (likes x cow) (eats x cow))))
; If something likes the cow then it likes the lion
(assert (forall ((x Thing)) (=> (likes x cow) (likes x lion))))
; If something is cold then it likes the lion
(assert (forall ((x Thing)) (=> (cold x) (likes x lion))))
; If the bear is cold and the bear eats the lion then the bear chases the cow
(assert (forall ((x Thing)) (=> (and (cold bear) (eats bear lion)) (chases bear cow))))
; If something is round and not big then it does not eat the bald eagle
(assert (forall ((x Thing)) (=> (and (round x) (not (big x))) (not (eats x bald_eagle)))))
; If the bald eagle likes the bear and the bear chases the bald eagle then the bald eagle chases the bear
(assert (forall ((x Thing)) (=> (and (likes bald_eagle bear) (chases bear bald_eagle)) (chases bald_eagle bear))))
; If something is rough and it chases the cow then the cow is rough
(assert (forall ((x Thing)) (=> (and (rough x) (chases x cow)) (rough cow))))
; If something eats the cow then it chases the cow
(assert (forall ((x Thing)) (=> (eats x cow) (chases x cow))))

; Test: Does the lion chases the cow?
(assert (chases lion cow))

; Check satisfiability and provide a model if possible
(check-sat)
(get-model)