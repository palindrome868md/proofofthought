;--- Sort declaration -------------------------------------------------
(declare-sort Obj 0)

;--- Predicate (unary) declarations ------------------------------------
(declare-fun tumpus (Obj) Bool)
(declare-fun large (Obj) Bool)
(declare-fun rompus (Obj) Bool)
(declare-fun transparent (Obj) Bool)
(declare-fun zumpus (Obj) Bool)
(declare-fun sweet (Obj) Bool)
(declare-fun vumpus (Obj) Bool)
(declare-fun brown (Obj) Bool)
(declare-fun yumpus (Obj) Bool)
(declare-fun aggressive (Obj) Bool)
(declare-fun numpus (Obj) Bool)
(declare-fun dull (Obj) Bool)
(declare-fun impus (Obj) Bool)
(declare-fun metallic (Obj) Bool)
(declare-fun jompus (Obj) Bool)
(declare-fun cold (Obj) Bool)
(declare-fun wumpus (Obj) Bool)
(declare-fun dumpus (Obj) Bool)

;--- Constant declaration ---------------------------------------------
(declare-const polly Obj)

;--- Knowledge base ----------------------------------------------------
; Tumpuses are large.
(assert (forall ((x Obj)) (=> (tumpus x) (large x))))
; Every tumpus is a rompus.
(assert (forall ((x Obj)) (=> (tumpus x) (rompus x))))
; Rompuses are not transparent.
(assert (forall ((x Obj)) (=> (rompus x) (not (transparent x)))))
; Each rompus is a zumpus.
(assert (forall ((x Obj)) (=> (rompus x) (zumpus x))))
; Every zumpus is sweet.
(assert (forall ((x Obj)) (=> (zumpus x) (sweet x))))
; Each zumpus is a vumpus.
(assert (forall ((x Obj)) (=> (zumpus x) (vumpus x))))
; Every vumpus is brown.
(assert (forall ((x Obj)) (=> (vumpus x) (brown x))))
; Vumpuses are yumpuses.
(assert (forall ((x Obj)) (=> (vumpus x) (yumpus x))))
; Yumpuses are not aggressive.
(assert (forall ((x Obj)) (=> (yumpus x) (not (aggressive x)))))
; Yumpuses are numpuses.
(assert (forall ((x Obj)) (=> (yumpus x) (numpus x))))
; Numpuses are dull.
(assert (forall ((x Obj)) (=> (numpus x) (dull x))))
; Each numpus is an impus.
(assert (forall ((x Obj)) (=> (numpus x) (impus x))))
; Impuses are not metallic.
(assert (forall ((x Obj)) (=> (impus x) (not (metallic x)))))
; Each impus is a jompus.
(assert (forall ((x Obj)) (=> (impus x) (jompus x))))
; Every dumpus is not dull.
(assert (forall ((x Obj)) (=> (dumpus x) (not (dull x)))))
; Jompuses are not cold.
(assert (forall ((x Obj)) (=> (jompus x) (not (cold x)))))
; Jompuses are wumpuses.
(assert (forall ((x Obj)) (=> (jompus x) (wumpus x))))

; Polly is a rompus.
(assert (rompus polly))

;--- Query: "Polly is not dull" ----------------------------------------
(assert (not (dull polly)))

;--- Check the result --------------------------------------------------
(check-sat)
(get-model)