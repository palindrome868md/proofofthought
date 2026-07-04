;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Constant ---------------------------------------------------------
(declare-const wren Entity)

;--- Predicate (unary) declarations ------------------------------------
(declare-fun tumpus (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun aggressive (Entity) Bool)
(declare-fun wumpus (Entity) Bool)

;--- Knowledge base ---------------------------------------------------
(assert (forall ((x Entity)) (=> (tumpus x) (not (blue x)))))
(assert (forall ((x Entity)) (=> (tumpus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (not (transparent x)))))
(assert (forall ((x Entity)) (=> (vumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (not (fruity x)))))
(assert (forall ((x Entity)) (=> (rompus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (nervous x)))))
(assert (forall ((x Entity)) (=> (dumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (not (liquid x)))))
(assert (forall ((x Entity)) (=> (yumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (cold x)))))
(assert (forall ((x Entity)) (=> (zumpus x) (cold x))))
(assert (forall ((x Entity)) (=> (jompus x) (numpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (large x))))
(assert (forall ((x Entity)) (=> (numpus x) (impus x))))
(assert (forall ((x Entity)) (=> (impus x) (aggressive x))))
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))

;--- Fact about Wren --------------------------------------------------
(assert (vumpus wren))

;--- Test the statement "Wren is not cold" ---------------------------
(assert (not (cold wren)))

;--- Query ------------------------------------------------------------
(check-sat)
(get-model)