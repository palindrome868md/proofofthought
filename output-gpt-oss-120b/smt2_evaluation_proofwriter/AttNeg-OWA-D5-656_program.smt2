;--- Declarations --------------------------------------------------------------
(declare-sort Entity 0)

; predicates
(declare-fun smart (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun blue  (Entity) Bool)
(declare-fun quiet (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun nice  (Entity) Bool)

; constants (the individuals mentioned)
(declare-const anne    Entity)
(declare-const charlie Entity)
(declare-const erin    Entity)
(declare-const harry   Entity)

;--- Facts --------------------------------------------------------------------
(assert (smart anne))                 ; Anne is smart
(assert (not (blue charlie)))         ; Charlie is not blue
(assert (quiet charlie))              ; Charlie is quiet
(assert (not (nice erin)))            ; Erin is not nice
(assert (round erin))                 ; Erin is round
(assert (green harry))                ; Harry is green
(assert (young harry))                ; Harry is young

;--- Rules --------------------------------------------------------------------
; 1. Smart things are green.
(assert (forall ((x Entity)) (=> (smart x) (green x))))

; 2. If Anne is round then Anne is young.
(assert (=> (round anne) (young anne)))

; 3. Blue and green → not quiet.
(assert (forall ((x Entity)) (=> (and (blue x) (green x)) (not (quiet x)))))

; 4. Green and smart → round.
(assert (forall ((x Entity)) (=> (and (green x) (smart x)) (round x))))

; 5. Young → blue.
(assert (forall ((x Entity)) (=> (young x) (blue x))))

; 6. Smart things are nice.
(assert (forall ((x Entity)) (=> (smart x) (nice x))))

; 7. If Harry is quiet and not smart then Harry is young.
(assert (=> (and (quiet harry) (not (smart harry))) (young harry)))

;--- Query --------------------------------------------------------------------
; Test whether Harry is quiet.
(assert (quiet harry))

(check-sat)   ; expected: unsat (the KB entails ¬quiet(Harry))
(get-model)