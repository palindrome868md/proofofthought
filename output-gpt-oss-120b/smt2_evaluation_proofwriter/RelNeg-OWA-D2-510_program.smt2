;--- 1. Sorts -------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicates (relations) --------------------------------
(declare-fun eats   (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun big    (Entity)        Bool)
(declare-fun cold   (Entity)        Bool)
(declare-fun round  (Entity)        Bool)
(declare-fun red    (Entity)        Bool)

;--- 3. Constants (the individuals) --------------------------
(declare-const bald_eagle Entity)
(declare-const cat        Entity)
(declare-const lion       Entity)
(declare-const rabbit     Entity)

;--- 4. Facts -------------------------------------------------
(assert (eats bald_eagle cat))
(assert (eats bald_eagle lion))

(assert (not (chases cat rabbit)))          ; cat does not chase rabbit
(assert (not (big cat)))                    ; cat is not big
(assert (not (likes cat lion)))             ; cat does not like lion

(assert (cold lion))
(assert (round lion))

(assert (chases rabbit lion))               ; rabbit chases lion
(assert (not (eats rabbit bald_eagle)))     ; rabbit does not eat bald eagle
(assert (eats rabbit lion))
(assert (red rabbit))
(assert (likes rabbit bald_eagle))

;--- 5. Rules ------------------------------------------------
; If someone is cold then they do not chase the bald eagle.
(assert (forall ((x Entity))
  (=> (cold x) (not (chases x bald_eagle)))))

; If the lion chases the cat and the cat eats the rabbit then the cat is not red.
(assert (=> (and (chases lion cat) (eats cat rabbit))
            (not (red cat))))

; If someone is round and they do not chase the bald eagle then they do not like the lion.
(assert (forall ((x Entity))
  (=> (and (round x) (not (chases x bald_eagle)))
      (not (likes x lion)))))

;--- 6. Query ------------------------------------------------
; Test: Does the lion chase the bald eagle?
(assert (chases lion bald_eagle))

;--- 7. Solve ------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)