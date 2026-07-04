; -------------------------------------------------
; Declarations
; -------------------------------------------------
(declare-sort Entity 0)

; Unary predicates (properties / classes)
(declare-fun wumpus   (Entity) Bool)
(declare-fun sour     (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun feisty   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun aggressive(Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun hot      (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun blue     (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)

; Constant representing the individual Fae
(declare-const Fae Entity)

; -------------------------------------------------
; Knowledge base (axioms)
; -------------------------------------------------
; 1. Wumpuses are not sour
(assert (forall ((x Entity)) (=> (wumpus x) (not (sour x)))))

; 2. Each wumpus is a rompus
(assert (forall ((x Entity)) (=> (wumpus x) (rompus x))))

; 3. Rompuses are dull
(assert (forall ((x Entity)) (=> (rompus x) (dull x))))

; 4. Each rompus is a dumpus
(assert (forall ((x Entity)) (=> (rompus x) (dumpus x))))

; 5. Every dumpus is feisty
(assert (forall ((x Entity)) (=> (dumpus x) (feisty x))))

; 6. Jompuses are aggressive
(assert (forall ((x Entity)) (=> (jompus x) (aggressive x))))

; 7. Dumpuses are tumpuses
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))

; 8. Tumpuses are opaque
(assert (forall ((x Entity)) (=> (tumpus x) (opaque x))))

; 9. Every tumpus is a numpus
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

;10. Numpuses are hot
(assert (forall ((x Entity)) (=> (numpus x) (hot x))))

;11. Numpuses are zumpuses
(assert (forall ((x Entity)) (=> (numpus x) (zumpus x))))

;12. Zumpuses are large
(assert (forall ((x Entity)) (=> (zumpus x) (large x))))

;13. Every zumpus is a vumpus
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))

;14. Vumpuses are blue
(assert (forall ((x Entity)) (=> (vumpus x) (blue x))))

;15. Every vumpus is an impus
(assert (forall ((x Entity)) (=> (vumpus x) (impus x))))

;16. Impuses are not aggressive
(assert (forall ((x Entity)) (=> (impus x) (not (aggressive x)))))

;17. Impuses are yumpuses
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))

;18. Fae is a tumpus
(assert (tumpus Fae))

; -------------------------------------------------
; Test the statement: "Fae is not aggressive."
; -------------------------------------------------
(assert (not (aggressive Fae)))

; -------------------------------------------------
; Check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)