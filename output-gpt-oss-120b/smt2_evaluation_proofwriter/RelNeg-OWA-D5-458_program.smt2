;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicates ----------------------------------------------------
(declare-fun sees   (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun needs  (Entity Entity) Bool)

(declare-fun rough (Entity) Bool)
(declare-fun blue  (Entity) Bool)
(declare-fun nice  (Entity) Bool)

;--- Constants (the named individuals) ----------------------------
(declare-const bald_eagle Entity)
(declare-const cow        Entity)
(declare-const tiger      Entity)
(declare-const cat        Entity)

;--- Given facts ---------------------------------------------------
; The bald eagle sees the cow.
(assert (sees bald_eagle cow))

; The bald eagle does not see the tiger.
(assert (not (sees bald_eagle tiger)))

; The bald eagle does not visit the tiger.
(assert (not (visits bald_eagle tiger)))

; The cat is not rough.
(assert (not (rough cat)))

; The cow does not visit the bald eagle.
(assert (not (visits cow bald_eagle)))

; The tiger is blue.
(assert (blue tiger))

; The tiger is rough.
(assert (rough tiger))

; The tiger needs the bald eagle.
(assert (needs tiger bald_eagle))

; The tiger needs the cat.
(assert (needs tiger cat))

; The tiger sees the bald eagle.
(assert (sees tiger bald_eagle))

; The tiger visits the cat.
(assert (visits tiger cat))

; The tiger visits the cow.
(assert (visits tiger cow))

;--- Rules ---------------------------------------------------------
; 1. If something visits the tiger and the tiger visits the bald eagle
;    then the tiger does not visit the cow.
(assert
  (forall ((x Entity))
    (=> (and (visits x tiger) (visits tiger bald_eagle))
        (not (visits tiger cow)))))

; 2. If something needs the tiger and the tiger sees the cat
;    then the tiger sees the bald eagle.
(assert
  (forall ((x Entity))
    (=> (and (needs x tiger) (sees tiger cat))
        (sees tiger bald_eagle))))

; 3. If something is blue then it sees the tiger.
(assert
  (forall ((x Entity))
    (=> (blue x) (sees x tiger))))

; 4. If something needs the cat then it is nice.
(assert
  (forall ((x Entity))
    (=> (needs x cat) (nice x))))

; 5. If something is nice then it needs the cow.
(assert
  (forall ((x Entity))
    (=> (nice x) (needs x cow))))

; 6. If something needs the bald eagle then it visits the bald eagle.
(assert
  (forall ((x Entity))
    (=> (needs x bald_eagle) (visits x bald_eagle))))

; 7. If something needs the cow then the cow needs the cat.
(assert
  (forall ((x Entity))
    (=> (needs x cow) (needs cow cat))))

;--- Question: Does the tiger visit the bald eagle? ----------------
(assert (visits tiger bald_eagle))

;--- Check the result -----------------------------------------------
(check-sat)
(get-model)