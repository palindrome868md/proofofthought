; Sorts
(declare-sort Entity 0)

; Predicates (uninterpreted relations)
(declare-fun Rompus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Angry (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Nervous (Entity) Bool)

; Constant representing Sally
(declare-const sally Entity)

; Knowledge base (facts and rules)
; 1. Each rompus is nervous.
(assert (forall ((x Entity)) (=> (Rompus x) (Nervous x))))
; 2. Rompuses are jompuses.
(assert (forall ((x Entity)) (=> (Rompus x) (Jompus x))))
; 3. Jompuses are angry.
(assert (forall ((x Entity)) (=> (Jompus x) (Angry x))))
; 4. Jompuses are tumpuses.
(assert (forall ((x Entity)) (=> (Jompus x) (Tumpus x))))
; 5. Tumpuses are earthy.
(assert (forall ((x Entity)) (=> (Tumpus x) (Earthy x))))
; 6. Every tumpus is a numpus.
(assert (forall ((x Entity)) (=> (Tumpus x) (Numpus x))))
; 7. Each numpus is not cold.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Cold x)))))
; 8. Each numpus is an impus.
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
; 9. Dumpuses are metallic.
(assert (forall ((x Entity) (=> (Dumpus x) (Metallic x)))))
; 10. Impuses are dull.
(assert (forall ((x Entity) (=> (Impus x) (Dull x)))))
; 11. Each impus is a zumpus.
(assert (forall ((x Entity) (=> (Impus x) (Zumpus x))))
)
; 12. Zumpuses are not opaque.
(assert (forall ((x Entity) (=> (Zumpus x) (not (Opaque x))))))
; 13. Zumpuses are wumpuses.
(assert (forall ((x Entity) (=> (Zumpus x) (Wumpus x))))
)
; 14. Every wumpus is blue.
(assert (forall ((x Entity) (=> (Wumpus x) (Blue x))))
)
; 15. Wumpuses are vumpuses.
(assert (forall ((x Entity) (=> (Wumpus x) (Vumpus x))))
)
; 16. Every vumpus is not metallic.
(assert (forall ((x Entity) (=> (Vumpus x) (not (Metallic x))))))
; 17. Every vumpus is a yumpus.
(assert (forall ((x Entity) (=> (Vumpus x) (Yumpus x))))
)
; 18. Every tumpus is a numpus. (explicitly restated earlier for completeness)
(assert (forall ((x Entity) (=> (Tumpus x) (Numpus x))))
)
; 19. Sally is a numpus.
(assert (Numpus sally))

; Test query: "Sally is not metallic."
(assert (not (Metallic sally)))

; Check satisfiability and provide a model if possible
(check-sat)
(get-model)