;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations -------------------------------------------
(declare-fun impus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun vumpus (Entity) Bool)

;--- Constant for Alex -------------------------------------------------
(declare-const Alex Entity)

;--- Knowledge base ----------------------------------------------------
(assert (forall ((x Entity))
  (=> (impus x) (small x))))                     ; each impus is small

(assert (forall ((x Entity))
  (=> (zumpus x) (not (fruity x)))))             ; each zumpus is not fruity

(assert (forall ((x Entity))
  (=> (zumpus x) (numpus x))))                   ; every zumpus is a numpus

(assert (forall ((x Entity))
  (=> (numpus x) (bitter x))))                   ; each numpus is bitter

(assert (forall ((x Entity))
  (=> (numpus x) (rompus x))))                   ; numpuses are rompuses

(assert (forall ((x Entity))
  (=> (rompus x) (kind x))))                     ; rompuses are kind

(assert (forall ((x Entity))
  (=> (rompus x) (wumpus x))))                   ; rompuses are wumpuses

(assert (forall ((x Entity))
  (=> (wumpus x) (not (wooden x)))))             ; every wumpus is not wooden

(assert (forall ((x Entity))
  (=> (wumpus x) (yumpus x))))                  ; wumpuses are yumpuses

(assert (forall ((x Entity))
  (=> (yumpus x) (not (temperate x)))))          ; every yumpus is not temperate

(assert (forall ((x Entity))
  (=> (yumpus x) (dumpus x))))                  ; yumpuses are dumpuses

(assert (forall ((x Entity))
  (=> (dumpus x) (dull x))))                    ; every dumpus is dull

(assert (forall ((x Entity))
  (=> (dumpus x) (tumpus x))))                  ; dumpuses are tumpuses

(assert (forall ((x Entity))
  (=> (tumpus x) (not (small x)))))              ; tumpuses are not small

(assert (forall ((x Entity))
  (=> (tumpus x) (jompus x))))                  ; tumpuses are jompuses

(assert (forall ((x Entity))
  (=> (jompus x) (nervous x))))                  ; every jompus is nervous

(assert (forall ((x Entity))
  (=> (jompus x) (vumpus x))))                  ; each jompus is a vumpus

;--- Fact about Alex ---------------------------------------------------
(assert (rompus Alex))

;--- Test the statement: "Alex is small" -------------------------------
(assert (small Alex))

;--- Check satisfiability -----------------------------------------------
(check-sat)
(get-model)