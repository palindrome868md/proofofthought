; Sorts
(declare-sort Creature 0)

; Predicates (unary properties / classifications)
(declare-fun numpus (Creature) Bool)
(declare-fun opaque (Creature) Bool)

(declare-fun wumpus (Creature) Bool)
(declare-fun feisty (Creature) Bool)

(declare-fun tumpus (Creature) Bool)
(declare-fun fruity (Creature) Bool)

(declare-fun dumpus (Creature) Bool)
(declare-fun wooden (Creature) Bool)
(declare-fun yumpus (Creature) Bool)
(declare-fun blue (Creature) Bool)

(declare-fun zumpus (Creature) Bool)
(declare-fun spicy (Creature) Bool)

(declare-fun impus (Creature) Bool)
(declare-fun kind (Creature) Bool)

(declare-fun rompus (Creature) Bool)
(declare-fun dull (Creature) Bool)

(declare-fun vumpus (Creature) Bool)
(declare-fun jompus (Creature) Bool)

; Individuals
(declare-const sam Creature)

; Knowledge base (facts)
(assert (dumpus sam)) ; Sam is a dumpus

; Rules / universal statements
; 1) Each numpus is not opaque
(assert (forall ((c Creature)) (=> (numpus c) (not (opaque c)))))

; 2) Each wumpus is feisty
(assert (forall ((c Creature)) (=> (wumpus c) (feisty c))))

; 3) Wumpuses are tumpuses
(assert (forall ((c Creature)) (=> (wumpus c) (tumpus c))))

; 4) Tumpuses are fruity
(assert (forall ((c Creature)) (=> (tumpus c) (fruity c))))

; 6) Every dumpus is wooden
(assert (forall ((c Creature)) (=> (dumpus c) (wooden c))))

; 7) Each dumpus is a yumpus
(assert (forall ((c Creature)) (=> (dumpus c) (yumpus c))))

; 8) Yumpuses are blue
(assert (forall ((c Creature)) (=> (yumpus c) (blue c))))

; 9) Each yumpus is a zumpus
(assert (forall ((c Creature)) (=> (yumpus c) (zumpus c))))

; 10) Every zumpus is spicy
(assert (forall ((c Creature)) (=> (zumpus c) (spicy c))))

; 11) Zumpuses are impuses
(assert (forall ((c Creature)) (=> (zumpus c) (impus c))))

; 12) Each impus is not kind
(assert (forall ((c Creature)) (=> (impus c) (not (kind c)))))

; 13) Impuses are rompuses
(assert (forall ((c Creature)) (=> (impus c) (rompus c))))

; 14) Every rompus is a dull
(assert (forall ((c Creature)) (=> (rompus c) (dull c))))

; 15) Jompuses are not dull
(assert (forall ((c Creature)) (=> (jompus c) (not (dull c)))))

; 16) Every rompus is a vumpus
(assert (forall ((c Creature)) (=> (rompus c) (vumpus c))))

; Test: Is "Sam is not dull" true? We test by asserting the negation and checking satisfiability.
(assert (not (dull sam)))

; Check satisfiability and produce a model (if sat)
(check-sat)
(get-model)