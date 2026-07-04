; -------------------------------------------------
; Sort declaration
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate (unary function) declarations
(declare-fun zumpus      (Entity) Bool)
(declare-fun nervous     (Entity) Bool)
(declare-fun dumpus      (Entity) Bool)
(declare-fun sweet       (Entity) Bool)
(declare-fun vumpus      (Entity) Bool)
(declare-fun brown       (Entity) Bool)
(declare-fun rompuse     (Entity) Bool)
(declare-fun kind        (Entity) Bool)
(declare-fun yumpus      (Entity) Bool)
(declare-fun large       (Entity) Bool)
(declare-fun tumpus      (Entity) Bool)
(declare-fun fruity      (Entity) Bool)
(declare-fun wumpus      (Entity) Bool)
(declare-fun impus       (Entity) Bool)
(declare-fun metallic    (Entity) Bool)
(declare-fun numpus      (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun jompus      (Entity) Bool)

; -------------------------------------------------
; Constant declaration
(declare-const Max Entity)

; -------------------------------------------------
; Knowledge base

; Each zumpus is not nervous.
(assert (forall ((x Entity))
  (=> (zumpus x) (not (nervous x)))))

; Zumpuses are dumpuses.
(assert (forall ((x Entity))
  (=> (zumpus x) (dumpus x))))

; Every dumpus is sweet.
(assert (forall ((x Entity))
  (=> (dumpus x) (sweet x))))

; Each dumpus is a vumpus.
(assert (forall ((x Entity))
  (=> (dumpus x) (vumpus x))))

; Each vumpus is not brown.
(assert (forall ((x Entity))
  (=> (vumpus x) (not (brown x)))))

; Vumpuses are rompuses.
(assert (forall ((x Entity))
  (=> (vumpus x) (rompuse x))))

; Rompuses are kind.
(assert (forall ((x Entity))
  (=> (rompuse x) (kind x))))

; Rompuses are yumpuses.
(assert (forall ((x Entity))
  (=> (rompuse x) (yumpus x))))

; Every yumpus is large.
(assert (forall ((x Entity))
  (=> (yumpus x) (large x))))

; Each yumpus is a tumpus.
(assert (forall ((x Entity))
  (=> (yumpus x) (tumpus x))))

; Tumpuses are fruity.
(assert (forall ((x Entity))
  (=> (tumpus x) (fruity x))))

; Each tumpus is a wumpus.
(assert (forall ((x Entity))
  (=> (tumpus x) (wumpus x))))

; Every impus is metallic.
(assert (forall ((x Entity))
  (=> (impus x) (metallic x))))

; Wumpuses are not metallic.
(assert (forall ((x Entity))
  (=> (wumpus x) (not (metallic x)))))

; Every wumpus is a numpus.
(assert (forall ((x Entity))
  (=> (wumpus x) (numpus x))))

; Numpuses are not transparent.
(assert (forall ((x Entity))
  (=> (numpus x) (not (transparent x)))))

; Every numpus is a jompus.
(assert (forall ((x Entity))
  (=> (numpus x) (jompus x))))

; Max is a vumpus.
(assert (vumpus Max))

; -------------------------------------------------
; Question to verify: "Max is metallic."
; We assert this claim and ask Z3 whether it can be satisfied.
(assert (metallic Max))

; -------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; Optional: show a model for the rest of the KB