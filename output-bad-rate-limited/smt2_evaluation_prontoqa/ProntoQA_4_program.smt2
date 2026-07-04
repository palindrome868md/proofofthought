; Declare sorts
(declare-sort Entity 0)

; Declare predicates (uninterpreted unary relations)
(declare-fun Rompus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Shy (Entity) Bool)
(declare-fun Hot (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Orange (Entity) Bool)
(declare-fun Kind (Entity) Bool)

; Declare constants
(declare-const alex Entity)

; Knowledge base (axioms)
(assert (forall ((x Entity)) (=> (Rompus x) (Impus x))))        ; Rompuses are Impus
(assert (forall ((x Entity)) (=> (Impus x) (Orange x))))        ; Impuses are orange
(assert (forall ((x Entity)) (=> (Impus x) (Zumpus x))))         ; Impuses are Zumpuses
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Hot x)))))    ; Zumpuses are not hot
(assert (forall ((x Entity)) (=> (Zumpus x) (Numpus x))))         ; Zumpuses are numpuses
(assert (forall ((x Entity)) (=> (Numpus x) (Metallic x))))       ; Numpuses are metallic
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))         ; Numpuses are wumpuses
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Kind x)))))   ; Wumpuses are not kind
(assert (forall ((x Entity)) (=> (Wumpus x) (Dumpus x))))         ; Wumpuses are dumpuses
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Bright x)))))  ; Dumpuses are not bright
(assert (forall ((x Entity)) (=> (Dumpus x) (Jompus x))))         ; Dumpuses are jompuses
(assert (forall ((x Entity)) (=> (Jompus x) (Small x))))          ; Jompuses are small
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))          ; Jompuses are vumpuses
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Shy x)))))    ; Vumpuses are not shy
(assert (forall ((x Entity)) (=> (Vumpus x) (Tumpus x))))         ; Vumpuses are tumpuses

; Fact: Alex is a zumpus
(assert (Zumpus alex))

; Test: Is "Alex not small" true?
(assert (not (Small alex)))

; Check satisfiability
(check-sat)