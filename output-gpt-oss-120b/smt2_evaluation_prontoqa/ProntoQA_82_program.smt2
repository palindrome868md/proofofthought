; -------------------------------------------------
; Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate (unary) declarations
; -------------------------------------------------
(declare-fun Impus (Entity) Bool)
(declare-fun Mean (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Hot (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)

; -------------------------------------------------
; Constant declaration
; -------------------------------------------------
(declare-const rex Entity)

; -------------------------------------------------
; Knowledge base (facts + universal rules)
; -------------------------------------------------

; 1. Impuses are mean.
(assert (forall ((x Entity)) (=> (Impus x) (Mean x))))

; 2. Each impus is a yumpus.
(assert (forall ((x Entity)) (=> (Impus x) (Yumpus x))))

; 3. Yumpuses are blue.
(assert (forall ((x Entity)) (=> (Yumpus x) (Blue x))))

; 4. Yumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (Yumpus x) (Wumpus x))))

; 5. Wumpuses are hot.
(assert (forall ((x Entity)) (=> (Wumpus x) (Hot x))))

; 6. Every wumpus is a numpus.
(assert (forall ((x Entity)) (=> (Wumpus x) (Numpus x))))

; 7. Jompuses are happy.
(assert (forall ((x Entity)) (=> (Jompus x) (Happy x))))

; 8. Numpuses are fruity.
(assert (forall ((x Entity)) (=> (Numpus x) (Fruity x))))

; 9. Numpuses are dumpuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Dumpus x))))

;10. Every dumpus is not dull.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Dull x)))))

;11. Every dumpus is a tumpus.
(assert (forall ((x Entity)) (=> (Dumpus x) (Tumpus x))))

;12. Tumpuses are not happy.
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Happy x)))))

;13. Every tumpus is a vumpus.
(assert (forall ((x Entity)) (=> (Tumpus x) (Vumpus x))))

;14. Vumpuses are not opaque.
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Opaque x)))))

;15. Every vumpus is a rompus.
(assert (forall ((x Entity)) (=> (Vumpus x) (Rompus x))))

;16. Rompuses are metallic.
(assert (forall ((x Entity)) (=> (Rompus x) (Metallic x))))

;17. Each rompus is a zumpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Zumpus x))))

; -------------------------------------------------
; Fact about Rex
; -------------------------------------------------
(assert (Yumpus rex))

; -------------------------------------------------
; Test the statement: "Rex is not happy"
; -------------------------------------------------
(assert (not (Happy rex)))

; -------------------------------------------------
; Solve
; -------------------------------------------------
(check-sat)
(get-model)