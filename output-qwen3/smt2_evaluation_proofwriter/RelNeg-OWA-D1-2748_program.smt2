; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare constants
(declare-const dog Entity)
(declare-const rabbit Entity)

; 3. Declare functions (predicates)
(declare-fun chases (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun red (Entity) Bool)

; 4. Assert knowledge base (facts)
; The dog does not chase the rabbit.
(assert (not (chases dog rabbit)))
; The dog is not cold.
(assert (not (cold dog)))
; The dog does not like the rabbit.
(assert (not (likes dog rabbit)))
; The dog sees the rabbit.
(assert (sees dog rabbit))
; The rabbit chases the dog.
(assert (chases rabbit dog))
; The rabbit is blue.
(assert (blue rabbit))
; The rabbit is cold.
(assert (cold rabbit))
; The rabbit is not young.
(assert (not (young rabbit)))
; The rabbit does not like the dog.
(assert (not (likes rabbit dog)))
; The rabbit does not see the dog.
(assert (not (sees rabbit dog)))

; 5. Assert rules
; If something sees the rabbit then it chases the dog.
(assert (forall ((x Entity)) (=> (sees x rabbit) (chases x dog))))
; If something sees the dog then the dog is red.
(assert (forall ((x Entity)) (=> (sees x dog) (red dog))))
; If the rabbit sees the dog and the rabbit is cold then the dog chases the rabbit.
(assert (=> (and (sees rabbit dog) (cold rabbit)) (chases dog rabbit)))
; If something is red and it does not see the rabbit then the rabbit is not red.
(assert (forall ((x Entity)) (=> (and (red x) (not (sees x rabbit))) (not (red rabbit)))))
; If the rabbit sees the dog then the rabbit does not chase the dog.
(assert (=> (sees rabbit dog) (not (chases rabbit dog))))
; If something chases the rabbit and the rabbit sees the dog then the rabbit is cold.
(assert (forall ((x Entity)) (=> (and (chases x rabbit) (sees rabbit dog)) (cold rabbit))))

; 6. Verification
; Question: The dog does not chase the dog.
; We assert the statement to test its validity against the Knowledge Base.
(assert (not (chases dog dog)))

; 7. Check satisfiability
(check-sat)
(get-model)