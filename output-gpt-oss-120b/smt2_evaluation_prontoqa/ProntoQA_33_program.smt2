;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations --------------------------------------------
(declare-fun yumpus   (Entity) Bool)
(declare-fun temperate(Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun blue     (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun nervous  (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun bright   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun mean     (Entity) Bool)
(declare-fun jompus   (Entity) Bool)

;--- Constant for the individual ----------------------------------------
(declare-const Stella Entity)

;--- Knowledge base (universal rules) ------------------------------------
(assert (forall ((x Entity))
          (=> (yumpus x) (not (temperate x)))))        ; every yumpus not temperate

(assert (forall ((x Entity))
          (=> (yumpus x) (rompus x))))                ; yumpus → rompus

(assert (forall ((x Entity))
          (=> (rompus x) (large x))))                 ; rompus → large

(assert (forall ((x Entity))
          (=> (rompus x) (impus x))))                 ; rompus → impus

(assert (forall ((x Entity))
          (=> (impus x) (not (blue x)))))             ; impus not blue

(assert (forall ((x Entity))
          (=> (impus x) (tumpus x))))                ; impus → tumpus

(assert (forall ((x Entity))
          (=> (tumpus x) (nervous x))))              ; tumpus → nervous

(assert (forall ((x Entity))
          (=> (tumpus x) (wumpus x))))               ; tumpus → wumpus

(assert (forall ((x Entity))
          (=> (wumpus x) (bright x))))               ; wumpus → bright

(assert (forall ((x Entity))
          (=> (numpus x) (not (bright x)))))         ; numpus not bright

(assert (forall ((x Entity))
          (=> (wumpus x) (zumpus x))))               ; wumpus → zumpus

(assert (forall ((x Entity))
          (=> (zumpus x) (not (fruity x)))))         ; zumpus not fruity

(assert (forall ((x Entity))
          (=> (zumpus x) (dumpus x))))               ; zumpus → dumpus

(assert (forall ((x Entity))
          (=> (dumpus x) (opaque x))))               ; dumpus → opaque

(assert (forall ((x Entity))
          (=> (dumpus x) (vumpus x))))               ; dumpus → vumpus

(assert (forall ((x Entity))
          (=> (vumpus x) (mean x))))                 ; vumpus → mean

(assert (forall ((x Entity))
          (=> (vumpus x) (jompus x))))               ; vumpus → jompus

;--- Facts --------------------------------------------------------------
(assert (yumpus Stella))   ; Stella is a yumpus

;--- Query: "Stella is not bright" ---------------------------------------
(assert (not (bright Stella)))   ; test the statement

;--- Check satisfiability ------------------------------------------------
(check-sat)   ; expected result: unsat (the statement is false)
(get-model)