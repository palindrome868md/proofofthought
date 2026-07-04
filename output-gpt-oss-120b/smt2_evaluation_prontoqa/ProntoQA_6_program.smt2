;--- Sort declaration ----------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (unary function) declarations -------------------------------
(declare-fun Tumpus    (Entity) Bool)
(declare-fun Large     (Entity) Bool)
(declare-fun Wumpus    (Entity) Bool)
(declare-fun Opaque    (Entity) Bool)
(declare-fun Dumpus    (Entity) Bool)
(declare-fun Dull      (Entity) Bool)
(declare-fun Rompus    (Entity) Bool)
(declare-fun Brown     (Entity) Bool)
(declare-fun Vumpus    (Entity) Bool)
(declare-fun Temperate (Entity) Bool)
(declare-fun Jompus    (Entity) Bool)
(declare-fun Numpus    (Entity) Bool)
(declare-fun Liquid    (Entity) Bool)
(declare-fun Impus     (Entity) Bool)
(declare-fun Spicy     (Entity) Bool)
(declare-fun Yumpus    (Entity) Bool)
(declare-fun Nervous   (Entity) Bool)
(declare-fun Zumpus    (Entity) Bool)

;--- Constant ------------------------------------------------------------
(declare-const Wren Entity)

;--- Knowledge base (universal rules) ------------------------------------
; Every tumpus is large.
(assert (forall ((x Entity)) (=> (Tumpus x) (Large x))))
; Tumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (Tumpus x) (Wumpus x))))
; Each wumpus is not opaque.
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Opaque x)))))
; Every dumpus is not dull.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Dull x)))))
; Every wumpus is a rompus.
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompus x))))
; Every rompus is brown.
(assert (forall ((x Entity)) (=> (Rompus x) (Brown x))))
; Each rompus is a vumpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Vumpus x))))
; Each vumpus is temperate.
(assert (forall ((x Entity)) (=> (Vumpus x) (Temperate x))))
; Vumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))
; Jompuses are dull.
(assert (forall ((x Entity)) (=> (Jompus x) (Dull x))))
; Jompuses are numpuses.
(assert (forall ((x Entity)) (=> (Jompus x) (Numpus x))))
; Every numpus is liquid.
(assert (forall ((x Entity)) (=> (Numpus x) (Liquid x))))
; Each numpus is an impus.
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
; Impuses are spicy.
(assert (forall ((x Entity)) (=> (Impus x) (Spicy x))))
; Every impus is a yumpus.
(assert (forall ((x Entity)) (=> (Impus x) (Yumpus x))))
; Every yumpus is not nervous.
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Nervous x)))))
; Every yumpus is a zumpus.
(assert (forall ((x Entity)) (=> (Yumpus x) (Zumpus x))))

;--- Facts ---------------------------------------------------------------
; Wren is a tumpus.
(assert (Tumpus Wren))

;--- Query: is Wren dull? -----------------------------------------------
(assert (Dull Wren))

;--- Check the query ------------------------------------------------------
(check-sat)
(get-model)