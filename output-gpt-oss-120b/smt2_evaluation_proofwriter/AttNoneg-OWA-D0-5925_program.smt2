; Declare an uninterpreted sort for all objects
(declare-sort Entity 0)

; Declare predicates (Boolean functions)
(declare-fun smart (Entity) Bool)
(declare-fun big   (Entity) Bool)
(declare-fun red   (Entity) Bool)
(declare-fun cold  (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun nice  (Entity) Bool)

; Declare the individual constants mentioned
(declare-const charlie Entity)
(declare-const gary    Entity)

; Knowledge base
; 1. Charlie is smart.
(assert (smart charlie))

; 2. Gary is red.
(assert (red gary))

; 3. Cold and rough things are nice.
(assert (forall ((x Entity))
        (=> (and (cold x) (rough x))
            (nice x))))

; 4. If something is smart then it is big.
(assert (forall ((x Entity))
        (=> (smart x)
            (big x))))

; Query: Charlie is not smart.
(assert (not (smart charlie)))

; Check whether the knowledge base together with the query is consistent.
(check-sat)
(get-model)