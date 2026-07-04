; -------------------------------------------------
; 1. Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Predicate declarations (unary properties / classes)
; -------------------------------------------------
(declare-fun vumpus   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun angry    (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun small    (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun blue     (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun hot      (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)
(declare-fun sour     (Entity) Bool)

; -------------------------------------------------
; 3. Constant for the individual Sam
; -------------------------------------------------
(declare-const sam Entity)

; -------------------------------------------------
; 4. Knowledge base (facts + universal rules)
; -------------------------------------------------
; Facts
(assert (vumpus sam))

; Rules
(assert (forall ((x Entity))
          (=> (vumpus x) (sour x))))

(assert (forall ((x Entity))
          (=> (vumpus x) (zumpus x))))

(assert (forall ((x Entity))
          (=> (zumpus x) (angry x))))

(assert (forall ((x Entity))
          (=> (zumpus x) (tumpus x))))

(assert (forall ((x Entity))
          (=> (tumpus x) (not (small x)))))

(assert (forall ((x Entity))
          (=> (tumpus x) (yumpus x))))

(assert (forall ((x Entity))
          (=> (yumpus x) (not (blue x)))))

(assert (forall ((x Entity))
          (=> (yumpus x) (rompus x))))

(assert (forall ((x Entity))
          (=> (rompus x) (not (fruity x)))))

(assert (forall ((x Entity))
          (=> (wumpus x) (fruity x))))

(assert (forall ((x Entity))
          (=> (rompus x) (numpus x))))

(assert (forall ((x Entity))
          (=> (numpus x) (hot x))))

(assert (forall ((x Entity))
          (=> (numpus x) (impus x))))

(assert (forall ((x Entity))
          (=> (impus x) (transparent x))))

(assert (forall ((x Entity))
          (=> (impus x) (dumpus x))))

(assert (forall ((x Entity))
          (=> (dumpus x) (wooden x))))

(assert (forall ((x Entity))
          (=> (dumpus x) (jompus x))))

; -------------------------------------------------
; 5. Test the statement: "Sam is not fruity"
;    We assert the opposite (Sam is fruity) and see whether
;    this leads to a contradiction.
; -------------------------------------------------
(assert (fruity sam))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)   ; expected result: unsat  → the original claim is true
(get-model)