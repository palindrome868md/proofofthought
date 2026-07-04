; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Entity 0)

(declare-fun zumpus   (Entity) Bool)
(declare-fun small    (Entity) Bool)

(declare-fun impus    (Entity) Bool)
(declare-fun sweet    (Entity) Bool)

(declare-fun vumpus   (Entity) Bool)
(declare-fun feisty   (Entity) Bool)

(declare-fun dumpus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)

(declare-fun rompuse  (Entity) Bool)   ; “rompuses” in the text
(declare-fun transparent (Entity) Bool)

(declare-fun wumpus   (Entity) Bool)
(declare-fun earthy   (Entity) Bool)

(declare-fun tumpus   (Entity) Bool)
(declare-fun cold     (Entity) Bool)

(declare-fun numpus   (Entity) Bool)

(declare-fun yumpus   (Entity) Bool)

(declare-const max Entity)

; -------------------------------------------------
;  Knowledge base (implications)
; -------------------------------------------------
; 1. Every zumpus is small.
(assert (forall ((x Entity)) (=> (zumpus x) (small x))))

; 2. Each zumpus is an impus.
(assert (forall ((x Entity)) (=> (zumpus x) (impus x))))

; 3. Every impus is sweet.
(assert (forall ((x Entity)) (=> (impus x) (sweet x))))

; 4. Impuses are vumpuses.
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))

; 5. Each vumpus is not feisty.
(assert (forall ((x Entity)) (=> (vumpus x) (not (feisty x)))))

; 6. Every vumpus is a dumpus.
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))

; 7. Every dumpus is not dull.
(assert (forall ((x Entity)) (=> (dumpus x) (not (dull x)))))

; 8. Dumpuses are rompuses.
(assert (forall ((x Entity)) (=> (dumpus x) (rompuse x))))

; 9. Every rompus is transparent.
(assert (forall ((x Entity)) (=> (rompuse x) (transparent x))))

;10. Rompuses are wumpuses.
(assert (forall ((x Entity)) (=> (rompuse x) (wumpus x))))

;11. Each wumpus is not earthy.
(assert (forall ((x Entity)) (=> (wumpus x) (not (earthy x)))))

;12. Wumpuses are tumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (tumpus x))))

;13. Every tumpus is cold.
(assert (forall ((x Entity)) (=> (tumpus x) (cold x))))

;14. Numpuses are not cold.
(assert (forall ((x Entity)) (=> (numpus x) (not (cold x)))))

;15. Tumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

; -------------------------------------------------
;  Fact about Max
; -------------------------------------------------
(assert (vumpus max))

; -------------------------------------------------
;  Query: "Max is not cold."
; -------------------------------------------------
(assert (not (cold max)))

; -------------------------------------------------
;  Check the query
; -------------------------------------------------
(check-sat)
(get-model)