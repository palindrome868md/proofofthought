; Sorts
(declare-sort Entity 0)

; Constants
(declare-const Max Entity)

; Predicates (unary)'
(declare-fun jompus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun impuse (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun feisty (Entity) Bool)

; Knowledge base

; Max is a jompus
(assert (jompus Max))

; Every jompus is liquid
(assert (forall ((x Entity)) (=> (jompus x) (liquid x))))

; Jompuses are rompuses
(assert (forall ((x Entity)) (=> (jompus x) (rompus x))))

; Every rompus is mean
(assert (forall ((x Entity)) (=> (rompus x) (mean x))))

; Rompuses are zumpuses
(assert (forall ((x Entity)) (=> (rompus x) (zumpus x))))

; Each zumpus is transparent
(assert (forall ((x Entity)) (=> (zumpus x) (transparent x))))

; Zumpuses are tumpuses
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))

; Tumpuses are not earthy
(assert (forall ((x Entity)) (=> (tumpus x) (not (earthy x)))))

; Each dumpus is bright
(assert (forall ((x Entity)) (=> (dumpus x) (bright x))))

; Tumpuses are yumpuses
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

; Yumpuses are not bright
(assert (forall ((x Entity)) (=> (yumpus x) (not (bright x)))))

; Yumpuses are impuses
(assert (forall ((x Entity)) (=> (yumpus x) (impuse x))))

; Impuses are temperate
(assert (forall ((x Entity)) (=> (impuse x) (temperate x))))

; Impuses are numpuses
(assert (forall ((x Entity)) (=> (impuse x) (numpus x))))

; Every numpus is feisty
(assert (forall ((x Entity)) (=> (numpus x) (feisty x))))

; Numpuses are wumpuses
(assert (forall ((x Entity)) (=> (numpus x) (wumpus x))))

; Optional explicit chain to reinforce reasoning (helps instantiation)
(assert (rompus Max))
(assert (zumpus Max))
(assert (tumpus Max))
(assert (yumpus Max))

; Test: Is "Max is bright" true given the knowledge base?
(assert (bright Max))
(check-sat)