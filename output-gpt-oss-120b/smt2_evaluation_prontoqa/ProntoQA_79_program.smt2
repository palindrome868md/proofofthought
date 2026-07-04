; -------------------------------------------------
; Sort declaration
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate (unary function) declarations
(declare-fun impus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun rompuse (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun wumpuse (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun zumpus (Entity) Bool)

; -------------------------------------------------
; Constant declaration
(declare-const Stella Entity)

; -------------------------------------------------
; Knowledge base (premises)

; Each impus is earthy.
(assert (forall ((x Entity)) (=> (impus x) (earthy x))))

; Impuses are rompuses.
(assert (forall ((x Entity)) (=> (impus x) (rompuse x))))

; Rompuses are kind.
(assert (forall ((x Entity)) (=> (rompuse x) (kind x))))

; Rompuses are wumpuses.
(assert (forall ((x Entity)) (=> (rompuse x) (wumpuse x))))

; Each wumpus is temperate.
(assert (forall ((x Entity)) (=> (wumpuse x) (temperate x))))

; Each wumpus is a dumpus.
(assert (forall ((x Entity)) (=> (wumpuse x) (dumpus x))))

; Dumpuses are wooden.
(assert (forall ((x Entity)) (=> (dumpus x) (wooden x))))

; Each dumpus is a numpus.
(assert (forall ((x Entity)) (=> (dumpus x) (numpus x))))

; Each numpus is not blue.
(assert (forall ((x Entity)) (=> (numpus x) (not (blue x)))))

; Each numpus is a yumpus.
(assert (forall ((x Entity)) (=> (numpus x) (yumpus x))))

; Each yumpus is large.
(assert (forall ((x Entity)) (=> (yumpus x) (large x))))

; Every yumpus is a vumpus.
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))

; Vumpuses are dull.
(assert (forall ((x Entity)) (=> (vumpus x) (dull x))))

; Tumpuses are blue.  (irrelevant for Stella)
(assert (forall ((x Entity)) (=> (tumpus x) (blue x))))

; Vumpuses are jompuses.
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))

; Each jompus is nervous.
(assert (forall ((x Entity)) (=> (jompus x) (nervous x))))

; Jompuses are zumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))

; Stella is an impus.
(assert (impus Stella))

; -------------------------------------------------
; Test the query: "Stella is blue."
(assert (blue Stella))

; -------------------------------------------------
; Ask Z3 whether the constraints are satisfiable
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; Optional: show a model for the rest of the KB