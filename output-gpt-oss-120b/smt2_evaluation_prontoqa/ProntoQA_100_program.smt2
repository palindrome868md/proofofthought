;--- 1. Declare the universal sort for all individuals
(declare-sort Entity 0)

;--- 2. Declare unary predicates (properties / classes)
(declare-fun Vumpus      (Entity) Bool)
(declare-fun Tumpus      (Entity) Bool)
(declare-fun Bright      (Entity) Bool)
(declare-fun Dumpus      (Entity) Bool)
(declare-fun Large       (Entity) Bool)
(declare-fun Numpus      (Entity) Bool)
(declare-fun Metallic    (Entity) Bool)
(declare-fun Jompus      (Entity) Bool)
(declare-fun Angry       (Entity) Bool)
(declare-fun Wumpus      (Entity) Bool)
(declare-fun Shy         (Entity) Bool)
(declare-fun Rompuse     (Entity) Bool)
(declare-fun Opaque      (Entity) Bool)
(declare-fun Yumpus      (Entity) Bool)
(declare-fun Blue        (Entity) Bool)
(declare-fun Impus       (Entity) Bool)
(declare-fun Zumpus      (Entity) Bool)

;--- 3. Knowledge base (rules)

; Vumpuses → Tumpuses
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))

; Tumpuses are bright
(assert (forall ((x Entity)) (=> (Tumpus x) (Bright x))))

; Each Tumpus is a Dumpus
(assert (forall ((x Entity)) (=> (Tumpus x) (Dumpus x))))

; Each Dumpus is not large
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Large x)))))

; Dumpuses are Numpuses
(assert (forall ((x Entity)) (=> (Dumpus x) (Numpus x))))

; Numpuses are metallic
(assert (forall ((x Entity)) (=> (Numpus x) (Metallic x))))

; Each Numpus is a Jompus
(assert (forall ((x Entity)) (=> (Numpus x) (Jompus x))))

; Every Jompus is not angry
(assert (forall ((x Entity)) (=> (Jompus x) (not (Angry x)))))

; Jompuses are Wumpuses
(assert (forall ((x Entity)) (=> (Jompus x) (Wumpus x))))

; Wumpuses are not shy
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Shy x)))))

; Wumpuses are Rompuses
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompuse x))))

; Rompuses are not opaque
(assert (forall ((x Entity)) (=> (Rompuse x) (not (Opaque x)))))

; Rompuses are Yumpuses
(assert (forall ((x Entity)) (=> (Rompuse x) (Yumpus x))))

; Every Zumpus is not blue
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Blue x)))))

; Yumpuses are blue
(assert (forall ((x Entity)) (=> (Yumpus x) (Blue x))))

; Yumpuses are Impuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Impus x))))

;--- 4. Constants (facts)
(declare-const Alex Entity)
(assert (Numpus Alex))   ; Alex is a numpus (given)

;--- 5. Test the statement: "Alex is blue"
(assert (Blue Alex))

;--- 6. Check satisfiability
(check-sat)
(get-model)