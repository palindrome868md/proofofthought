;--- 1. Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicate (unary function) declarations ---------------------------
(declare-fun numpus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun impuse   (Entity) Bool)
(declare-fun cold     (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun floral   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun luminous (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun blue     (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun happy    (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun sour     (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)

;--- 3. Constant declaration -----------------------------------------------
(declare-const sally Entity)

;--- 4. Knowledge base (facts + universal rules) ---------------------------
; Each numpus is large.
(assert (forall ((x Entity)) (=> (numpus x) (large x))))

; Numpuses are impuses.
(assert (forall ((x Entity)) (=> (numpus x) (impuse x))))

; Impuses are not cold.
(assert (forall ((x Entity)) (=> (impuse x) (not (cold x)))))

; Impuses are dumpuses.
(assert (forall ((x Entity)) (=> (impuse x) (dumpus x))))

; Every dumpus is not floral.
(assert (forall ((x Entity)) (=> (dumpus x) (not (floral x)))))

; Dumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (dumpus x) (vumpus x))))

; Every vumpus is not luminous.
(assert (forall ((x Entity)) (=> (vumpus x) (not (luminous x)))))

; Every vumpus is a yumpus.
(assert (forall ((x Entity)) (=> (vumpus x) (yumpus x))))

; Each rompus is not blue.
(assert (forall ((x Entity)) (=> (rompus x) (not (blue x)))))

; Yumpuses are blue.
(assert (forall ((x Entity)) (=> (yumpus x) (blue x))))

; Yumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (yumpus x) (tumpus x))))

; Every tumpus is happy.
(assert (forall ((x Entity)) (=> (tumpus x) (happy x))))

; Each tumpus is a zumpus.
(assert (forall ((x Entity)) (=> (tumpus x) (zumpus x))))

; Zumpuses are sour.
(assert (forall ((x Entity)) (=> (zumpus x) (sour x))))

; Each zumpus is a wumpus.
(assert (forall ((x Entity)) (=> (zumpus x) (wumpus x))))

; Wumpuses are bright.
(assert (forall ((x Entity)) (=> (wumpus x) (bright x))))

; Each wumpus is a jompus.
(assert (forall ((x Entity)) (=> (wumpus x) (jompus x))))

; Sally is a numpus.
(assert (numpus sally))

;--- 5. Test the statement: "Sally is blue" --------------------------------
(assert (blue sally))

;--- 6. Check satisfiability ------------------------------------------------
(check-sat)
(get-model)