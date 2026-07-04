;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations -------------------------------------------
(declare-fun tumpus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)

(declare-fun yumpus   (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun numpus   (Entity) Bool)

(declare-fun large    (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun red      (Entity) Bool)

(declare-fun vumpus   (Entity) Bool)
(declare-fun temperate(Entity) Bool)

(declare-fun jompus   (Entity) Bool)
(declare-fun spicy    (Entity) Bool)

(declare-fun impus    (Entity) Bool)
(declare-fun metallic (Entity) Bool)

(declare-fun wumpus   (Entity) Bool)
(declare-fun bright   (Entity) Bool)

(declare-fun zumpus   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)

;--- Constant (the individual) ----------------------------------------
(declare-const Sam Entity)

;--- Knowledge base ----------------------------------------------------
; Tumpuses are fruity.
(assert (forall ((x Entity))
        (=> (tumpus x) (fruity x))))

; Yumpuses are nervous.
(assert (forall ((x Entity))
        (=> (yumpus x) (nervous x))))

; Yumpuses are numpuses.
(assert (forall ((x Entity))
        (=> (yumpus x) (numpus x))))

; Each numpus is large.
(assert (forall ((x Entity))
        (=> (numpus x) (large x))))

; Each numpus is a rompus.
(assert (forall ((x Entity))
        (=> (numpus x) (rompus x))))

; Each rompus is red.
(assert (forall ((x Entity))
        (=> (rompus x) (red x))))

; Rompuses are vumpuses.
(assert (forall ((x Entity))
        (=> (rompus x) (vumpus x))))

; Vumpuses are temperate.
(assert (forall ((x Entity))
        (=> (vumpus x) (temperate x))))

; Each vumpus is a jompus.
(assert (forall ((x Entity))
        (=> (vumpus x) (jompus x))))

; Every jompus is spicy.
(assert (forall ((x Entity))
        (=> (jompus x) (spicy x))))

; Each jompus is an impus.
(assert (forall ((x Entity))
        (=> (jompus x) (impus x))))

; Impuses are not metallic.
(assert (forall ((x Entity))
        (=> (impus x) (not (metallic x)))))

; Impuses are wumpuses.
(assert (forall ((x Entity))
        (=> (impus x) (wumpus x))))

; Each wumpus is bright.
(assert (forall ((x Entity))
        (=> (wumpus x) (bright x))))

; Wumpuses are zumpuses.
(assert (forall ((x Entity))
        (=> (wumpus x) (zumpus x))))

; Zumpuses are not fruity.
(assert (forall ((x Entity))
        (=> (zumpus x) (not (fruity x)))))

; Each zumpus is a dumpus.
(assert (forall ((x Entity))
        (=> (zumpus x) (dumpus x))))

; Sam is a vumpus.
(assert (vumpus Sam))

;--- Test the statement: "Sam is not fruity." -------------------------
(assert (not (fruity Sam)))   ; i.e., Sam is not fruity

;--- Verify ------------------------------------------------------------
(check-sat)      ; Expected: sat  (the statement is logically true)
(get-model)