; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Entity 0)
(declare-const fae Entity)

; Unary predicates for all relevant categories / properties
(declare-fun impus (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun numpus (Entity) Bool)

; -------------------------------------------------
;  Knowledge base (facts)
; -------------------------------------------------
(assert (vumpus fae))                 ; Fae is a vumpus

; -------------------------------------------------
;  Universal rules (implications)
; -------------------------------------------------
(assert (forall ((x Entity)) (=> (impus x) (not (happy x)))))
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))
(assert (forall ((x Entity)) (=> (vumpus x) (brown x))))
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))
(assert (forall ((x Entity)) (=> (jompus x) (not (small x)))))
(assert (forall ((x Entity)) (=> (dumpus x) (not (earthy x)))))
(assert (forall ((x Entity)) (=> (dumpus x) (rompus x))))
(assert (forall ((x Entity)) (=> (rompus x) (transparent x))))
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
(assert (forall ((x Entity)) (=> (wumpus x) (kind x))))
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))
(assert (forall ((x Entity)) (=> (yumpus x) (small x))))
(assert (forall ((x Entity)) (=> (yumpus x) (zumpus x))))
(assert (forall ((x Entity)) (=> (zumpus x) (liquid x))))
(assert (forall ((x Entity)) (=> (zumpus x) (tumpus x))))
(assert (forall ((x Entity)) (=> (tumpus x) (hot x))))
(assert (forall ((x Entity)) (=> (tumpus x) (numpus x))))

; -------------------------------------------------
;  Test the claim: "Fae is small"
; -------------------------------------------------
(assert (small fae))

(check-sat)   ; expected result: sat (the claim is true)
(get-model)