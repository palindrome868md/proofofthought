; Sorts
(declare-sort Entity 0)

; Predicates (uninterpreted properties)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Sour (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Angry (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Hot (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Wooden (Entity) Bool)

; Constants
(declare-const sam Entity)

; Knowledge base (facts and rules)
(assert (Vumpus sam))  ; Sam is a vumpus

; Vumpuses are sour
(assert (forall ((x Entity)) (=> (Vumpus x) (Sour x))))
; Every vumpus is a zumpus
(assert (forall ((x Entity)) (=> (Vumpus x) (Zumpus x))))
; Every zumpus is angry
(assert (forall ((x Entity)) (=> (Zumpus x) (Angry x))))
; Every zumpus is a tumpus
(assert (forall ((x Entity)) (=> (Zumpus x) (Tumpus x))))
; Tumpuses are not small
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Small x)))))
; Every tumpus is a yumpus
(assert (forall ((x Entity)) (=> (Tumpus x) (Yumpus x))))
; Each yumpus is not blue
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Blue x)))))
; Yumpuses are rompuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Rompus x))))
; Rompus are not fruity
(assert (forall ((x Entity)) (=> (Rompus x) (not (Fruity x)))))
; Rompus are numpus
(assert (forall ((x Entity)) (=> (Rompus x) (Numpus x))))
; Numpuses are hot
(assert (forall ((x Entity)) (=> (Numpus x) (Hot x))))
; Numpuses are impus
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
; Impus are transparent
(assert (forall ((x Entity)) (=> (Impus x) (Transparent x))))
; Impus are dumpuses
(assert (forall ((x Entity)) (=> (Impus x) (Dumpus x))))
; Dumpuses are wooden
(assert (forall ((x Entity)) (=> (Dumpus x) (Wooden x))))
; Dumpuses are jompus
(assert (forall ((x Entity)) (=> (Dumpus x) (Jompus x))))
; Wumpuses are fruity
(assert (forall ((x Entity)) (=> (Wumpus x) (Fruity x))))

; Test: Is Sam not fruity?
(assert (not (Fruity sam)))

; Verification: check whether the knowledge base can satisfy the test
(check-sat)
(get-model)