; Sorts
(declare-sort Entity 0)

; Constants
(declare-const cow Entity)
(declare-const lion Entity)
(declare-const squirrel Entity)

; Predicates / relations
(declare-fun round (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun needs (Entity Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun nice (Entity) Bool)

; Knowledge base (facts)
(assert (not (round cow)))
(assert (needs cow lion))
(assert (needs cow squirrel))
(assert (not (sees cow lion)))
(assert (not (sees cow squirrel)))
(assert (not (red lion)))
(assert (needs lion squirrel))
(assert (sees lion cow))
(assert (not (sees lion squirrel)))
(assert (cold squirrel))
(assert (not (red squirrel)))
(assert (likes squirrel cow))
(assert (not (likes squirrel lion)))
(assert (needs squirrel cow))
(assert (sees squirrel cow))

; Rules
; If someone is blue then they do not see the squirrel.
(assert (forall ((x Entity))
  (=> (blue x)
      (not (sees x squirrel)))))

; If someone is round and not blue then they see the squirrel.
(assert (forall ((x Entity))
  (=> (and (round x) (not (blue x)))
      (sees x squirrel))))

; If someone is blue then they do not like the lion.
(assert (forall ((x Entity))
  (=> (blue x)
      (not (likes x lion)))))

; If someone is blue then they like the lion.
(assert (forall ((x Entity))
  (=> (blue x)
      (likes x lion))))

; If someone sees the lion then the lion does not see the cow.
(assert (forall ((x Entity))
  (=> (sees x lion)
      (not (sees lion cow)))))

; If the lion is round and the lion needs the cow then the cow is nice.
(assert (=> (and (round lion) (needs lion cow)) (nice cow)))

; Test: The squirrel likes the cow.
(assert (likes squirrel cow))

; Check satisfiability to verify the question
(check-sat)
(get-model)