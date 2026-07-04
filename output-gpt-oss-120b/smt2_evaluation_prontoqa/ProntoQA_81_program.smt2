;--- Sort for all individuals -------------------------------------------------
(declare-sort Entity 0)

;--- Individual ---------------------------------------------------------------
(declare-const Sam Entity)

;--- Predicates (uninterpreted Boolean functions) ----------------------------
(declare-fun Jompus (Entity) Bool)
(declare-fun Dull (Entity) Bool)

(declare-fun Wumpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)

(declare-fun Dumpus (Entity) Bool)
(declare-fun Floral (Entity) Bool)

(declare-fun Numpus (Entity) Bool)
(declare-fun Luminous (Entity) Bool)

(declare-fun Vumpus (Entity) Bool)
(declare-fun Large (Entity) Bool)

(declare-fun Tumpus (Entity) Bool)
(declare-fun Orange (Entity) Bool)

(declare-fun Zumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)

(declare-fun Rompus (Entity) Bool)
(declare-fun Temperate (Entity) Bool)

(declare-fun Yumpus (Entity) Bool)

;--- Knowledge base -----------------------------------------------------------
; Jompuses are not dull.
(assert (forall ((x Entity)) (=> (Jompus x) (not (Dull x)))))

; Every wumpus is opaque.
(assert (forall ((x Entity)) (=> (Wumpus x) (Opaque x))))

; Wumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (Wumpus x) (Dumpus x))))

; Every dumpus is not floral.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Floral x)))))

; Dumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Dumpus x) (Numpus x))))

; Each numpus is not luminous.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Luminous x)))))

; Each numpus is a vumpus.
(assert (forall ((x Entity)) (=> (Numpus x) (Vumpus x))))

; Every vumpus is large.
(assert (forall ((x Entity)) (=> (Vumpus x) (Large x))))

; Vumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))

; Every tumpus is not orange.
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Orange x)))))

; Every tumpus is a zumpus.
(assert (forall ((x Entity)) (=> (Tumpus x) (Zumpus x))))

; Zumpuses are dull.
(assert (forall ((x Entity)) (=> (Zumpus x) (Dull x))))

; Every zumpus is an impus.
(assert (forall ((x Entity)) (=> (Zumpus x) (Impus x))))

; Every impus is spicy.
(assert (forall ((x Entity)) (=> (Impus x) (Spicy x))))

; Every impus is a rompus.
(assert (forall ((x Entity)) (=> (Impus x) (Rompus x))))

; Rompuses are not temperate.
(assert (forall ((x Entity)) (=> (Rompus x) (not (Temperate x)))))

; Every rompus is a yumpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Yumpus x))))

;--- Fact about Sam -----------------------------------------------------------
(assert (Dumpus Sam))

;--- Test the statement "Sam is dull" -----------------------------------------
(assert (Dull Sam))

;--- Verify ---------------------------------------------------------------
(check-sat)   ; expected result: sat (the statement is entailed)
(get-model)