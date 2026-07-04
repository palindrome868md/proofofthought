;--- 1. Declare an uninterpreted sort for all individuals
(declare-sort Obj 0)

;--- 2. Declare predicates (unary Boolean functions) for each class / property
(declare-fun rompuse (Obj) Bool)
(declare-fun earthy (Obj) Bool)
(declare-fun zumpus (Obj) Bool)
(declare-fun bitter (Obj) Bool)
(declare-fun jompus (Obj) Bool)
(declare-fun dull (Obj) Bool)
(declare-fun vumpus (Obj) Bool)
(declare-fun numpus (Obj) Bool)
(declare-fun transparent (Obj) Bool)
(declare-fun kind (Obj) Bool)
(declare-fun tumpus (Obj) Bool)
(declare-fun temperate (Obj) Bool)
(declare-fun yumpus (Obj) Bool)
(declare-fun happy (Obj) Bool)
(declare-fun dumpus (Obj) Bool)
(declare-fun liquid (Obj) Bool)
(declare-fun wumpus (Obj) Bool)
(declare-fun impus (Obj) Bool)

;--- 3. Declare the individual Sam
(declare-const Sam Obj)

;--- 4. Knowledge base (universal rules and facts)

; Rompuses are not earthy.
(assert (forall ((x Obj)) (=> (rompuse x) (not (earthy x)))))

; Every rompus is a zumpus.
(assert (forall ((x Obj)) (=> (rompuse x) (zumpus x))))

; Zumpuses are not bitter.
(assert (forall ((x Obj)) (=> (zumpus x) (not (bitter x)))))

; Every zumpus is a jompus.
(assert (forall ((x Obj)) (=> (zumpus x) (jompus x))))

; Each jompus is dull.
(assert (forall ((x Obj)) (=> (jompus x) (dull x))))

; Jompuses are vumpuses.
(assert (forall ((x Obj)) (=> (jompus x) (vumpus x))))

; Numpuses are not transparent.
(assert (forall ((x Obj)) (=> (numpus x) (not (transparent x)))))

; Every vumpus is not kind.
(assert (forall ((x Obj)) (=> (vumpus x) (not (kind x)))))

; Vumpuses are tumpuses.
(assert (forall ((x Obj)) (=> (vumpus x) (tumpus x))))

; Tumpuses are temperate.
(assert (forall ((x Obj)) (=> (tumpus x) (temperate x))))

; Every tumpus is a yumpus.
(assert (forall ((x Obj)) (=> (tumpus x) (yumpus x))))

; Yumpuses are happy.
(assert (forall ((x Obj)) (=> (yumpus x) (happy x))))

; Yumpuses are dumpuses.
(assert (forall ((x Obj)) (=> (yumpus x) (dumpus x))))

; Every dumpus is liquid.
(assert (forall ((x Obj)) (=> (dumpus x) (liquid x))))

; Dumpuses are wumpuses.
(assert (forall ((x Obj)) (=> (dumpus x) (wumpus x))))

; Wumpuses are transparent.
(assert (forall ((x Obj)) (=> (wumpus x) (transparent x))))

; Wumpuses are impuses.
(assert (forall ((x Obj)) (=> (wumpus x) (impus x))))

;--- 5. Specific fact: Sam is a vumpus
(assert (vumpus Sam))

;--- 6. Test the statement: "Sam is not transparent"
(assert (not (transparent Sam)))

;--- 7. Check satisfiability (sat = statement could be true, unsat = statement is false)
(check-sat)
(get-model)