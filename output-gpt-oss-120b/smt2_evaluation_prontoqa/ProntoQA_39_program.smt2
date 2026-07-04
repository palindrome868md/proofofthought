;--- 1. Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicate (uninterpreted function) declarations -------------------
(declare-fun rompus   (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun happy    (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun sour     (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun liquid   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun hot      (Entity) Bool)

;--- 3. Constant for the individual mentioned in the problem -------------
(declare-const Stella Entity)

;--- 4. Knowledge base (the universal statements) -------------------------
; Each rompus is amenable.
(assert (forall ((x Entity)) (=> (rompus x) (amenable x))))

; Each rompus is an impus.
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))

; Impuses are happy.
(assert (forall ((x Entity)) (=> (impus x) (happy x))))

; Every impus is a wumpus.
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))

; Wumpuses are sour.
(assert (forall ((x Entity)) (=> (wumpus x) (sour x))))

; Each wumpus is a zumpus.
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))

; Zumpuses are fruity.   (property not needed for the query, omitted)

; Zumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))

; Each tumpus is not large.
(assert (forall ((x Entity)) (=> (tumpus x) (not (large x)))))

; Every tumpus is a vumpus.
(assert (forall ((x Entity)) (=> (tumpus x) (vumpus x))))

; Yumpuses are not hot.
(assert (forall ((x Entity)) (=> (yumpus x) (not (hot x)))))

; Every vumpus is liquid.
(assert (forall ((x Entity)) (=> (vumpus x) (liquid x))))

; Every vumpus is a jompus.
(assert (forall ((x Entity)) (=> (vumpus x) (jompus x))))

; Jompuses are hot.
(assert (forall ((x Entity)) (=> (jompus x) (hot x))))

; Jompuses are dumpuses. (property not needed for the query, omitted)

;--- 5. Fact about Stella --------------------------------------------------
(assert (wumpus Stella))

;--- 6. Test the claim: "Stella is not hot." -----------------------------
(assert (not (hot Stella)))   ; this is the statement we are checking

;--- 7. Check satisfiability -----------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; optional, shows a model if sat (will not be produced here)