; Sorts
(declare-sort Entity 0)

; Constants
(declare-const Sam Entity)

; Predicates (unary predicates for each concept)
(declare-fun impuse (Entity) Bool)
(declare-fun yumpuse (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun jompuse (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun sweet (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun rompuse (Entity) Bool)
(declare-fun large (Entity) Bool)

; Knowledge base (the given rules and facts)

; 1) Impuses are not large
(assert (forall ((x Entity)) (=> (impuse x) (not (large x)))))

; 2) Each impus is a yumpus
(assert (forall ((x Entity)) (=> (impuse x) (yumpuse x))))

; 3) Yumpuses are floral
(assert (forall ((x Entity)) (=> (yumpuse x) (floral x))))

; 4) Yumpuses are jompuses
(assert (forall ((x Entity)) (=> (yumpuse x) (jompuse x))))

; 5) Jompuses are not transparent
(assert (forall ((x Entity)) (=> (jompuse x) (not (transparent x)))))

; 6) Each jompus is a wumpus
(assert (forall ((x Entity)) (=> (jompuse x) (wumpus x))))

; 7) Every wumpus is nervous
(assert (forall ((x Entity)) (=> (wumpus x) (nervous x))))

; 8) Wumpuses are vumpuses
(assert (forall ((x Entity)) (=> (wumpus x) (vumpus x))))

; 9) Rompuses are not sweet
(assert (forall ((x Entity)) (=> (rompuse x) (not (sweet x)))))

; 10) Each vumpus is hot
(assert (forall ((x Entity)) (=> (vumpus x) (hot x))))

; 11) Vumpuses are tumpuses
(assert (forall ((x Entity)) (=> (vumpus x) (tumpus x))))

; 12) Every tumpus is mean
(assert (forall ((x Entity)) (=> (tumpus x) (mean x))))

; 13) Tumpuses are numpuses
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

; 14) Numpuses are dull
(assert (forall ((x Entity)) (=> (numpus x) (dull x))))

; 15) Numpuses are zumpuses
(assert (forall ((x Entity)) (=> (numpus x) (zumpus x))))

; 16) Zumpuses are sweet
(assert (forall ((x Entity)) (=> (zumpus x) (sweet x))))

; 17) Zumpuses are dumpuses
(assert (forall ((x Entity)) (=> (zumpus x) (dumpus x))))

; 18) Sam is a wumpus
(assert (wumpus Sam))

; Query: Is "Sam is not sweet" true?
(assert (not (sweet Sam)))

; Verification
(check-sat)
(get-model)