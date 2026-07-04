;--- Sort declaration ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations --------------------------------------------------
(declare-fun rompuses       (Entity) Bool)
(declare-fun mean           (Entity) Bool)
(declare-fun zumpuses       (Entity) Bool)
(declare-fun happy          (Entity) Bool)
(declare-fun numpus         (Entity) Bool)
(declare-fun temperate      (Entity) Bool)
(declare-fun tumpus         (Entity) Bool)
(declare-fun large          (Entity) Bool)
(declare-fun yumpus         (Entity) Bool)
(declare-fun earthy         (Entity) Bool)
(declare-fun jompus         (Entity) Bool)
(declare-fun blue           (Entity) Bool)
(declare-fun wumpus         (Entity) Bool)
(declare-fun dull           (Entity) Bool)
(declare-fun impus          (Entity) Bool)
(declare-fun vumpus         (Entity) Bool)
(declare-fun sour           (Entity) Bool)
(declare-fun dumpus         (Entity) Bool)

;--- Constant -----------------------------------------------------------------
(declare-const Alex Entity)

;--- Knowledge base (universal rules) -----------------------------------------
(assert (forall ((x Entity)) (=> (rompuses x) (mean x))))                ; Rompuses are mean
(assert (forall ((x Entity)) (=> (rompuses x) (zumpuses x))))            ; Rompuses are zumpuses
(assert (forall ((x Entity)) (=> (zumpuses x) (not (happy x)))))        ; Each zumpus is not happy
(assert (forall ((x Entity)) (=> (zumpuses x) (numpus x))))             ; Each zumpus is a numpus
(assert (forall ((x Entity)) (=> (numpus x) (not (temperate x)))))      ; Each numpus is not temperate
(assert (forall ((x Entity)) (=> (numpus x) (tumpus x))))               ; Each numpus is a tumpus
(assert (forall ((x Entity)) (=> (tumpus x) (not (large x)))))          ; Tumpuses are not large
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))               ; Tumpuses are yumpuses
(assert (forall ((x Entity)) (=> (yumpus x) (earthy x))))               ; Every yumpus is earthy
(assert (forall ((x Entity)) (=> (yumpus x) (jompus x))))               ; Each yumpus is a jompus
(assert (forall ((x Entity)) (=> (jompus x) (blue x))))                 ; Jompuses are blue
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))               ; Every jompus is a wumpus
(assert (forall ((x Entity)) (=> (wumpus x) (not (dull x)))))          ; Wumpuses are not dull
(assert (forall ((x Entity)) (=> (wumpus x) (impus x))))                ; Wumpuses are impuses
(assert (forall ((x Entity)) (=> (vumpus x) (dull x))))                 ; Each vumpus is dull
(assert (forall ((x Entity)) (=> (impus x) (sour x))))                  ; Impuses are sour
(assert (forall ((x Entity)) (=> (impus x) (dumpus x))))                ; Impuses are dumpuses

;--- Specific facts -----------------------------------------------------------
(assert (numpus Alex))               ; Alex is a numpus

;--- Query: “Alex is not dull” ------------------------------------------------
(assert (not (dull Alex)))           ; the statement we are testing

;--- Solve --------------------------------------------------------------------
(check-sat)      ; expected result: sat (the statement is true)
(get-model)      ; optional: shows a model satisfying the constraints