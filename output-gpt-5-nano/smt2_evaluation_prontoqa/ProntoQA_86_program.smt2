; Sorts
(declare-sort Creature 0)

; Predicates
(declare-fun zumpus (Creature) Bool)
(declare-fun tumpus (Creature) Bool)
(declare-fun vumpus (Creature) Bool)
(declare-fun impus (Creature) Bool)
(declare-fun yumpus (Creature) Bool)
(declare-fun jompus (Creature) Bool)
(declare-fun wumpus (Creature) Bool)
(declare-fun dumpus (Creature) Bool)
(declare-fun luminous (Creature) Bool)
(declare-fun spicy (Creature) Bool)
(declare-fun fruity (Creature) Bool)
(declare-fun small (Creature) Bool)
(declare-fun shy (Creature) Bool)
(declare-fun amenable (Creature) Bool)
(declare-fun temperate (Creature) Bool)
(declare-fun numpuse (Creature) Bool)
(declare-fun rompus (Creature) Bool)

; Constants
(declare-const Stella Creature)

; Facts (Knowledge base)
(assert (impus Stella))                          ; Stella is an impus

; Derived implications (grounded, to ensure Stella propagates the chain)
(assert (=> (impus Stella) (yumpus Stella)))
(assert (=> (yumpus Stella) (jompus Stella)))
(assert (=> (jompus Stella) (wumpus Stella)))
(assert (=> (wumpus Stella) (dumpus Stella)))
(assert (=> (dumpus Stella) (shy Stella)))
(assert (=> (impus Stella) (small Stella)))
(assert (=> (yumpus Stella) (temperate Stella)))
; Additional constraints for Stella (optional but harmless to the test)
(assert (=> (tumpus Stella) (not spicy Stella)))
(assert (=> (tumpus Stella) (vumpus Stella)))
(assert (=> (vumpus Stella) (not fruity Stella)))
(assert (=> (vumpus Stella) (impus Stella)))

; Test scenario: Is Stella not shy?
(assert (not (shy Stella)))

; Query
(check-sat)
(get-model)