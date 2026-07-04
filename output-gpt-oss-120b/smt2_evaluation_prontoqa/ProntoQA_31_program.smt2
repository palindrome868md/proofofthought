;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun jompus   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun angry    (Entity) Bool)
(declare-fun small    (Entity) Bool)

(declare-fun zumpus   (Entity) Bool)
(declare-fun temperate(Entity) Bool)

(declare-fun tumpus   (Entity) Bool)
(declare-fun brown    (Entity) Bool)

(declare-fun yumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)

(declare-fun dumpus   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)

(declare-fun vumpus   (Entity) Bool)

;--- Constant ----------------------------------------------------------
(declare-const wren Entity)

;--- Knowledge base (universal rules) ----------------------------------
; 1. Each jompus is not small.
(assert (forall ((x Entity))
  (=> (jompus x) (not (small x)))))

; 2. Each wumpus is angry.
(assert (forall ((x Entity))
  (=> (wumpus x) (angry x))))

; 3. Each jompus is a zumpus.
(assert (forall ((x Entity))
  (=> (jompus x) (zumpus x))))

; 4. Zumpuses are temperate.
(assert (forall ((x Entity))
  (=> (zumpus x) (temperate x))))

; 5. Zumpuses are tumpuses.
(assert (forall ((x Entity))
  (=> (zumpus x) (tumpus x))))

; 6. Tumpuses are brown.
(assert (forall ((x Entity))
  (=> (tumpus x) (brown x))))

; 7. Tumpuses are yumpuses.
(assert (forall ((x Entity))
  (=> (tumpus x) (yumpus x))))

; 8. Yumpuses are wooden.
(assert (forall ((x Entity))
  (=> (yumpus x) (wooden x))))

; 9. Yumpuses are dumpuses.
(assert (forall ((x Entity))
  (=> (yumpus x) (dumpus x))))

;10. Each dumpus is not angry.
(assert (forall ((x Entity))
  (=> (dumpus x) (not (angry x)))))

;11. Every dumpus is a numpus.
(assert (forall ((x Entity))
  (=> (dumpus x) (numpus x))))

;12. Numpuses are not dull.
(assert (forall ((x Entity))
  (=> (numpus x) (not (dull x)))))

;13. Every numpus is a vumpus.
(assert (forall ((x Entity))
  (=> (numpus x) (vumpus x))))

;--- Particular facts --------------------------------------------------
; Wren is a jompus.
(assert (jompus wren))

;--- Query: "Wren is not angry" ----------------------------------------
(assert (not (angry wren)))

(check-sat)
(get-model)