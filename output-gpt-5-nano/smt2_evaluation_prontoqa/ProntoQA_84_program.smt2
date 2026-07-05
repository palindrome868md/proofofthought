; Sort for all entities
(declare-sort Entity 0)

; Predicates (uninterpreted)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-spicy (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)
(declare-fun orange (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun is-democrat (Entity) Bool) ; not used in this problem but harmless if left unused

; Constant Rex
(declare-const rex Entity)

; Given: Rex is a zumpus
(assert (is-zumpus rex))

; Knowledge base (translated from the problem)
; Wumpus -> Zumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-zumpus x))))
; Wumpus -> not spicy
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-spicy x)))))

; Zumpus -> orange
(assert (forall ((x Entity)) (=> (is-zumpus x) (orange x))))
; Zumpus -> Tumpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-tumpus x))))
; Tumpus -> dull
(assert (forall ((x Entity)) (=> (is-tumpus x) (dull x))))
; Tumpus -> Dumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-dumpus x))))
; Dumpus -> Amenable
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-amenable x))))
; Dumpus -> Impus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-impus x))))
; Impus -> not Feisty
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-feisty x)))))
; Impus -> Jompus
(assert (forall ((x Entity)) (=> (is-impus x) (is-jompus x))))
; Jompus -> Opaque
(assert (forall ((x Entity)) (=> (is-jompus x) (is-opaque x))))
; Jompus -> Numpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-numpus x))))
; Yumpus -> not opaque
(assert (forall ((x Entity) (y Entity)) (=> (is-yumpus x) (not (is-opaque x)))))

; (Note: The problem statement mentions "Every yumpus is not opaque." implemented above.)

; Test: Does Rex satisfy "Rex is not opaque"?
(assert (not (is-opaque rex)))

; Check satisfiability to determine the truth of the query
(check-sat)