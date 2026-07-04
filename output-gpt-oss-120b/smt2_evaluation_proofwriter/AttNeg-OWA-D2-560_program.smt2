;--- 1. Declare the domain sort -------------------------------------------------
(declare-sort Entity 0)

;--- 2. Declare unary predicates (properties) -----------------------------------
(declare-fun young   (Entity) Bool)
(declare-fun white   (Entity) Bool)
(declare-fun green   (Entity) Bool)
(declare-fun cold    (Entity) Bool)
(declare-fun nice    (Entity) Bool)
(declare-fun blue    (Entity) Bool)
(declare-fun smart   (Entity) Bool)

;--- 3. Declare the individuals -------------------------------------------------
(declare-const anne Entity)
(declare-const dave Entity)
(declare-const erin Entity)

;--- 4. Knowledge base -----------------------------------------------------------

; Base facts
(assert (young anne))
(assert (young dave))
(assert (white erin))

; Rules
; All green things are not cold.
(assert (forall ((x Entity))
        (=> (green x) (not (cold x)))))

; If Anne is nice and Anne is cold then Anne is not young.
(assert (=> (and (nice anne) (cold anne))
            (not (young anne))))

; If something is white then it is green.
(assert (forall ((x Entity))
        (=> (white x) (green x))))

; White, blue things are nice.
(assert (forall ((x Entity))
        (=> (and (white x) (blue x)) (nice x))))

; If Anne is nice then Anne is green.
(assert (=> (nice anne) (green anne)))

; If something is young then it is not blue.
(assert (forall ((x Entity))
        (=> (young x) (not (blue x)))))

; Green things are blue.
(assert (forall ((x Entity))
        (=> (green x) (blue x))))

; If something is young and not green then it is not smart.
(assert (forall ((x Entity))
        (=> (and (young x) (not (green x))) (not (smart x)))))

;--- 5. Test the query: "Erin is not cold." -------------------------------------

(assert (not (cold erin)))   ; the statement we want to verify

;--- 6. Check satisfiability ------------------------------------------------------
(check-sat)
(get-model)