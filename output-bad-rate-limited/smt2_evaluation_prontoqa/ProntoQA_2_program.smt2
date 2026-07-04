; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun Tumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Luminous (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Impuse (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Angry (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Red (Entity) Bool)
(declare-fun Bitter (Entity) Bool)

; Constants
(declare-const Stella Entity)

; Knowledge base

; 1. Every tumpus is not angry
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Angry x)))))

; 2. Tumpuses are rompuses
(assert (forall ((x Entity)) (=> (Tumpus x) (Rompus x))))

; 3. Every numpus is not bright
(assert (forall ((x Entity)) (=> (Numpus x) (not (Bright x)))))

; 4. Rompuses are not luminous
(assert (forall ((x Entity)) (=> (Rompus x) (not (Luminous x)))))

; 5. Rompuses are yumpuses
(assert (forall ((x Entity)) (=> (Rompus x) (Yumpus x))))

; 6. Yumpuses are transparent
(assert (forall ((x Entity)) (=> (Yumpus x) (Transparent x))))

; 7. Yumpuses are zumpuses
(assert (forall ((x Entity)) (=> (Yumpus x) (Zumpus x))))

; 8. Each zumpus is not bitter
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Bitter x)))))

; 9. Zumpuses are impuses
(assert (forall ((x Entity)) (=> (Zumpus x) (Impuse x))))

; 10. Impuses are red
(assert (forall ((x Entity)) (=> (Impuse x) (Red x))))

; 11. Each impus is a dumpus
(assert (forall ((x Entity)) (=> (Impuse x) (Dumpus x))))

; 12. Every dumpus is happy
(assert (forall ((x Entity)) (=> (Dumpus x) (Happy x))))

; 13. Each dumpus is a vumpus
(assert (forall ((x Entity)) (=> (Dumpus x) (Vumpus x))))

; 14. Vumpuses are bright
(assert (forall ((x Entity)) (=> (Vumpus x) (Bright x))))

; 15. Every vumpus is a jompus
(assert (forall ((x Entity)) (=> (Vumpus x) (Jompus x))))

; 16. Each jompus is a large
(assert (forall ((x Entity)) (=> (Jompus x) (Large x))))

; 17. Each jompus is a wumpus
(assert (forall ((x Entity)) (=> (Jompus x) (Wumpus x))))

; 18. Stella is a yumpus
(assert (Yumpus Stella))

; 19. Test: Is Stella bright?
(assert Bright Stella)

; Check query
(check-sat)
(get-model)