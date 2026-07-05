; Sorts
(declare-sort Entity 0)

; Constants
(declare-const wren Entity)

; Predicates
(declare-fun Tumpus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Brown (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)

; Knowledge base
; 1. Every tumpus is large
(assert (forall ((x Entity)) (=> (Tumpus x) (Large x))))
; 2. Tumpuses are wumpuses
(assert (forall ((x Entity)) (=> (Tumpus x) (Wumpus x))))
; 3. Each wumpus is not opaque
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Opaque x)))))
; 4. Every dumpus is not dull
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Dull x))))
)
; 5. Every wumpus is a rompus
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompus x))))
; 6. Every rompus is brown
(assert (forall ((x Entity)) (=> (Rompus x) (Brown x))))
; 7. Each rompus is a vumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Vumpus x))))
; 8. Each vumpus is temperate
(assert (forall ((x Entity)) (=> (Vumpus x) (Temperate x))))
; 9. Vumpuses are jompuses
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))
; 10. Jompuses are dull
(assert (forall ((x Entity)) (=> (Jompus x) (Dull x))))
; 11. Jompuses are numpuses
(assert (forall ((x Entity)) (=> (Jompus x) (Numpus x))))
; 12. Every numpus is liquid
(assert (forall ((x Entity)) (=> (Numpus x) (Liquid x))))
; 13. Each numpus is an impus
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
; 14. Impuses are spicy
(assert (forall ((x Entity)) (=> (Impus x) (Spicy x))))
; 15. Every impus is a yumpus
(assert (forall ((x Entity)) (=> (Impus x) (Yumpus x))))
; 16. Every yumpus is not nervous
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Nervous x)))))
; 17. Every yumpus is a zumpus
(assert (forall ((x Entity)) (=> (Yumpus x) (Zumpus x))))
; 18. Wren is a tumpus
(assert (Tumpus wren))

; Query: Is Wren dull?
(assert (Dull wren))

; Check satisfiability and model
(check-sat)
(get-model)