; -------------------------------------------------
; Sort for all individuals
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; Unary predicates (properties / classes)
; -------------------------------------------------
(declare-fun rompus   (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun angry    (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun earthy   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun cold     (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun blue     (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)

; -------------------------------------------------
; Constant representing Sally
; -------------------------------------------------
(declare-const sally Entity)

; -------------------------------------------------
; Knowledge base (the given sentences)
; -------------------------------------------------
; 1. Each rompus is nervous.
(assert (forall ((x Entity)) (=> (rompus x) (nervous x))))

; 2. Rompuses are jompuses.
(assert (forall ((x Entity)) (=> (rompus x) (jompus x))))

; 3. Jompuses are angry.
(assert (forall ((x Entity)) (=> (jompus x) (angry x))))

; 4. Jompuses are tumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (tumpus x))))

; 5. Tumpuses are earthy.
(assert (forall ((x Entity)) (=> (tumpus x) (earthy x))))

; 6. Every tumpus is a numpus.
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

; 7. Each numpus is not cold.
(assert (forall ((x Entity)) (=> (numpus x) (not (cold x)))))

; 8. Each numpus is an impus.
(assert (forall ((x Entity)) (=> (numpus x) (impus x))))

; 9. Dumpuses are metallic.
(assert (forall ((x Entity)) (=> (dumpus x) (metallic x))))

;10. Impuses are dull.
(assert (forall ((x Entity)) (=> (impus x) (dull x))))

;11. Each impus is a zumpus.
(assert (forall ((x Entity)) (=> (impus x) (zumpus x))))

;12. Zumpuses are not opaque.
(assert (forall ((x Entity)) (=> (zumpus x) (not (opaque x)))))

;13. Zumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (wumpus x))))

;14. Every wumpus is blue.
(assert (forall ((x Entity)) (=> (wumpus x) (blue x))))

;15. Wumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (vumpus x))))

;16. Every vumpus is not metallic.
(assert (forall ((x Entity)) (=> (vumpus x) (not (metallic x)))))

;17. Every vumpus is a yumpus.
(assert (forall ((x Entity)) (=> (vumpus x) (yumpus x))))

;18. Sally is a numpus.
(assert (numpus sally))

; -------------------------------------------------
; Test the statement: "Sally is not metallic."
; -------------------------------------------------
(assert (not (metallic sally)))

; -------------------------------------------------
; Ask Z3 whether the constraints are consistent
; -------------------------------------------------
(check-sat)
(get-model)