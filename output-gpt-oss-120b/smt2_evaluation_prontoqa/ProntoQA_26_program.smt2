;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations (unary) ----------------------------------
(declare-fun numpus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun orange   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun shy      (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun sweet    (Entity) Bool)
(declare-fun romp     (Entity) Bool)   ; rompus
(declare-fun amenable (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)

;--- Individual -------------------------------------------------------
(declare-const rex Entity)

;--- Knowledge base ----------------------------------------------------
; Each numpus is fruity.
(assert (forall ((x Entity)) (=> (numpus x) (fruity x))))
; Every numpus is a tumpus.
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))
; Every tumpus is dull.
(assert (forall ((x Entity)) (=> (tumpus x) (dull x))))
; Every tumpus is a jompus.
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))
; Every jompus is not orange.
(assert (forall ((x Entity)) (=> (jompus x) (not (orange x)))))
; Each jompus is an impus.
(assert (forall ((x Entity)) (=> (jompus x) (impus x))))
; Each impus is not shy.
(assert (forall ((x Entity)) (=> (impus x) (not (shy x)))))
; Impuses are wumpuses.
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))
; Wumpuses are sweet.
(assert (forall ((x Entity)) (=> (wumpus x) (sweet x))))
; Wumpuses are rompuses.
(assert (forall ((x Entity)) (=> (wumpus x) (romp x))))
; Every rompus is not amenable.
(assert (forall ((x Entity)) (=> (romp x) (not (amenable x)))))
; Each rompus is a zumpus.
(assert (forall ((x Entity)) (=> (romp x) (zumpus x))))
; Every zumpus is large.
(assert (forall ((x Entity)) (=> (zumpus x) (large x))))
; Zumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (yumpus x))))
; Yumpuses are transparent.
(assert (forall ((x Entity)) (=> (yumpus x) (transparent x))))
; Yumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (yumpus x) (dumpus x))))
; Every vumpus is not large. (not needed for this query)
(assert (forall ((x Entity)) (=> (vumpus x) (not (large x)))))

; Fact: Rex is a jompus.
(assert (jompus rex))

;--- Query: is Rex large? ---------------------------------------------
(assert (large rex))

;--- Check satisfiability ---------------------------------------------
(check-sat)
(get-model)