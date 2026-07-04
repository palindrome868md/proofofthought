; -------------------------------------------------
;  Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
;  Predicate (unary) declarations
; -------------------------------------------------
(declare-fun Jompus   (Entity) Bool)
(declare-fun Small    (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Kind     (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Fruity   (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Nervous  (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Opaque   (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Dull     (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Hot      (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Yumpus   (Entity) Bool)

; -------------------------------------------------
;  Constant declaration
; -------------------------------------------------
(declare-const Sam Entity)

; -------------------------------------------------
;  Knowledge base (premises)
; -------------------------------------------------
; 1. Jompuses are not small.
(assert (forall ((x Entity))
        (=> (Jompus x) (not (Small x)))))

; 2. Jompuses are tumpuses.
(assert (forall ((x Entity))
        (=> (Jompus x) (Tumpus x))))

; 3. Tumpuses are not kind.
(assert (forall ((x Entity))
        (=> (Tumpus x) (not (Kind x)))))

; 4. Each tumpus is a vumpus.
(assert (forall ((x Entity))
        (=> (Tumpus x) (Vumpus x))))

; 5. Vumpuses are metallic.
(assert (forall ((x Entity))
        (=> (Vumpus x) (Metallic x))))

; 6. Vumpuses are numpuses.
(assert (forall ((x Entity))
        (=> (Vumpus x) (Numpus x))))

; 7. Each numpus is fruity.
(assert (forall ((x Entity))
        (=> (Numpus x) (Fruity x))))

; 8. Each numpus is a dumpus.
(assert (forall ((x Entity))
        (=> (Numpus x) (Dumpus x))))

; 9. Dumpuses are nervous.
(assert (forall ((x Entity))
        (=> (Dumpus x) (Nervous x))))

;10. Dumpuses are rompuses.
(assert (forall ((x Entity))
        (=> (Dumpus x) (Rompus x))))

;11. Each rompus is opaque.
(assert (forall ((x Entity))
        (=> (Rompus x) (Opaque x))))

;12. Every wumpus is dull.
(assert (forall ((x Entity))
        (=> (Wumpus x) (Dull x))))

;13. Each rompus is a zumpus.
(assert (forall ((x Entity))
        (=> (Rompus x) (Zumpus x))))

;14. Each zumpus is hot.
(assert (forall ((x Entity))
        (=> (Zumpus x) (Hot x))))

;15. Every zumpus is an impus.
(assert (forall ((x Entity))
        (=> (Zumpus x) (Impus x))))

;16. Every impus is not dull.
(assert (forall ((x Entity))
        (=> (Impus x) (not (Dull x)))))

;17. Each impus is a yumpus.
(assert (forall ((x Entity))
        (=> (Impus x) (Yumpus x))))

;18. Sam is a numpus.
(assert (Numpus Sam))

; -------------------------------------------------
;  Test the statement: "Sam is not dull"
; -------------------------------------------------
(assert (not (Dull Sam)))   ; i.e., Sam is not dull

; -------------------------------------------------
;  Solve
; -------------------------------------------------
(check-sat)
(get-model)