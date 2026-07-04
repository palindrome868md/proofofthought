; 1. Sort declaration
(declare-sort Entity 0)

; 2. Predicate (function) declarations
(declare-fun likes (Entity Entity) Bool)          ; likes(x, y)
(declare-fun visits (Entity Entity) Bool)         ; visits(x, y)
(declare-fun sees (Entity Entity) Bool)           ; sees(x, y)
(declare-fun kind (Entity) Bool)                  ; kind(x)
(declare-fun blue (Entity) Bool)                  ; blue(x)
(declare-fun round (Entity) Bool)                 ; round(x)

; 3. Constant symbols
(declare-const cat Entity)
(declare-const squirrel Entity)

; 4. Facts from the problem statement
(assert (likes cat squirrel))        ; The cat likes the squirrel.
(assert (blue squirrel))             ; The squirrel is blue.

; 5. Rules (universally quantified implications)

; If something visits the cat and the cat likes the squirrel then the squirrel is kind.
(assert (forall ((x Entity))
        (=> (and (visits x cat) (likes cat squirrel))
            (kind squirrel))))

; If something visits the cat then the cat visits the squirrel.
(assert (forall ((x Entity))
        (=> (visits x cat)
            (visits cat squirrel))))

; If something likes the cat and the cat is round then the cat visits the squirrel.
(assert (forall ((x Entity))
        (=> (and (likes x cat) (round cat))
            (visits cat squirrel))))

; If something sees the cat then it visits the cat.
(assert (forall ((x Entity))
        (=> (sees x cat)
            (visits x cat))))

; If something is kind and it visits the cat then the cat likes the squirrel.
(assert (forall ((x Entity))
        (=> (and (kind x) (visits x cat))
            (likes cat squirrel))))

; If something likes the squirrel then it sees the cat.
(assert (forall ((x Entity))
        (=> (likes x squirrel)
            (sees x cat))))

; 6. Query: "The cat likes the squirrel."
; (We assert it again; if the KB already entails it, the solver will be sat.)
(assert (likes cat squirrel))

; 7. Check consistency / truth of the query
(check-sat)
(get-model)