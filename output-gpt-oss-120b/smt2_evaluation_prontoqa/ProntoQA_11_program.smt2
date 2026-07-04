;-------------------------------------------------
;  Sorts
;-------------------------------------------------
(declare-sort Entity 0)

;-------------------------------------------------
;  Predicates (unary properties)
;-------------------------------------------------
(declare-fun jompus   (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun shy      (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun bitter   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun orange   (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun numpus   (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun large    (Entity) Bool)
(declare-fun impus    (Entity) Bool)

;-------------------------------------------------
;  Constant
;-------------------------------------------------
(declare-const sam Entity)

;-------------------------------------------------
;  Knowledge base (facts and universal rules)
;-------------------------------------------------
; 1. Each jompus is not amenable.
(assert (forall ((x Entity))
  (=> (jompus x) (not (amenable x)))))

; 2. Wumpuses are not fruity.
(assert (forall ((x Entity))
  (=> (wumpus x) (not (fruity x)))))

; 3. Every jompus is a vumpus.
(assert (forall ((x Entity))
  (=> (jompus x) (vumpus x))))

; 4. Every vumpus is not shy.
(assert (forall ((x Entity))
  (=> (vumpus x) (not (shy x)))))

; 5. Every vumpus is a rompus.
(assert (forall ((x Entity))
  (=> (vumpus x) (rompus x))))

; 6. Rompuses are not bitter.
(assert (forall ((x Entity))
  (=> (rompus x) (not (bitter x)))))

; 7. Rompuses are dumpuses.
(assert (forall ((x Entity))
  (=> (rompus x) (dumpus x))))

; 8. Dumpuses are opaque.
(assert (forall ((x Entity))
  (=> (dumpus x) (opaque x))))

; 9. Every dumpus is a yumpus.
(assert (forall ((x Entity))
  (=> (dumpus x) (yumpus x))))

;10. Every yumpus is orange.
(assert (forall ((x Entity))
  (=> (yumpus x) (orange x))))

;11. Yumpuses are zumpuses.
(assert (forall ((x Entity))
  (=> (yumpus x) (zumpus x))))

;12. Zumpuses are fruity.
(assert (forall ((x Entity))
  (=> (zumpus x) (fruity x))))

;13. Each zumpus is a numpus.
(assert (forall ((x Entity))
  (=> (zumpus x) (numpus x))))

;14. Numpuses are metallic.
(assert (forall ((x Entity))
  (=> (numpus x) (metallic x))))

;15. Every numpus is a tumpus.
(assert (forall ((x Entity))
  (=> (numpus x) (tumpus x))))

;16. Each tumpus is large.
(assert (forall ((x Entity))
  (=> (tumpus x) (large x))))

;17. Each tumpus is an impus.
(assert (forall ((x Entity))
  (=> (tumpus x) (impus x))))

;-------------------------------------------------
;  Specific fact about Sam
;-------------------------------------------------
(assert (vumpus sam))

;-------------------------------------------------
;  Test the statement: "Sam is not fruity."
;-------------------------------------------------
(assert (not (fruity sam)))

;-------------------------------------------------
;  Check consistency
;-------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false)
(get-model)   ; Optional: view a model if it were sat