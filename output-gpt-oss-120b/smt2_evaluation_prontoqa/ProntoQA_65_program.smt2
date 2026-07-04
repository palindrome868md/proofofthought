; -------------------------------------------------
;  Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
;  Predicate (unary) declarations
; -------------------------------------------------
(declare-fun Rompus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)

(declare-fun Zumpus (Entity) Bool)
(declare-fun Cold (Entity) Bool)

(declare-fun Dumpus (Entity) Bool)
(declare-fun Happy (Entity) Bool)

(declare-fun Vumpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)

(declare-fun Jompus (Entity) Bool)
(declare-fun Large (Entity) Bool)

(declare-fun Wumpus (Entity) Bool)

(declare-fun Impus (Entity) Bool)
(declare-fun Angry (Entity) Bool)

(declare-fun Tumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)

(declare-fun Numpus (Entity) Bool)
(declare-fun Luminous (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)

; -------------------------------------------------
;  Constant declaration
; -------------------------------------------------
(declare-const Max Entity)

; -------------------------------------------------
;  Knowledge base (universal statements)
; -------------------------------------------------
; 1. Each rompus is spicy.
(assert (forall ((x Entity))
        (=> (Rompus x) (Spicy x))))

; 2. Rompuses are zumpuses.
(assert (forall ((x Entity))
        (=> (Rompus x) (Zumpus x))))

; 3. Each zumpus is cold.
(assert (forall ((x Entity))
        (=> (Zumpus x) (Cold x))))

; 4. Zumpuses are dumpuses.
(assert (forall ((x Entity))
        (=> (Zumpus x) (Dumpus x))))

; 5. Every dumpus is happy.
(assert (forall ((x Entity))
        (=> (Dumpus x) (Happy x))))

; 6. Dumpuses are vumpuses.
(assert (forall ((x Entity))
        (=> (Dumpus x) (Vumpus x))))

; 7. Each vumpus is blue.
(assert (forall ((x Entity))
        (=> (Vumpus x) (Blue x))))

; 8. Vumpuses are jompuses.
(assert (forall ((x Entity))
        (=> (Vumpus x) (Jompus x))))

; 9. Jompuses are not large.
(assert (forall ((x Entity))
        (=> (Jompus x) (not (Large x)))))

;10. Every jompus is a wumpus.
(assert (forall ((x Entity))
        (=> (Jompus x) (Wumpus x))))

;11. Every impus is angry.
(assert (forall ((x Entity))
        (=> (Impus x) (Angry x))))

;12. Each wumpus is not angry.
(assert (forall ((x Entity))
        (=> (Wumpus x) (not (Angry x)))))

;13. Wumpuses are tumpuses.
(assert (forall ((x Entity))
        (=> (Wumpus x) (Tumpus x))))

;14. Each tumpus is dull.
(assert (forall ((x Entity))
        (=> (Tumpus x) (Dull x))))

;15. Every tumpus is a numpus.
(assert (forall ((x Entity))
        (=> (Tumpus x) (Numpus x))))

;16. Numpuses are not luminous.
(assert (forall ((x Entity))
        (=> (Numpus x) (not (Luminous x)))))

;17. Numpuses are yumpuses.
(assert (forall ((x Entity))
        (=> (Numpus x) (Yumpus x))))

; -------------------------------------------------
;  Specific facts
; -------------------------------------------------
; Max is a zumpus.
(assert (Zumpus Max))

; -------------------------------------------------
;  Query: Is Max angry?
; -------------------------------------------------
(assert (Angry Max))

; -------------------------------------------------
;  Solve
; -------------------------------------------------
(check-sat)
(get-model)