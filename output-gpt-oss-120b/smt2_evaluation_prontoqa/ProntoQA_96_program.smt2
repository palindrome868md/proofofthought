; -------------------------------------------------
; Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate (unary function) declarations
; -------------------------------------------------
(declare-fun impus (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun luminous (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun orange (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun wumpus (Entity) Bool)

; -------------------------------------------------
; Constant declaration
; -------------------------------------------------
(declare-const fae Entity)

; -------------------------------------------------
; Knowledge base (universal rules)
; -------------------------------------------------
; Each impus is sour.
(assert (forall ((x Entity)) (=> (impus x) (sour x))))

; Each impus is a vumpus.
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))

; Each vumpus is cold.
(assert (forall ((x Entity)) (=> (vumpus x) (cold x))))

; Vumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (zumpus x))))

; Zumpuses are not luminous.
(assert (forall ((x Entity)) (=> (zumpus x) (not (luminous x)))))

; Zumpuses are numpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (numpus x))))

; Every numpus is earthy.
(assert (forall ((x Entity)) (=> (numpus x) (earthy x))))

; Every numpus is a yumpus.
(assert (forall ((x Entity)) (=> (numpus x) (yumpus x))))

; Yumpuses are not mean.
(assert (forall ((x Entity)) (=> (yumpus x) (not (mean x)))))

; Each tumpus is bright.
(assert (forall ((x Entity)) (=> (tumpus x) (bright x))))

; Each yumpus is a rompus.
(assert (forall ((x Entity)) (=> (yumpus x) (rompus x))))

; Each rompus is orange.
(assert (forall ((x Entity)) (=> (rompus x) (orange x))))

; Every rompus is a dumpus.
(assert (forall ((x Entity)) (=> (rompus x) (dumpus x))))

; Dumpuses are not bright.
(assert (forall ((x Entity)) (=> (dumpus x) (not (bright x)))))

; Dumpuses are jompuses.
(assert (forall ((x Entity)) (=> (dumpus x) (jompus x))))

; Every jompus is small.
(assert (forall ((x Entity)) (=> (jompus x) (small x))))

; Jompuses are wumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))

; -------------------------------------------------
; Facts about specific individuals
; -------------------------------------------------
; Fae is a zumpus.
(assert (zumpus fae))

; -------------------------------------------------
; Query: Is Fae bright?
; -------------------------------------------------
(assert (bright fae))

; -------------------------------------------------
; Check satisfiability (sat = true, unsat = false)
; -------------------------------------------------
(check-sat)
(get-model)