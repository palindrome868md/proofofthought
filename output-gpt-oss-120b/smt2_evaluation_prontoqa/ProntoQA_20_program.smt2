;--- Sort declaration -------------------------------------------------
(declare-sort Obj 0)

;--- Predicate declarations (uninterpreted functions returning Bool) ---
(declare-fun yumpus   (Obj) Bool)
(declare-fun small    (Obj) Bool)
(declare-fun dumpus   (Obj) Bool)
(declare-fun opaque   (Obj) Bool)
(declare-fun jompus   (Obj) Bool)
(declare-fun shy      (Obj) Bool)
(declare-fun numpus   (Obj) Bool)
(declare-fun sour     (Obj) Bool)
(declare-fun tumpus   (Obj) Bool)
(declare-fun brown    (Obj) Bool)
(declare-fun vumpus   (Obj) Bool)
(declare-fun dull     (Obj) Bool)
(declare-fun wumpus   (Obj) Bool)
(declare-fun rompus   (Obj) Bool)
(declare-fun luminous (Obj) Bool)
(declare-fun rompuses (Obj) Bool)
(declare-fun impus    (Obj) Bool)

;--- Constant ---------------------------------------------------------
(declare-const stella Obj)

;--- Knowledge base ----------------------------------------------------
; Each yumpus is not small.
(assert (forall ((x Obj)) (=> (yumpus x) (not (small x)))))

; Each yumpus is a dumpus.
(assert (forall ((x Obj)) (=> (yumpus x) (dumpus x))))

; Each dumpus is opaque.
(assert (forall ((x Obj)) (=> (dumpus x) (opaque x))))

; Every dumpus is a jompus.
(assert (forall ((x Obj)) (=> (dumpus x) (jompus x))))

; Each jompus is shy.
(assert (forall ((x Obj)) (=> (jompus x) (shy x))))

; Each numpus is sour.
(assert (forall ((x Obj)) (=> (numpus x) (sour x))))

; Every jompus is a tumpus.
(assert (forall ((x Obj)) (=> (jompus x) (tumpus x))))

; Each tumpus is brown.
(assert (forall ((x Obj)) (=> (tumpus x) (brown x))))

; Each tumpus is a vumpus.
(assert (forall ((x Obj)) (=> (tumpus x) (vumpus x))))

; Vumpuses are dull.
(assert (forall ((x Obj)) (=> (vumpus x) (dull x))))

; Vumpuses are wumpuses.
(assert (forall ((x Obj)) (=> (vumpus x) (wumpus x))))

; Every wumpus is not sour.
(assert (forall ((x Obj)) (=> (wumpus x) (not (sour x)))))

; Wumpuses are rompuses.
(assert (forall ((x Obj)) (=> (wumpus x) (rompuses x))))

; Each rompus is not luminous.
(assert (forall ((x Obj)) (=> (rompus x) (not (luminous x)))))

; Rompuses are impuses.
(assert (forall ((x Obj)) (=> (rompuses x) (impus x))))

; Stella is a dumpus.
(assert (dumpus stella))

;--- Test the statement: "Stella is sour." ----------------------------
(assert (sour stella))

;--- Check satisfiability ---------------------------------------------
(check-sat)
(get-model)