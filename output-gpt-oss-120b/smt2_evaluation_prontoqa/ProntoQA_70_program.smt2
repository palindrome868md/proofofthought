; -------------------------------------------------
; Sort declaration
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate declarations (all return Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun earthy   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun rompuse  (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)

; -------------------------------------------------
; Constant representing Rex
(declare-const Rex Entity)

; -------------------------------------------------
; Knowledge base (universal rules)

; Each jompus is earthy.
(assert (forall ((x Entity))
  (=> (jompus x) (earthy x))))

; Jompuses are yumpuses.
(assert (forall ((x Entity))
  (=> (jompus x) (yumpus x))))

; Yumpuses are metallic.
(assert (forall ((x Entity))
  (=> (yumpus x) (metallic x))))

; Each yumpus is an impus.
(assert (forall ((x Entity))
  (=> (yumpus x) (impus x))))

; Each dumpus is not transparent.
(assert (forall ((x Entity))
  (=> (dumpus x) (not (transparent x)))))

; Impuses are nervous.
(assert (forall ((x Entity))
  (=> (impus x) (nervous x))))

; Impuses are rompuses.
(assert (forall ((x Entity))
  (=> (impus x) (rompuse x))))

; Every rompus is small.   (treated as "rompuse")
(assert (forall ((x Entity))
  (=> (rompuse x) (small x))))

; Rompuses are tumpuses.
(assert (forall ((x Entity))
  (=> (rompuse x) (tumpus x))))

; Tumpuses are transparent.
(assert (forall ((x Entity))
  (=> (tumpus x) (transparent x))))

; Tumpuses are vumpuses.
(assert (forall ((x Entity))
  (=> (tumpus x) (vumpus x))))

; -------------------------------------------------
; Specific fact: Rex is a jompus.
(assert (jompus Rex))

; -------------------------------------------------
; Test the statement: "Rex is not transparent."
(assert (not (transparent Rex)))

; -------------------------------------------------
; Check satisfiability – we expect UNSAT (statement false)
(check-sat)
(get-model)