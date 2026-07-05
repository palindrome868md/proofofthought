; Sorts
(declare-sort Entity 0)

; Predicates (unary properties)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)

(declare-fun Kind (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Orange (Entity) Bool)

(declare-fun Earthy (Entity) Bool)
(declare-fun Wooden (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Transparent (Entity) Bool)

; Constants
(declare-const Max Entity)

; Knowledge base (facts + rules)

; 1) Max is a dumpus
(assert (Dumpus Max))

; 2) Vumpuses are earthy
(assert (forall ((x Entity)) (=> (Vumpus x) (Earthy x))))

; 3) Vumpuses are dumpuses
(assert (forall ((x Entity)) (=> (Vumpus x) (Dumpus x))))

; 4) Dumpuses are not wooden
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Wooden x)))))

; 5) Dumpuses are numpuses
(assert (forall ((x Entity)) (=> (Dumpus x) (Numpus x))))

; 6) Every numpus is kind
(assert (forall ((x Entity)) (=> (Numpus x) (Kind x))))

; 7) Each numpus is a rompus
(assert (forall ((x Entity)) (=> (Numpus x) (Rompus x))))

; 8) Each rompus is small
(assert (forall ((x Entity)) (=> (Rompus x) (Small x))))

; 9) Every rompus is a jompus
(assert (forall ((x Entity)) (=> (Rompus x) (Jompus x))))

; 10) Every jompus is bright
(assert (forall ((x Entity)) (=> (Jompus x) (Bright x))))

; 11) Jompuses are yumpuses
(assert (forall ((x Entity)) (=> (Jompus x) (Yumpus x))))

; 12) Yumpuses are orange
(assert (forall ((x Entity)) (=> (Yumpus x) (Orange x))))

; 13) Every yumpus is a zumpus
(assert (forall ((x Entity)) (=> (Yumpus x) (Zumpus x))))

; 14) Zumpuses are sour
(assert (forall ((x Entity)) (=> (Zumpus x) (Sour x))))

; 15) Zumpuses are impuses
(assert (forall ((x Entity)) (=> (Zumpus x) (Impuse x))))

; 16) Impuses are transparent
(assert (forall ((x Entity)) (=> (Impuse x) (Transparent x))))

; 17) Tumpuses are not orange
(assert (forall ((x Entity) (y Entity)) 
  (=> (Tumpus x) (not (Orange x)))))

; 18) Each impus is a wumpus
(assert (forall ((x Entity)) (=> (Impuse x) (Wumpus x))))

; 19) Max is a dumpus (redundant with 1, but explicit)
; (Already asserted above as (Dumpus Max))

; Optional consistency constraints to avoid spurious models (not strictly needed)

; Query: Is Max orange?
; To verify entailment, assert the negation and check satisfiability.
(assert (not (Orange Max)))

; Check whether the knowledge base is satisfiable with the negation of the query
(check-sat)