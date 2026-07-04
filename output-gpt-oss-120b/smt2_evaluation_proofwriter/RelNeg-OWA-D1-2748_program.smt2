;--- Sorts -------------------------------------------------
(declare-sort Entity 0)

;--- Predicates --------------------------------------------
(declare-fun chase (Entity Entity) Bool)
(declare-fun cold  (Entity) Bool)
(declare-fun like  (Entity Entity) Bool)
(declare-fun sees  (Entity Entity) Bool)
(declare-fun blue  (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun red   (Entity) Bool)

;--- Constants --------------------------------------------
(declare-const dog    Entity)
(declare-const rabbit Entity)

;--- Facts -------------------------------------------------
(assert (not (chase dog rabbit)))          ; The dog does not chase the rabbit.
(assert (not (cold  dog)))                 ; The dog is not cold.
(assert (not (like  dog rabbit)))          ; The dog does not like the rabbit.
(assert (sees  dog rabbit))                ; The dog sees the rabbit.
(assert (chase rabbit dog))                ; The rabbit chases the dog.
(assert (blue  rabbit))                    ; The rabbit is blue.
(assert (cold  rabbit))                    ; The rabbit is cold.
(assert (not (young rabbit)))              ; The rabbit is not young.
(assert (not (like  rabbit dog)))          ; The rabbit does not like the dog.
(assert (not (sees  rabbit dog)))          ; The rabbit does not see the dog.

;--- Rules ------------------------------------------------
; If something sees the rabbit then it chases the dog.
(assert (forall ((x Entity))
        (=> (sees x rabbit) (chase x dog))))

; If something sees the dog then the dog is red.
(assert (forall ((x Entity))
        (=> (sees x dog) (red dog))))

; If the rabbit sees the dog and the rabbit is cold then the dog chases the rabbit.
(assert (=> (and (sees rabbit dog) (cold rabbit))
            (chase dog rabbit)))

; If something is red and it does not see the rabbit then the rabbit is not red.
(assert (forall ((x Entity))
        (=> (and (red x) (not (sees x rabbit))) (not (red rabbit)))))

; If the rabbit sees the dog then the rabbit does not chase the dog.
(assert (=> (sees rabbit dog) (not (chase rabbit dog))))

; If something chases the rabbit and the rabbit sees the dog then the rabbit is cold.
(assert (forall ((x Entity))
        (=> (and (chase x rabbit) (sees rabbit dog)) (cold rabbit))))

;--- Query ------------------------------------------------
; Test: The dog does not chase the dog.
(assert (not (chase dog dog)))

;--- Check -----------------------------------------------
(check-sat)      ; expected: unsat
(get-model)