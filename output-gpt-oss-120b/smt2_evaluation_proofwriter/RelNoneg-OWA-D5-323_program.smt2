;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Constant symbols -------------------------------------------------
(declare-const bear Entity)
(declare-const cow  Entity)
(declare-const dog  Entity)
(declare-const rabbit Entity)

;--- Predicate symbols (return Bool) ----------------------------------
(declare-fun sees   (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun needs  (Entity Entity) Bool)
(declare-fun cold   (Entity)        Bool)
(declare-fun red    (Entity)        Bool)
(declare-fun green  (Entity)        Bool)
(declare-fun kind   (Entity)        Bool)
(declare-fun blue   (Entity)        Bool)

;--- Facts ------------------------------------------------------------
(assert (sees  bear   rabbit))
(assert (likes cow    rabbit))
(assert (needs cow    rabbit))
(assert (sees  cow    rabbit))

(assert (green dog))
(assert (red   dog))                 ; explicit, though entailed by green
(assert (likes dog    cow))
(assert (likes dog    rabbit))
(assert (needs dog    bear))
(assert (sees  dog    cow))
(assert (sees  dog    rabbit))

(assert (blue  rabbit))
(assert (cold  rabbit))
(assert (needs rabbit bear))
(assert (needs rabbit cow))
(assert (sees  rabbit dog))

;--- General rules ----------------------------------------------------
; Green ⇒ Red
(assert (forall ((x Entity))
        (=> (green x) (red x))))

; Likes rabbit ∧ Red → Rabbit likes dog
(assert (forall ((x Entity))
        (=> (and (likes x rabbit) (red x))
            (likes rabbit dog))))

; Sees dog ∧ Needs bear → Red
(assert (forall ((x Entity))
        (=> (and (sees x dog) (needs x bear))
            (red x))))

; Red → Needs cow
(assert (forall ((x Entity))
        (=> (red x) (needs x cow))))

; Sees cow ∧ Needs cow → Likes bear
(assert (forall ((x Entity))
        (=> (and (sees x cow) (needs x cow))
            (likes x bear))))

; Cold ∧ Kind → Green
(assert (forall ((x Entity))
        (=> (and (cold x) (kind x))
            (green x))))

; Sees bear ∧ Bear cold → Bear needs rabbit
(assert (forall ((x Entity))
        (=> (and (sees x bear) (cold bear))
            (needs bear rabbit))))

; Sees dog ∧ Dog likes bear → Bear cold
(assert (forall ((x Entity))
        (=> (and (sees x dog) (likes dog bear))
            (cold bear))))

;--- Query: "The bear is not cold." -----------------------------------
(assert (not (cold bear)))   ; assume bear is NOT cold

;--- Check consistency ------------------------------------------------
(check-sat)   ; expected: unsat (the assumption contradicts the KB)
(get-model)