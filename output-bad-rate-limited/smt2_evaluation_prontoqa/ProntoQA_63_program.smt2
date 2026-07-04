; Sorts
(declare-sort Entity 0)

; Constants
(declare-const rex Entity)

; Predicates (unary)
(declare-fun Numpus (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Dull (Entity) Bool)

; Knowledge base (assertions)

; 1. Numpuses are not mean
(assert (forall ((x Entity)) (=> (Numpus x) (not (mean x)))))

; 2. Each zumpus is not brown
(assert (forall ((x Entity)) (=> (Zumpus x) (not (brown x)))))

; 3. Numpuses are rompuses
(assert (forall ((x Entity)) (=> (Numpus x) (Rompus x))))

; 4. Every rompus is not cold
(assert (forall ((x Entity)) (=> (Rompus x) (not (cold x)))))

; 5. Rompuses are vumpuses
(assert (forall ((x Entity)) (=> (Rompus x) (Vumpus x))))

; 6. Vumpuses are not happy
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Happy x)))))

; 7. Every vumpus is an impus
(assert (forall ((x Entity)) (=> (Vumpus x) (Impus x))))

; 8. Each impus is liquid
(assert (forall ((x Entity)) (=> (Impus x) (Liquid x))))

; 9. Impuses are jompuses
(assert (forall ((x Entity)) (=> (Impus x) (Jompus x))))

; 10. Jompuses are dull
(assert (forall ((x Entity)) (=> (Jompus x) (Dull x))))

; 11. Every jompus is a tumpus
(assert (forall ((x Entity)) (=> (Jompus x) (Tumpus x))))

; 12. Every tumpus is spicy
(assert (forall ((x Entity)) (=> (Tumpus x) (Spicy x))))

; 13. Tumpuses are yumpuses
(assert (forall ((x Entity)) (=> (Tumpus x) (Yumpus x))))

; 14. Every yumpus is fruity
(assert (forall ((x Entity)) (=> (Yumpus x) (Fruity x))))

; 15. Each yumpus is a wumpus
(assert (forall ((x Entity)) (=> (Yumpus x) (Wumpus x))))

; 16. Wumpuses are brown
(assert (forall ((x Entity)) (=> (Wumpus x) (brown x))))

; 17. Wumpuses are dumpuses
(assert (forall ((x Entity)) (=> (Wumpus x) (Dumpus x))))

; 18. Rex is an impus
(assert (Impus rex))

; Test: Is Rex brown?
; (Scenario) Rex is brown
(assert (brown rex))

; Check satisfiability and model
(check-sat)
(get-model)