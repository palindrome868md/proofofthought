;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun Yumpus   (Entity) Bool)
(declare-fun Impus    (Entity) Bool)
(declare-fun Numpus   (Entity) Bool)
(declare-fun Dumpus   (Entity) Bool)
(declare-fun Zumpus   (Entity) Bool)
(declare-fun Wumpus   (Entity) Bool)
(declare-fun Rompus   (Entity) Bool)
(declare-fun Tumpus   (Entity) Bool)
(declare-fun Jompus   (Entity) Bool)
(declare-fun Vumpus   (Entity) Bool)

(declare-fun Kind     (Entity) Bool)
(declare-fun Red      (Entity) Bool)
(declare-fun Feisty   (Entity) Bool)
(declare-fun Luminous (Entity) Bool)
(declare-fun Cold     (Entity) Bool)
(declare-fun Fruity   (Entity) Bool)
(declare-fun Spicy    (Entity) Bool)
(declare-fun Dull     (Entity) Bool)

;--- Constant (individual) --------------------------------------------
(declare-const polly Entity)

;--- Knowledge base ----------------------------------------------------
; 1. Every yumpus is not kind.
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Kind x)))))

; 2. Each yumpus is an impus.
(assert (forall ((x Entity)) (=> (Yumpus x) (Impus x))))

; 3. Every impus is not red.
(assert (forall ((x Entity)) (=> (Impus x) (not (Red x)))))

; 4. Every impus is a numpus.
(assert (forall ((x Entity)) (=> (Impus x) (Numpus x))))

; 5. Numpuses are feisty.
(assert (forall ((x Entity)) (=> (Numpus x) (Feisty x))))

; 6. Each dumpus is not luminous.
(assert (forall ((x Entity)) (=> (Dumpus x) (not (Luminous x)))))

; 7. Numpuses are zumpuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Zumpus x))))

; 8. Each zumpus is cold.
(assert (forall ((x Entity)) (=> (Zumpus x) (Cold x))))

; 9. Zumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (Zumpus x) (Wumpus x))))

;10. Each wumpus is fruity.
(assert (forall ((x Entity)) (=> (Wumpus x) (Fruity x))))

;11. Every wumpus is a rompus.
(assert (forall ((x Entity)) (=> (Wumpus x) (Rompus x))))

;12. Every rompus is spicy.
(assert (forall ((x Entity)) (=> (Rompus x) (Spicy x))))

;13. Rompuses are tumpuses.
(assert (forall ((x Entity)) (=> (Rompus x) (Tumpus x))))

;14. Tumpuses are luminous.
(assert (forall ((x Entity)) (=> (Tumpus x) (Luminous x))))

;15. Tumpuses are jompuses.
(assert (forall ((x Entity)) (=> (Tumpus x) (Jompus x))))

;16. Every jompus is not dull.
(assert (forall ((x Entity)) (=> (Jompus x) (not (Dull x)))))

;17. Jompuses are vumpuses.
(assert (forall ((x Entity)) (=> (Jompus x) (Vumpus x))))

;--- Fact about Polly ---------------------------------------------------
(assert (Numpus polly))

;--- Query: "Polly is not luminous." ------------------------------------
(assert (not (Luminous polly)))

;--- Check the result ---------------------------------------------------
(check-sat)
(get-model)