; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const sally Entity)

; Declare predicates
(declare-fun wumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun shy (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun spicy (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun transparent (Entity) Bool)

; Knowledge base
; 1. Wumpuses are transparent
(assert (forall ((x Entity)) (=> (wumpus x) (transparent x))))
; 2. Each wumpus is a dumpus
(assert (forall ((x Entity)) (=> (wumpus x) (dumpus x))))
; 3. Dumpuses are shy
(assert (forall ((x Entity)) (=> (dumpus x) (shy x))))
; 4. Every dumpus is a zumpus
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))
; 5. Each zumpus is cold
(assert (forall ((x Entity)) (=> (zumpus x) (cold x))))
; 6. Zumpuses are rompus
(assert (forall ((x Entity)) (=> (zumpus x) (rompus x))))
; 7. Each rompus is not red
(assert (forall ((x Entity)) (=> (rompus x) (not (red x)))))
; 8. Rompuses are impus
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
; 9. Each impus is metallic
(assert (forall ((x Entity)) (=> (impus x) (metallic x))))
; 10. Each impus is a numpus
(assert (forall ((x Entity)) (=> (impus x) (numpus x))))
; 11. Every numpus is fruity
(assert (forall ((x Entity)) (=> (numpus x) (fruity x))))
; 12. Numpuses are jompuses
(assert (forall ((x Entity)) (=> (numpus x) (jompus x))))
; 13. Tumpuses are not metallic
(assert (forall ((x Entity)) (=> (tumpus x) (not (metallic x)))))
; 14. Jompuses are dull
(assert (forall ((x Entity)) (=> (jompus x) (dull x))))
; 15. Jompuses are vumpuses
(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))
; 16. Vumpuses are spicy
(assert (forall ((x Entity)) (=> (vumpus x) (spicy x))))
; 17. Every vumpus is a yumpus
(assert (forall ((x Entity)) (=> (vumpus x) (yumpus x))))

; Sally is a wumpus
(assert (wumpus sally))

; Test: Is Sally metallic? (assert the statement and check satisfiability)
(assert (metallic sally))

; Check satisfiability
(check-sat)