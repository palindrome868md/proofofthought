;--- 1. Sort ---------------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicates ---------------------------------------------------
(declare-fun tumpus  (Entity) Bool)
(declare-fun kind    (Entity) Bool)
(declare-fun impus   (Entity) Bool)
(declare-fun dull    (Entity) Bool)
(declare-fun jompus  (Entity) Bool)
(declare-fun large   (Entity) Bool)
(declare-fun zumpus  (Entity) Bool)
(declare-fun happy   (Entity) Bool)
(declare-fun wumpus  (Entity) Bool)
(declare-fun dumpus  (Entity) Bool)
(declare-fun fruity  (Entity) Bool)
(declare-fun sweet   (Entity) Bool)
(declare-fun yumpus  (Entity) Bool)
(declare-fun orange  (Entity) Bool)
(declare-fun numpus  (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun vumpus  (Entity) Bool)
(declare-fun rompus  (Entity) Bool)

;--- 3. Constant -----------------------------------------------------
(declare-const fae Entity)

;--- 4. Knowledge base (universal rules) ------------------------------
; Tumpuses are kind.
(assert (forall ((x Entity)) (=> (tumpus x) (kind x))))
; Every tumpus is an impus.
(assert (forall ((x Entity)) (=> (tumpus x) (impus x))))
; Impuses are not dull.
(assert (forall ((x Entity)) (=> (impus x) (not (dull x)))))
; Impuses are jompuses.
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))
; Jompuses are not large.
(assert (forall ((x Entity)) (=> (jompus x) (not (large x)))))
; Jompuses are zumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))
; Every zumpus is happy.
(assert (forall ((x Entity)) (=> (zumpus x) (happy x))))
; Zumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (wumpus x))))
; Every dumpus is not fruity.
(assert (forall ((x Entity)) (=> (dumpus x) (not (fruity x)))))
; Each wumpus is sweet.
(assert (forall ((x Entity)) (=> (wumpus x) (sweet x))))
; Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))
; Yumpuses are orange.
(assert (forall ((x Entity)) (=> (yumpus x) (orange x))))
; Every yumpus is a numpus.
(assert (forall ((x Entity)) (=> (yumpus x) (numpus x))))
; Numpuses are transparent.
(assert (forall ((x Entity)) (=> (numpus x) (transparent x))))
; Each numpus is a vumpus.
(assert (forall ((x Entity)) (=> (numpus x) (vumpus x))))
; Vumpuses are fruity.
(assert (forall ((x Entity)) (=> (vumpus x) (fruity x))))
; Every vumpus is a rompus.
(assert (forall ((x Entity)) (=> (vumpus x) (rompus x))))

;--- 5. Fact about Fae ------------------------------------------------
(assert (zumpus fae))

;--- 6. Test the statement "Fae is not fruity" -----------------------
(assert (not (fruity fae)))   ; the claim we are checking

;--- 7. Query ---------------------------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)