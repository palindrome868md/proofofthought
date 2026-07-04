; -------------------------------------------------
; Sort declaration
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate (uninterpreted functions returning Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun orange (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun spicy (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun liquid (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun earthy (Entity) Bool)
(declare-fun jompus (Entity) Bool)

; -------------------------------------------------
; Constant for Stella
(declare-const stella Entity)

; -------------------------------------------------
; Knowledge base (universal rules)
(assert (forall ((x Entity)) (=> (rompus x) (orange x))))          ; every rompus is orange
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))           ; every rompus is impus
(assert (forall ((x Entity)) (=> (vumpus x) (happy x))))          ; vumpuses are happy
(assert (forall ((x Entity)) (=> (impus x) (spicy x))))           ; every impus is spicy
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))          ; every impus is wumpus
(assert (forall ((x Entity)) (=> (wumpus x) (transparent x))))    ; wumpuses are transparent
(assert (forall ((x Entity)) (=> (wumpus x) (numpus x))))         ; wumpuses are numpuses
(assert (forall ((x Entity)) (=> (numpus x) (not (kind x)))))     ; every numpus is not kind
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))         ; numpuses are tumpuses
(assert (forall ((x Entity)) (=> (tumpus x) (not (bright x)))))   ; each tumpus is not bright
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))         ; tumpuses are yumpuses
(assert (forall ((x Entity)) (=> (yumpus x) (not (liquid x)))))   ; every yumpus is not liquid
(assert (forall ((x Entity)) (=> (yumpus x) (dumpus x))))         ; yumpuses are dumpuses
(assert (forall ((x Entity)) (=> (dumpus x) (not (happy x)))))    ; each dumpus is not happy
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))         ; dumpuses are zumpuses
(assert (forall ((x Entity)) (=> (zumpus x) (earthy x))))         ; every zumpus is earthy
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))         ; each zumpus is a jompus

; -------------------------------------------------
; Fact about Stella
(assert (wumpus stella))

; -------------------------------------------------
; Test the statement: "Stella is happy"
(assert (happy stella))

; -------------------------------------------------
; Check satisfiability (sat = true, unsat = false)
(check-sat)
(get-model)