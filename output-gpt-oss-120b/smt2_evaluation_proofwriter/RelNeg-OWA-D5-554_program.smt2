;---------------------------------------------------------------
; Sorts
(declare-sort Entity 0)

;---------------------------------------------------------------
; Predicates
(declare-fun chases (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)
(declare-fun rough  (Entity) Bool)
(declare-fun cold   (Entity) Bool)
(declare-fun round  (Entity) Bool)
(declare-fun big    (Entity) Bool)

;---------------------------------------------------------------
; Constants (the individuals mentioned)
(declare-const bald_eagle Entity)
(declare-const bear       Entity)
(declare-const cow        Entity)
(declare-const lion       Entity)

;---------------------------------------------------------------
; Given facts
(assert (chases bald_eagle cow))
(assert (likes  bald_eagle lion))

(assert (chases bear lion))
(assert (not (eats bear bald_eagle)))
(assert (eats bear lion))

(assert (chases cow bald_eagle))
(assert (chases cow lion))
(assert (likes  cow bald_eagle))

(assert (rough lion))
(assert (likes lion bald_eagle))

;---------------------------------------------------------------
; Rules (translated from the natural‑language statements)

; 1. Rough → eats cow
(assert (forall ((x Entity))
  (=> (rough x) (eats x cow))))

; 2. Likes cow → eats cow
(assert (forall ((x Entity))
  (=> (likes x cow) (eats x cow))))

; 3. Likes cow → likes lion
(assert (forall ((x Entity))
  (=> (likes x cow) (likes x lion))))

; 4. Cold → likes lion
(assert (forall ((x Entity))
  (=> (cold x) (likes x lion))))

; 5. If the bear is cold and the bear eats the lion then the bear chases the cow
(assert (=> (and (cold bear) (eats bear lion))
            (chases bear cow)))

; 6. Round ∧ not big → does NOT eat bald eagle
(assert (forall ((x Entity))
  (=> (and (round x) (not (big x)))
      (not (eats x bald_eagle)))))

; 7. Bald eagle likes bear ∧ bear chases bald eagle → bald eagle chases bear
(assert (=> (and (likes bald_eagle bear) (chases bear bald_eagle))
            (chases bald_eagle bear)))

; 8. Rough ∧ chases cow → cow is rough
(assert (forall ((x Entity))
  (=> (and (rough x) (chases x cow))
      (rough cow))))

; 9. Eats cow → chases cow
(assert (forall ((x Entity))
  (=> (eats x cow)
      (chases x cow))))

;---------------------------------------------------------------
; Query: Does the lion chase the cow?
(assert (chases lion cow))

(check-sat)
(get-model)