;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (unary function) declarations ---------------------------
(declare-fun Rompus (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Brown (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Sweet (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)

;--- Constant ---------------------------------------------------------
(declare-const Max Entity)

;--- Knowledge base (facts & rules) ------------------------------------
; Facts
(assert (Rompus Max))

; Rules
(assert (forall ((x Entity)) (=> (Rompus x) (Amenable x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Numpus x))))

(assert (forall ((x Entity)) (=> (Numpus x) (Brown x))))
(assert (forall ((x Entity)) (=> (Numpus x) (Zumpus x))))

(assert (forall ((x Entity)) (=> (Zumpus x) (Bright x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Dumpus x))))

(assert (forall ((x Entity)) (=> (Vumpus x) (Nervous x))))

(assert (forall ((x Entity)) (=> (Dumpus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Nervous x))))) ; every yumpus is not nervous
(assert (forall ((x Entity)) (=> (Yumpus x) (Jompus x))))

(assert (forall ((x Entity)) (=> (Jompus x) (not (Liquid x)))))
(assert (forall ((x Entity)) (=> (Jompus x) (Impus x))))

(assert (forall ((x Entity)) (=> (Impus x) (not (Small x)))))
(assert (forall ((x Entity)) (=> (Impus x) (Tumpus x))))

(assert (forall ((x Entity)) (=> (Tumpus x) (not (Transparent x)))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Wumpus x))))

(assert (forall ((x Entity)) (=> (Dumpus x) (Sweet x))))

;--- Test the statement: "Max is not nervous" -------------------------
(assert (not (Nervous Max)))

;--- Check satisfiability ---------------------------------------------
(check-sat)
(get-model)