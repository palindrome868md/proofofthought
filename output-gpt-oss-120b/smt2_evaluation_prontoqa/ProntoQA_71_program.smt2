;--- 1. Declare the (uninterpreted) domain sort
(declare-sort Entity 0)

;--- 2. Declare predicates (unary properties)
(declare-fun rompus   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun cold     (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun mean     (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun floral   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun shy      (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)

;--- 3. Declare the individual Sally
(declare-const sally Entity)

;--- 4. Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (rompus x) (cold x))))
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
(assert (forall ((x Entity)) (=> (numpus x) (not (dull x)))))
(assert (forall ((x Entity)) (=> (impus x) (large x))))
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (mean x))))
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (dumpus x) (floral x))))
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (opaque x))))
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))
(assert (forall ((x Entity)) (=> (jompus x) (dull x))))
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (shy x))))
(assert (forall ((x Entity)) (=> (wumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (wooden x))))
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

;--- 5. Facts about Sally
(assert (impus sally))

;--- 6. Test the statement: "Sally is not dull"
(assert (not (dull sally)))

;--- 7. Check satisfiability (unsat means the statement is false)
(check-sat)
(get-model)