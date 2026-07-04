; SMT-LIB 2.0 program to determine if "Wren is not cold" follows from the chain of implications

; Sorts
(declare-sort Entity 0)

; Constants
(declare-const Wren Entity)

; Predicates (types)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)

; Properties (used in rules)
(declare-fun Blue (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Aggressive (Entity) Bool)

; Knowledge base (rules)
; 1. Tumpus are not Blue
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Blue x)))))

; 2. Vumpus are not Transparent
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Transparent x)))))

; 3. Vumpus -> Rompus
(assert (forall ((x Entity)) (=> (Vumpus x) (Rompus x))))

; 4. Rompus -> not Fruity
(assert (forall ((x Entity)) (=> (Rompus x) (not (Fruity x)))))

; 5. Rompus -> Dumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Dumpus x))))

; 6. Dumpus -> not Nervous
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Nervous x)))))

; 7. Dumpus -> Yumpus
(assert (forall ((x Entity)) (=> (Dumpus x) (Yumpus x))))

; 8. Yumpus -> not Liquid
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Liquid x)))))

; 9. Yumpus -> Jompus
(assert (forall ((x Entity)) (=> (Yumpus x) (Jompus x))))

; 10. Jompus -> not Cold
(assert (forall ((x Entity)) (=> (Jompus x) (not (Cold x)))))

; 11. Zumpus -> Cold
(assert (forall ((x Entity)) (=> (Zumpus x) (Cold x))))

; 12. Jompus -> Numpus
(assert (forall ((x Entity)) (=> (Jompus x) (Numpus x))))

; 13. Numpus -> Large
(assert (forall ((x Entity)) (=> (Numpus x) (Large x))))

; 14. Numpus -> Impus
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))

; 15. Impus -> Aggressive
(assert (forall ((x Entity)) (=> (Impus x) (Aggressive x))))

; 16. Impus -> Wumpus
(assert (forall ((x Entity)) (=> (Impus x) (Wumpus x))))

; 17. Wren is a Vumpus
(assert (Vumpus Wren))

; Query: Is "Wren is not cold" true?
; We assert the scenario to test whether not-Cold(Wren) is consistent with the KB
(assert (not (Cold Wren)))

; Check satisfiability and provide a model if one exists
(check-sat)
(get-model)