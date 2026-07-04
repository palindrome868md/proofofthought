; Formalization of the knowledge base:
; Rompuses are large. Every rompus is a wumpus. Every wumpus is not blue.
; Wumpuses are numpuses. Numpuses are cold. Numpuses are impuses.
; Every impus is fruity. Each impus is a jompus. Every jompus is spicy.
; Jompuses are zumpuses. Each vumpus is not spicy. Zumpuses are not dull.
; Zumpuses are yumpuses. Yumpuses are liquid. Each yumpus is a tumpus.
; Every tumpus is opaque. Tumpuses are dumpuses. Wren is a rompus.

(declare-sort Entity 0)

; Predicates (uninterpreted unary relations)
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
(declare-fun Spicy (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Opaque (Entity) Bool)

; Constants
(declare-const wren Entity)

; Knowledge base (universal implications)
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Blue x)))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Cold x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Fruity x))))
(assert (forall ((x Entity)) (=> (Impus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Spicy x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Spicy x)))))
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Dull x)))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Liquid x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Opaque x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Dumpus x))))

; Facts about Wren
(assert (Rompus wren))
(assert (Large wren))
(assert (forall ((x Entity)) (=> (Rompus x) (Large x))))

; Test query: Is Wren spicy?
; We test the negation to verify entailment: if (not Spicy wren) is unsat, then Spicy wren is entailed.
(assert (not (Spicy wren)))

; Check satisfiability and (optionally) get a model
(check-sat)
(get-model)