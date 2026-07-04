; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun young (Thing) Bool)
(declare-fun white (Thing) Bool)
(declare-fun green (Thing) Bool)
(declare-fun cold (Thing) Bool)
(declare-fun nice (Thing) Bool)
(declare-fun blue (Thing) Bool)
(declare-fun smart (Thing) Bool)

; 3. Declare constants
(declare-const anne Thing)
(declare-const dave Thing)
(declare-const erin Thing)

; 4. Assert knowledge base (facts)
; Anne is young.
(assert (young anne))
; Dave is young.
(assert (young dave))
; Erin is white.
(assert (white erin))
; All green things are not cold.
(assert (forall ((x Thing)) (=> (green x) (not (cold x)))))
; If Anne is nice and Anne is cold then Anne is not young.
(assert (=> (and (nice anne) (cold anne)) (not (young anne))))
; If something is white then it is green.
(assert (forall ((x Thing)) (=> (white x) (green x))))
; White, blue things are nice.
(assert (forall ((x Thing)) (=> (and (white x) (blue x)) (nice x))))
; If Anne is nice then Anne is green.
(assert (=> (nice anne) (green anne)))
; If something is young then it is not blue.
(assert (forall ((x Thing)) (=> (young x) (not (blue x)))))
; Green things are blue.
(assert (forall ((x Thing)) (=> (green x) (blue x))))
; If something is young and not green then it is not smart.
(assert (forall ((x Thing)) (=> (and (young x) (not (green x))) (not (smart x)))))

; 5. Verify Question: Erin is not cold.
; We assert the statement to check if it is satisfiable (True) or unsatisfiable (False)
(assert (not (cold erin)))

; 6. Check satisfiability
(check-sat)
(get-model)