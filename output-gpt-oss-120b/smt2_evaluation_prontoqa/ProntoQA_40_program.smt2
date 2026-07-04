;--- 1. Declare the uninterpreted sort for all individuals
(declare-sort Entity 0)

;--- 2. Declare predicates (unary functions returning Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun red      (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun bitter   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun temperate(Entity) Bool)
(declare-fun rompuse  (Entity) Bool)
(declare-fun floral   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)

;--- 3. Declare the constant representing Sally
(declare-const sally Entity)

;--- 4. Knowledge base (facts and universal rules)

; Yumpuses are small (irrelevant for the query, omitted)
; Yumpuses are vumpuses
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))

; Vumpuses are red
(assert (forall ((x Entity)) (=> (vumpus x) (red x))))

; Vumpuses are numpuses
(assert (forall ((x Entity)) (=> (vumpus x) (numpus x))))

; Numpuses are bitter
(assert (forall ((x Entity)) (=> (numpus x) (bitter x))))

; Each numpus is a wumpus
(assert (forall ((x Entity)) (=> (numpus x) (wumpus x))))

; Each impus is not amenable
(assert (forall ((x Entity)) (=> (impus x) (not (amenable x)))))

; Every wumpus is bright
(assert (forall ((x Entity)) (=> (wumpus x) (bright x))))

; Every wumpus is a dumpus
(assert (forall ((x Entity)) (=> (wumpus x) (dumpus x))))

; Every dumpus is temperate
(assert (forall ((x Entity)) (=> (dumpus x) (temperate x))))

; Dumpuses are rompuses
(assert (forall ((x Entity)) (=> (dumpus x) (rompuse x))))

; Rompuses are floral
(assert (forall ((x Entity)) (=> (rompuse x) (floral x))))

; Rompuses are tumpuses
(assert (forall ((x Entity)) (=> (rompuse x) (tumpus x))))

; Tumpuses are opaque
(assert (forall ((x Entity)) (=> (tumpus x) (opaque x))))

; Each tumpus is a jompus
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))

; Every jompus is amenable
(assert (forall ((x Entity)) (=> (jompus x) (amenable x))))

; Every jompus is a zumpus (irrelevant for the query)
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))

; Sally is a wumpus (the only fact about Sally)
(assert (wumpus sally))

;--- 5. Test the statement: "Sally is amenable."
(assert (amenable sally))

;--- 6. Check satisfiability (sat = statement true)
(check-sat)
(get-model)