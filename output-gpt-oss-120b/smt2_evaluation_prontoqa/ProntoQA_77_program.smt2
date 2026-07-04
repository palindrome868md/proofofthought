;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations -------------------------------------------
(declare-fun jompus   (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun kind     (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun bitter   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun numpUS   (Entity) Bool) ; Vumpuses are numpuses
(declare-fun tumpus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)

;--- Constant ---------------------------------------------------------
(declare-const Sam Entity)

;--- Knowledge base ----------------------------------------------------
; Jompuses are dull.
(assert (forall ((x Entity)) (=> (jompus x) (dull x))))

; Each jompus is a rompus.
(assert (forall ((x Entity)) (=> (jompus x) (rompus x))))

; Each rompus is nervous.
(assert (forall ((x Entity)) (=> (rompus x) (nervous x))))

; Rompuses are dumpuses.
(assert (forall ((x Entity)) (=> (rompus x) (dumpus x))))

; Every dumpus is kind.
(assert (forall ((x Entity)) (=> (dumpus x) (kind x))))

; Dumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (wumpus x))))

; Tumpuses are not opaque.
(assert (forall ((x Entity)) (=> (tumpus x) (not (opaque x)))))

; Each wumpus is bitter.
(assert (forall ((x Entity)) (=> (wumpus x) (bitter x))))

; Each wumpus is a zumpus.
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))

; Every zumpus is fruity.
(assert (forall ((x Entity)) (=> (zumpus x) (fruity x))))

; Zumpuses are impuses.
(assert (forall ((x Entity)) (=> (zumpus x) (impus x))))

; Impuses are wooden.
(assert (forall ((x Entity)) (=> (impus x) (wooden x))))

; Each impus is a yumpus.
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))

; Every yumpus is opaque.
(assert (forall ((x Entity)) (=> (yumpus x) (opaque x))))

; Every yumpus is a vumpus.
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))

; Every vumpus is small.
(assert (forall ((x Entity)) (=> (vumpus x) (small x))))

; Vumpuses are numpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (numpUS x))))

; Sam is a dumpus.
(assert (dumpus Sam))

;--- Query: "Sam is not opaque" ---------------------------------------
(assert (not (opaque Sam)))   ; the statement we are testing

;--- Check satisfiability ---------------------------------------------
(check-sat)   ; expected result: unsat (the statement is false)
(get-model)