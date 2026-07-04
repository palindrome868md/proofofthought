;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (unary function) declarations ---------------------------
(declare-fun Dumpuse (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Rompuse (Entity) Bool)
(declare-fun Red (Entity) Bool)
(declare-fun Numpuse (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Kind (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Jompuse (Entity) Bool)

;--- Constant ----------------------------------------------------------------
(declare-const Sam Entity)

;--- Knowledge base (universal rules) ----------------------------------------
(assert (forall ((x Entity)) (=> (Dumpuse x) (Cold x))))
(assert (forall ((x Entity)) (=> (Dumpuse x) (Rompuse x))))
(assert (forall ((x Entity)) (=> (Rompuse x) (Red x))))
(assert (forall ((x Entity)) (=> (Rompuse x) (Numpuse x))))
(assert (forall ((x Entity)) (=> (Numpuse x) (Dull x))))
(assert (forall ((x Entity)) (=> (Numpuse x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Happy x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Kind x)))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Large x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Earthy x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Jompuse x) (not (Earthy x)))))
(assert (forall ((x Entity)) (=> (Impus x) (not (Liquid x)))))
(assert (forall ((x Entity)) (=> (Impus x) (Wumpus x))))

;--- Specific facts -----------------------------------------------------------
(assert (Numpuse Sam))   ; Sam is a numpus

;--- Test the statement "Sam is not earthy" -----------------------------------
(assert (not (Earthy Sam)))   ; the claim we are checking

;--- Check satisfiability -----------------------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)