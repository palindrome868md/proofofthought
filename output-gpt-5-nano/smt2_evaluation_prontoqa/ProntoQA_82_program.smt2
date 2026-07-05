; Declare sorts
(declare-sort Entity 0)

; Declare predicates (unary predicates representing each class / property)
(declare-fun impuse (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun fruity (Entity) Bool)

; Declare constants
(declare-const rex Entity)

; Knowledge base (facts and rules)

; 1) Impuses are mean. Each impus is a yumpus.
(assert (forall ((x Entity)) (=> (impuse x) (yumpus x))))

; 2) Yumpuses are blue.
(assert (forall ((x Entity)) (=> (yumpus x) (blue x))))

; 3) Yumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (yumpus x) (wumpus x))))

; 4) Wumpuses are hot.
(assert (forall ((x Entity)) (=> (wumpus x) (hot x))))

; 5) Every wumpus is a numpus.
(assert (forall ((x Entity)) (=> (wumpus x) (numpus x))))

; 6) Jompuses are happy.
(assert (forall ((x Entity)) (=> (jompus x) (happy x))))

; 7) Numpuses are fruity.
(assert (forall ((x Entity)) (=> (numpus x) (fruity x))))

; 8) Numpuses are dumpuses.
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))

; 9) Every dumpus is not dull.
(assert (forall ((x Entity)) (=> (dumpus x) (not (dull x)))))

; 10) Every dumpus is a tumpus.
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))

; 11) Tumpuses are not happy.
(assert (forall ((x Entity) ())) ; placeholder to ensure syntax alignment
  (=> (tumpus x) (not (happy x))))

; 12) Every tumpus is a vumpus.
(assert (forall ((x Entity) ())) ; placeholder
  (=> (tumpus x) (vumpus x)))

; 13) Vumpuses are not opaque.
(assert (forall ((x Entity) ()))
  (=> (vumpus x) (not (opaque x))))

; 14) Every vumpus is a rompus.
(assert (forall ((x Entity) ()))
  (=> (vumpus x) (rompus x)))

; 15) Rompuses are metallic.
(assert (forall ((x Entity) ()))
  (=> (rompus x) (metallic x))))

; 16) Each rompus is a zumpus.
(assert (forall ((x Entity) ()))
  (=> (rompus x) (zumpus x))))

; 17) Rex is a yumpus.
(assert (yumpus rex))

; Test: Is "Rex is not happy" true?
(assert (not (happy rex)))

; Check satisfiability and provide a model
(check-sat)
(get-model)