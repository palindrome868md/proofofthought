; Declare a generic domain of entities
(declare-sort Entity 0)

; Constants
(declare-const wren Entity)

; Predicates representing categories and properties
(declare-fun Rompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)

; Other properties
(declare-fun Large (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Opaque (Entity) Bool)

; Knowledge base (facts and rules)

; Wren is a rompus
(assert (Rompus wren))

; 1) Rompus -> Wumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))

; 2) Wumpus -> not Blue
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Blue x)))))

; 3) Wumpus -> Numpus
(assert (forall ((x Entity)) (=> (Wumpus x) (Numpus x))))

; 4) Numpus -> Cold
(assert (forall ((x Entity)) (=> (Numpus x) (Cold x))))

; 5) Numpus -> Impus
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))

; 6) Impus -> Fruity
(assert (forall ((x Entity)) (=> (Impus x) (Fruity x))))

; 7) Impus -> Jompus
(assert (forall ((x Entity)) (=> (Impus x) (Jompus x))))

; 8) Jompus -> Spicy
(assert (forall ((x Entity)) (=> (Jompus x) (Spicy x))))

; 9) Jompus -> Zumpus
(assert (forall ((x Entity)) (=> (Jompus x) (Zumpus x))))

; 10) Vumpus -> not Spicy
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Spicy x)))))

; 11) Zumpus -> not Dull
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Dull x)))))

; 12) Zumpus -> Yumpus
(assert (forall ((x Entity)) (=> (Zumpus x) (Yumpus x))))

; 13) Yumpus -> Liquid
(assert (forall ((x Entity)) (=> (Yumpus x) (Liquid x))))

; 14) Yumpus -> Tumpus
(assert (forall ((x Entity)) (=> (Yumpus x) (Tumpus x))))

; 15) Tumpus -> Opaque
(assert (forall ((x Entity)) (=> (Tumpus x) (Opaque x))))

; 16) Tumpus -> Dumpus
(assert (forall ((x Entity)) (=> (Tumpus x) (Dumpus x))))

; 17) Rompus -> Large
(assert (forall ((x Entity)) (=> (Rompus x) (Large x))))

; Question: "Is Wren spicy?" We test by assuming the negation and checking consistency.
(assert (not (Spicy wren)))

; Check satisfiability to determine if Spicy(wren) is entailed
(check-sat)
(get-model)