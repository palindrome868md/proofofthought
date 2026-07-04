;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Entity 0)

; Unary predicates (properties)
(declare-fun impus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun numpuse (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun sweet (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun rompuse (Entity) Bool)

; The individual mentioned in the query
(declare-const Sam Entity)

;-------------------------------------------------
;  Knowledge base (universal rules and facts)
;-------------------------------------------------
; Impuses are not large.
(assert (forall ((x Entity)) (=> (impus x) (not (large x)))))

; Each impus is a yumpus.
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))

; Yumpuses are floral.
(assert (forall ((x Entity)) (=> (yumpus x) (floral x))))

; Yumpuses are jompuses.
(assert (forall ((x Entity)) (=> (yumpus x) (jompus x))))

; Jompuses are not transparent.
(assert (forall ((x Entity)) (=> (jompus x) (not (transparent x)))))

; Each jompus is a wumpus.
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))

; Every wumpus is nervous.
(assert (forall ((x Entity)) (=> (wumpus x) (nervous x))))

; Wumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (vumpus x))))

; Rompuses are not sweet.
(assert (forall ((x Entity)) (=> (rompuse x) (not (sweet x)))))

; Each vumpus is hot.
(assert (forall ((x Entity)) (=> (vumpus x) (hot x))))

; Vumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))

; Every tumpus is mean.
(assert (forall ((x Entity)) (=> (tumpus x) (mean x))))

; Tumpuses are numpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (numpuse x))))

; Numpuses are dull.
(assert (forall ((x Entity)) (=> (numpuse x) (dull x))))

; Numpuses are zumpuses.
(assert (forall ((x Entity)) (=> (numpuse x) (zumpus x))))

; Zumpuses are sweet.
(assert (forall ((x Entity)) (=> (zumpus x) (sweet x))))

; Zumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (dumpus x))))

; Fact: Sam is a wumpus.
(assert (wumpus Sam))

;-------------------------------------------------
;  Test the statement: "Sam is not sweet."
;-------------------------------------------------
(assert (not (sweet Sam)))

;-------------------------------------------------
;  Check consistency
;-------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; Model is optional; will be absent because the query is unsat