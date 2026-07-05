; Declare sorts
(declare-sort Entity 0)

; Declare predicates (uninterpreted unary predicates for each class/property)
(declare-fun zumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)

(declare-fun bright (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun bitter (Entity) Bool)

; Declare constants
(declare-const sam Entity)

; Knowledge base (facts and rules)

; Sam is a numpus
(assert (numpus sam))

; Zumpuses are vumpuses
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))

; Zumpuses are bright
(assert (forall ((x Entity)) (=> (zumpus x) (bright x))))

; Every vumpus is not kind
(assert (forall ((x Entity)) (=> (vumpus x) (not (kind x)))))

; Every vumpus is a wumpus
(assert (forall ((x Entity)) (=> (vumpus x) (wumpus x))))

; Every wumpus is a numpus
(assert (forall ((x Entity)) (=> (wumpus x) (numpus x))))

; Every wumpus is a numpus (duplicate, kept for clarity)
; (already above)

; Every numpus is floral
(assert (forall ((x Entity)) (=> (numpus x) (floral x))))

; Every numpus is a dumpus
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))

; Every dumpus is hot
(assert (forall ((x Entity)) (=> (dumpus x) (hot x))))

; Every dumpus is a tumpus
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))

; Every tumpus is not brown
(assert (forall ((x Entity)) (=> (tumpus x) (not (brown x)))))

; Every tumpus is a jompus
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))

; Jompuses are bitter
(assert (forall ((x Entity)) (=> (jompus x) (bitter x))))

; Jompuses are impuses
(assert (forall ((x Entity)) (=> (jompus x) (impus x))))

; Each impus is not liquid
(assert (forall ((x Entity)) (=> (impus x) (not (liquid x)))))

; Impuses are yumpuses
(assert (forall ((x Entity)) (=> (impus x) (yumpus x))))

; Rompuses are liquid
(assert (forall ((x Entity)) (=> (rompus x) (liquid x))))

; Test: Is Sam not liquid? (assert the statement as the query)
(assert (not (liquid sam)))

; Check satisfiability
(check-sat)
(get-model)