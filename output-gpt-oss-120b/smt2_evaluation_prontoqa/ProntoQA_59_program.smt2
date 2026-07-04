;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Constants -----------------------------------------------------
(declare-const Max Entity)

;--- Predicates (properties) ---------------------------------------
(declare-fun Rompus (Entity) Bool)
(declare-fun Mean (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Brown (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)

;--- Knowledge base ------------------------------------------------
; Each rompus is mean.
(assert (forall ((x Entity)) (=> (Rompus x) (Mean x))))

; Every rompus is a wumpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))

; Each tumpus is nervous.
(assert (forall ((x Entity)) (=> (Tumpus x) (Nervous x))))

; Wumpuses are brown.
(assert (forall ((x Entity)) (=> (Wumpus x) (Brown x))))

; Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (Wumpus x) (Yumpus x))))

; Every yumpus is large.
(assert (forall ((x Entity)) (=> (Yumpus x) (Large x))))

; Yumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (Yumpus x) (Vumpus x))))

; Each vumpus is dull.
(assert (forall ((x Entity)) (=> (Vumpus x) (Dull x))))

; Vumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (Vumpus x) (Zumpus x))))

; Zumpuses are earthy.
(assert (forall ((x Entity)) (=> (Zumpus x) (Earthy x))))

; Every zumpus is a numpus.
(assert (forall ((x Entity)) (=> (Zumpus x) (Numpus x))))

; Numpuses are not sour.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Sour x)))))

; Numpuses are impuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))

; Impuses are transparent.
(assert (forall ((x Entity)) (=> (Impus x) (Transparent x))))

; Each impus is a dumpus.
(assert (forall ((x Entity)) (=> (Impus x) (Dumpus x))))

; Dumpuses are not nervous.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Nervous x)))))

; Dumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Dumpus x) (Jompus x))))

; Max is a vumpus.
(assert (Vumpus Max))

;--- Query ---------------------------------------------------------
; Is Max not nervous?
(assert (not (Nervous Max)))

;--- Check ---------------------------------------------------------
(check-sat)
(get-model)