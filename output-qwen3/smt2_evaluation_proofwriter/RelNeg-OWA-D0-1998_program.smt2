; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Properties)
(declare-fun is_round (Entity) Bool)
(declare-fun is_blue (Entity) Bool)
(declare-fun is_red (Entity) Bool)
(declare-fun is_cold (Entity) Bool)
(declare-fun is_nice (Entity) Bool)

; 2. Declare functions (Relations)
(declare-fun needs (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun likes (Entity Entity) Bool)

; 3. Declare constants
(declare-const cow Entity)
(declare-const lion Entity)
(declare-const squirrel Entity)

; 4. Assert knowledge base (Facts)
(assert (not (is_round cow)))
(assert (needs cow lion))
(assert (needs cow squirrel))
(assert (not (sees cow lion)))
(assert (not (sees cow squirrel)))
(assert (not (is_red lion)))
(assert (needs lion squirrel))
(assert (sees lion cow))
(assert (not (sees lion squirrel)))
(assert (is_cold squirrel))
(assert (not (is_red squirrel)))
(assert (likes squirrel cow))
(assert (not (likes squirrel lion)))
(assert (needs squirrel cow))
(assert (sees squirrel cow))

; 4. Assert knowledge base (Rules)
; If someone is blue then they do not see the squirrel.
(assert (forall ((x Entity))
  (=> (is_blue x) (not (sees x squirrel)))))

; If someone is round and not blue then they see the squirrel.
(assert (forall ((x Entity))
  (=> (and (is_round x) (not (is_blue x))) (sees x squirrel))))

; If someone is blue then they do not like the lion.
(assert (forall ((x Entity))
  (=> (is_blue x) (not (likes x lion)))))

; If someone is blue then they like the lion.
(assert (forall ((x Entity))
  (=> (is_blue x) (likes x lion))))

; If someone sees the lion then the lion does not see the cow.
(assert (forall ((x Entity))
  (=> (sees x lion) (not (sees lion cow)))))

; If the lion is round and the lion needs the cow then the cow is nice.
(assert (=> (and (is_round lion) (needs lion cow)) (is_nice cow)))

; 5. Verification
; Question: The squirrel likes the cow.
; Assert the scenario being tested
(assert (likes squirrel cow))

; Check satisfiability
(check-sat)
(get-model)