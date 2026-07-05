; Declare sorts
(declare-sort Entity 0)

; Declare predicates (uninterpreted relations)
(declare-fun numpus  (Entity) Bool)
(declare-fun tumpus  (Entity) Bool)
(declare-fun dull    (Entity) Bool)
(declare-fun jompus  (Entity) Bool)
(declare-fun orange   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun shy      (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun sweet    (Entity) Bool)
(declare-fun rompous  (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun transparent (Entity) Bool)

; Constant
(declare-const rex Entity)

; Knowledge base
(assert (jompus rex))  ; Rex is a jompus

; Rules (knowledge base)
; All numpus are tumpus and fruity
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (numpus x) (fruity x))))

; All tumpus are dull and jompus
(assert (forall ((x Entity)) (=> (tumpus x) (dull x))))
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))

; All jompus are not orange and impus
(assert (forall ((x Entity)) (=> (jompus x) (not (orange x)))))
(assert (forall ((x Entity)) (=> (jompus x) (impus x))))

; Impus are not shy and Wumpuses
(assert (forall ((x Entity)) (=> (impus x) (not (shy x)))))
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))

; Wumpuses are sweet and rompuses
(assert (forall ((x Entity)) (=> (wumpus x) (sweet x))))
(assert (forall ((x Entity)) (=> (wumpus x) (rompus x))))

; Rompus are not amenable and Zumpus
(assert (forall ((x Entity)) (=> (rompus x) (not (amenable x)))))
(assert (forall ((x Entity)) (=> (rompus x) (zumpus x))))

; Zumpus are large and Yumpus
(assert (forall ((x Entity)) (=> (zumpus x) (large x))))
(assert (forall ((x Entity)) (=> (zumpus x) (yumpus x))))

; Yumpus are transparent and Dumpus
(assert (forall ((x Entity)) (=> (yumpus x) (transparent x))))
(assert (forall ((x Entity)) (=> (yumpus x) (dumpus x))))

; Vumpus are not large
(assert (forall ((x Entity)) (=> (vumpus x) (not (large x)))))

; Test: Does Rex have the property "large"?
(assert (large rex))

; Check satisfiability and optionally view a model
(check-sat)
(get-model)