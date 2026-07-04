;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (function) declarations --------------------------------
(declare-fun round (Entity) Bool)
(declare-fun red   (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun kind  (Entity) Bool)

;--- Constant declaration ---------------------------------------------
(declare-const cow Entity)

;--- Knowledge base ----------------------------------------------------
; Fact: The cow is round.
(assert (round cow))

; Rule: All kind people are young.
(assert (forall ((x Entity)) (=> (kind x) (young x))))

; Rule: If someone is round and red then they are young.
(assert (forall ((x Entity)) (=> (and (round x) (red x)) (young x))))

; Rule: If someone is young then they are round.
(assert (forall ((x Entity)) (=> (young x) (round x))))

; Rule: If the cow is round and the cow is young then the cow is kind.
(assert (=> (and (round cow) (young cow)) (kind cow)))

; Rule: Round people are red.
(assert (forall ((x Entity)) (=> (round x) (red x))))

; Rule: All round, kind people are young.
(assert (forall ((x Entity)) (=> (and (round x) (kind x)) (young x))))

;--- Query: The cow is round -------------------------------------------
; (already asserted above, but we assert it again to test the query)
(assert (round cow))

;--- Check satisfiability -----------------------------------------------
(check-sat)
(get-model)