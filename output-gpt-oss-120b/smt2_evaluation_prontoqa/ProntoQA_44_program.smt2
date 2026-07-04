; Declare a generic sort for all individuals
(declare-sort Entity 0)

; Unary predicates for the various categories/properties
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Floral   (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Temperate(Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Dull     (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Spicy    (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Opaque   (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Red      (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Shy      (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)

; Constant representing Rex
(declare-const Rex Entity)

; Knowledge base (rules and facts)

; 1. Yumpuses are floral.
(assert (forall ((x Entity)) (=> (Yumpus x) (Floral x))))

; 2. Each yumpus is a vumpus.
(assert (forall ((x Entity)) (=> (Yumpus x) (Vumpus x))))

; 3. Vumpuses are not temperate.
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Temperate x)))))

; 4. Vumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))

; 5. Jompuses are not dull.
(assert (forall ((x Entity)) (=> (Jompus x) (not (Dull x)))))

; 6. Impuses are not spicy.
(assert (forall ((x Entity)) (=> (Impus x) (not (Spicy x)))))

; 7. Jompuses are numpuses.
(assert (forall ((x Entity)) (=> (Jompus x) (Numpus x))))

; 8. Numpuses are not opaque.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Opaque x)))))

; 9. Each numpus is a wumpus.
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))

; 10. Every wumpus is amenable.
(assert (forall ((x Entity)) (=> (Wumpus x) (Amenable x))))

; 11. Wumpuses are rompuses.
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompus x))))

; 12. Each rompus is not red.
(assert (forall ((x Entity)) (=> (Rompus x) (not (Red x)))))

; 13. Rompuses are tumpuses.
(assert (forall ((x Entity)) (=> (Rompus x) (Tumpus x))))

; 14. Tumpuses are spicy.
(assert (forall ((x Entity)) (=> (Tumpus x) (Spicy x))))

; 15. Every tumpus is a dumpus.
(assert (forall ((x Entity)) (=> (Tumpus x) (Dumpus x))))

; 16. Dumpuses are shy.
(assert (forall ((x Entity)) (=> (Dumpus x) (Shy x))))

; 17. Each dumpus is a zumpus.
(assert (forall ((x Entity)) (=> (Dumpus x) (Zumpus x))))

; Fact: Rex is a jompus.
(assert (Jompus Rex))

; -------------------------------------------------
; Test the statement: "Rex is not spicy"
; We assert its negation and see whether the
; resulting set of constraints is unsatisfiable.
; If unsat, the original statement is false.
; -------------------------------------------------
(assert (not (Spicy Rex)))

; Check satisfiability
(check-sat)
(get-model)