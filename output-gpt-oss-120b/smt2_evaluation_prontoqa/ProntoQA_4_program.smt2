;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations --------------------------------------------
(declare-fun Rompus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)

(declare-fun Impus (Entity) Bool)

(declare-fun Yumpus (Entity) Bool)
(declare-fun Small (Entity) Bool)

(declare-fun Orange (Entity) Bool)

(declare-fun Zumpus (Entity) Bool)
(declare-fun Hot (Entity) Bool)

(declare-fun Numpus (Entity) Bool)
(declare-fun Metallic (Entity) Bool)

(declare-fun Wumpus (Entity) Bool)
(declare-fun Kind (Entity) Bool)

(declare-fun Dumpus (Entity) Bool)
(declare-fun Bright (Entity) Bool)

(declare-fun Jompus (Entity) Bool)

(declare-fun Vumpus (Entity) Bool)
(declare-fun Shy (Entity) Bool)

(declare-fun Tumpus (Entity) Bool)

;--- Constant -----------------------------------------------------------
(declare-const alex Entity)

;--- Knowledge base ------------------------------------------------------
; Rompuses are spicy.
(assert (forall ((x Entity)) (=> (Rompus x) (Spicy x))))

; Every rompus is an impus.
(assert (forall ((x Entity)) (=> (Rompus x) (Impus x))))

; Yumpuses are not small.
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Small x)))))

; Impuses are orange.
(assert (forall ((x Entity)) (=> (Impus x) (Orange x))))

; Impuses are zumpuses.
(assert (forall ((x Entity)) (=> (Impus x) (Zumpus x))))

; Zumpuses are not hot.
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Hot x)))))

; Zumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Zumpus x) (Numpus x))))

; Numpuses are metallic.
(assert (forall ((x Entity)) (=> (Numpus x) (Metallic x))))

; Numpuses are wumpuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))

; Every wumpus is not kind.
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Kind x)))))

; Each wumpus is a dumpus.
(assert (forall ((x Entity)) (=> (Wumpus x) (Dumpus x))))

; Each dumpus is not bright.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Bright x)))))

; Every dumpus is a jompus.
(assert (forall ((x Entity)) (=> (Dumpus x) (Jompus x))))

; Jompuses are small.
(assert (forall ((x Entity)) (=> (Jompus x) (Small x))))

; Jompuses are vumpuses.
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))

; Each vumpus is not shy.
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Shy x)))))

; Every vumpus is a tumpus.
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))

; Fact: Alex is a zumpus.
(assert (Zumpus alex))

;--- Query: "Alex is not small" ----------------------------------------
(assert (not (Small alex)))   ; we ask whether this can hold

;--- Check satisfiability ------------------------------------------------
(check-sat)   ; expected result: unsat (the statement is false)
(get-model)