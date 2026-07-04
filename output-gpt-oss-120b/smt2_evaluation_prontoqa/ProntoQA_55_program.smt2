;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Constant ---------------------------------------------------------
(declare-const rex Entity)

;--- Predicates (unary properties) ------------------------------------
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Blue     (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Hot      (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Luminous (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Mean     (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Small    (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Feisty   (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Dull     (Entity) Bool)   ; optional, not needed for the query

;--- Facts ------------------------------------------------------------
(assert (Dumpus rex))

;--- General rules ----------------------------------------------------
; Dumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Dumpus x) (Numpus x))))
; Numpuses are blue.
(assert (forall ((x Entity)) (=> (Numpus x) (Blue x))))
; Numpuses are wumpuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))
; Wumpuses are hot.
(assert (forall ((x Entity)) (=> (Wumpus x) (Hot x))))
; Wumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (Wumpus x) (Vumpus x))))
; Vumpuses are luminous.
(assert (forall ((x Entity)) (=> (Vumpus x) (Luminous x))))
; Each vumpus is a jompus.
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))
; Jompuses are mean.
(assert (forall ((x Entity)) (=> (Jompus x) (Mean x))))
; Jompuses are impuses.
(assert (forall ((x Entity)) (=> (Jompus x) (Impus x))))
; Every impus is not small.
(assert (forall ((x Entity)) (=> (Impus x) (not (Small x)))))
; Every impus is a rompus.
(assert (forall ((x Entity)) (=> (Impus x) (Rompus x))))
; Rompuses are not feisty.
(assert (forall ((x Entity)) (=> (Rompus x) (not (Feisty x)))))
; Yumpuses are not mean.
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Mean x)))))
; Every rompus is a zumpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Zumpus x))))
; Dumpuses are dull (auxiliary fact, not needed for the query).
(assert (forall ((x Entity)) (=> (Dumpus x) (Dull x))))

;--- Query: is Rex mean? ---------------------------------------------
(assert (Mean rex))

;--- Solve ------------------------------------------------------------
(check-sat)
(get-model)