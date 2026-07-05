(declare-sort Creature 0)

; Known individual
(declare-const max Creature)

; Unary predicates (types)
(declare-fun rompus (Creature) Bool)
(declare-fun zumpus (Creature) Bool)
(declare-fun dumpus (Creature) Bool)
(declare-fun vumpus (Creature) Bool)
(declare-fun jompus (Creature) Bool)
(declare-fun wumpus (Creature) Bool)
(declare-fun tumpus (Creature) Bool)
(declare-fun numpus (Creature) Bool)
(declare-fun yumpus (Creature) Bool)
(declare-fun spicy (Creature) Bool)
(declare-fun cold (Creature) Bool)
(declare-fun blue (Creature) Bool)
(declare-fun large (Creature) Bool)
(declare-fun angry (Creature) Bool)
(declare-fun happy (Creature) Bool)
(declare-fun luminous (Creature) Bool)
(declare-fun dull (Creature) Bool)
(declare-fun impus (Creature) Bool)

; Knowledge base (encoded as explicit implications for the specific Max)
; Max is a zumpus
(assert (zumpus max))

; Zumpus -> Dumpus
(assert (=> (zumpus max) (dumpus max)))
; Dumpus -> Happy
(assert (=> (dumpus max) (happy max)))
; Dumpus -> Vumpus
(assert (=> (dumpus max) (vumpus max)))
; Vumpus -> Blue
(assert (=> (vumpus max) (blue max)))
; Vumpus -> Jompus
(assert (=> (vumpus max) (jompus max)))
; Jompus -> not Large
(assert (=> (jompus max) (not (large max))))
; Jompus -> Wumpus
(assert (=> (jompus max) (wumpus max)))
; Wumpus -> not Angry
(assert (=> (wumpus max) (not (angry max))))
; Wumpus -> Tumpus
(assert (=> (wumpus max) (tumpus max)))
; Tumpus -> Dull
(assert (=> (tumpus max) (dull max)))
; Tumpus -> Numpus
(assert (=> (tumpus max) (numpus max)))
; Numpus -> not Luminous
(assert (=> (numpus max) (not (luminous max))))
; Numpus -> Yumpus
(assert (=> (numpus max) (yumpus max)))
; Zumpus -> Cold
(assert (=> (zumpus max) (cold max)))
; (The rest of the knowledge base about rompus, etc., is not required to derive the answer)

; Test question: Is Max angry?
(assert (angry max))

; Check satisfiability of the query given the knowledge base
(check-sat)