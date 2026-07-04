; Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

; Predicates (unary relations)
(declare-fun wumpus (Entity) Bool)
(declare-fun impus   (Entity) Bool)
(declare-fun hot     (Entity) Bool)
(declare-fun numpus  (Entity) Bool)
(declare-fun earthy  (Entity) Bool)
(declare-fun zumpus  (Entity) Bool)
(declare-fun mean    (Entity) Bool)
(declare-fun vumpus  (Entity) Bool)
(declare-fun liquid  (Entity) Bool)
(declare-fun dumpus  (Entity) Bool)
(declare-fun tumpus  (Entity) Bool)
(declare-fun large   (Entity) Bool)

; The individual named Sam
(declare-const sam Entity)

; ------------------------------
; Knowledge base (facts & rules)
; ------------------------------

; Fact: Sam is a wumpus
(assert (wumpus sam))

; Rules (universal implications)

; Wumpuses are large
(assert (forall ((x Entity)) (=> (wumpus x) (large x))))

; Each wumpus is an impus
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))

; Each impus is not hot
(assert (forall ((x Entity)) (=> (impus x) (not (hot x)))))

; Impuses are numpuses
(assert (forall ((x Entity)) (=> (impus x) (numpus x))))

; Every numpus is earthy
(assert (forall ((x Entity)) (=> (numpus x) (earthy x))))

; Zumpuses are mean
(assert (forall ((x Entity)) (=> (zumpus x) (mean x))))

; Numpuses are vumpuses
(assert (forall ((x Entity)) (=> (numpus x) (vumpus x))))

; Vumpuses are liquid
(assert (forall ((x Entity)) (=> (vumpus x) (liquid x))))

; Vumpuses are dumpuses
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))

; Dumpuses are not mean
(assert (forall ((x Entity)) (=> (dumpus x) (not (mean x)))))

; Dumpuses are tumpuses
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))

; -------------------------------------------------
; Test the statement: "Sam is mean."
; -------------------------------------------------
(assert (mean sam))

; Check whether the knowledge base allows Sam to be mean
(check-sat)
(get-model)