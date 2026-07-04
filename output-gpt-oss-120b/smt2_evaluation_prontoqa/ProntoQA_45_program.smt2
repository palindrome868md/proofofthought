;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun Dumpus  (Entity) Bool)
(declare-fun Cold    (Entity) Bool)
(declare-fun Numpus  (Entity) Bool)
(declare-fun Bitter  (Entity) Bool)
(declare-fun Zumpus  (Entity) Bool)
(declare-fun Fruity  (Entity) Bool)
(declare-fun Wumpus  (Entity) Bool)
(declare-fun Large   (Entity) Bool)
(declare-fun Tumpus  (Entity) Bool)
(declare-fun Wooden  (Entity) Bool)
(declare-fun Impus   (Entity) Bool)
(declare-fun Rompuse (Entity) Bool)

;--- Constant ----------------------------------------------------------
(declare-const Fae Entity)

;--- Knowledge base ----------------------------------------------------
; Dumpuses are cold.
(assert (forall ((x Entity)) (=> (Dumpus x) (Cold x))))
; Dumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Dumpus x) (Numpus x))))
; Each numpus is not bitter.
(assert (forall ((x Entity)) (=> (Numpus x) (not (Bitter x)))))
; Every numpus is a zumpus.
(assert (forall ((x Entity)) (=> (Numpus x) (Zumpus x))))
; Zumpuses are fruity.
(assert (forall ((x Entity)) (=> (Zumpus x) (Fruity x))))
; Zumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (Zumpus x) (Wumpus x))))
; Wumpuses are large.
(assert (forall ((x Entity)) (=> (Wumpus x) (Large x))))
; Each tumpus is not wooden.
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Wooden x)))))
; Each wumpus is an impus.
(assert (forall ((x Entity)) (=> (Wumpus x) (Impus x))))
; Every impus is wooden.
(assert (forall ((x Entity)) (=> (Impus x) (Wooden x))))
; Impuses are rompuses.
(assert (forall ((x Entity)) (=> (Impus x) (Rompuse x))))

; Fae is a dumpus.
(assert (Dumpus Fae))

;--- Test the statement ------------------------------------------------
; Is Fae wooden?
(assert (Wooden Fae))

;--- Check satisfiability -----------------------------------------------
(check-sat)   ; expected: sat (the statement is true)
(get-model)