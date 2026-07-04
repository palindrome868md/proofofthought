; Sorts
(declare-sort Entity 0)

; Constants
(declare-const Rex Entity)

; Predicates
(declare-fun Yumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Red (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Floral (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Shy (Entity) Bool)

; Knowledge base / Axioms
; Rex is a jompus
(assert (Jompus Rex))

; Yumpuses -> Floral
(assert (forall ((x Entity)) (=> (Yumpus x) (Floral x))))
; Yumpuses -> Vumpuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Vumpus x))))
; Vumpuses -> not Temperate
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Temperate x)))))
; Vumpuses -> Jompus
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))
; Jompus -> not Dull
(assert (forall ((x Entity)) (=> (Jompus x) (not (Dull x)))))
; Impuse -> not Spicy
(assert (forall ((x Entity)) (=> (Impuse x) (not (Spicy x)))))
; Jompus -> Numpus
(assert (forall ((x Entity)) (=> (Jompus x) (Numpus x))))
; Numpus -> not Opaque
(assert (forall ((x Entity)) (=> (Numpus x) (not (Opaque x)))))
; Numpus -> Wumpus
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))
; Wumpus -> Amenable
(assert (forall ((x Entity)) (=> (Wumpus x) (Amenable x))))
; Wumpus -> Rompus
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompus x))))
; Rompus -> not Red
(assert (forall ((x Entity)) (=> (Rompus x) (not (Red x)))))
; Rompus -> Tumpus
(assert (forall ((x Entity)) (=> (Rompus x) (Tumpus x))))
; Tumpus -> Spicy
(assert (forall ((x Entity)) (=> (Tumpus x) (Spicy x))))
; Tumpus -> Dumpus
(assert (forall ((x Entity)) (=> (Tumpus x) (Dumpus x))))
; Dumpus -> Shy
(assert (forall ((x Entity)) (=> (Dumpus x) (Shy x))))
; Dumpus -> Zumpus
(assert (forall ((x Entity)) (=> (Dumpus x) (Zumpus x))))

; Test statement: "Rex is not spicy."
(assert (not (Spicy Rex)))
(check-sat)