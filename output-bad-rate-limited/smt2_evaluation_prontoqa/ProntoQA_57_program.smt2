; Declare a single universe of discourse for all entities
(declare-sort Entity 0)

; Predicates representing each category
(declare-fun rompus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)

; Predicates for properties
(declare-fun luminous (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun sour (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun opaque (Entity) Bool)

; Alex as a constant in the domain
(declare-const alex Entity)

; Knowledge base (rules)

; Rompuses are luminous
(assert (forall ((x Entity)) (=> (rompus x) (luminous x))))
; Yumpuses are feisty
(assert (forall ((x Entity)) (=> (yumpus x) (feisty x))))
; Rompuses are impuses
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
; Each impus is not sour
(assert (forall ((x Entity)) (=> (impus x) (not (sour x)))))
; Impuses are wumpuses
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))
; Wumpuses are not fruity
(assert (forall ((x Entity)) (=> (wumpus x) (not (fruity x))))
)
; Wumpuses are numpuses
(assert (forall ((x Entity)) (=> (wumpus x) (numpus x))))
; Every numpus is blue
(assert (forall ((x Entity)) (=> (numpus x) (blue x))))
; Every numpus is a dumpus
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))
; Every dumpus is not feisty
(assert (forall ((x Entity)) (=> (dumpus x) (not (feisty x))))
)
; Each dumpus is a tumpus
(assert (forall ((x Entity)) (=> (dumpus x) (tumpus x))))
; Tumpuses are kind
(assert (forall ((x Entity)) (=> (tumpus x) (kind x))))
; Every tumpus is a vumpus
(assert (forall ((x Entity)) (=> (tumpus x) (vumpus x))))
; Each vumpus is opaque
(assert (forall ((x Entity)) (=> (vumpus x) (opaque x))))
; Vumpuses are zumpuses
(assert (forall ((x Entity)) (=> (vumpus x) (zumpus x))))
; Each zumpus is not large
(assert (forall ((x Entity)) (=> (zumpus x) (not (large x)))))
; Zumpuses are jompuses
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))

; Alex is a rompus
(assert (rompus alex))

; Test: Is "Alex is not feisty" true? (assert the statement to verify satisfiability)
(assert (not (feisty alex)))

; Check satisfiability and provide a model if satisfiable
(check-sat)
(get-model)