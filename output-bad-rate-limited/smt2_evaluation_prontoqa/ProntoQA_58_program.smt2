; Sort
(declare-sort Entity 0)

; Predicates (uninterpreted unary relations)
(declare-fun tumpus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun orange (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun sweet (Entity) Bool)

; Constant
(declare-const fae Entity)

; Knowledge base (rules)
; 1. Tumpuses are kind.
(assert (forall ((x Entity)) (=> (tumpus x) (kind x))))
; 2. Every tumpus is an impus.
(assert (forall ((x Entity)) (=> (tumpus x) (impus x))))
; 3. Impuses are not dull.
(assert (forall ((x Entity)) (=> (impus x) (not (dull x)))))
; 4. Impuses are jompuses.
(assert (forall ((x Entity)) (=> (impus x) (jompus x))))
; 5. Jompuses are not large.
(assert (forall ((x Entity)) (=> (jompus x) (not (large x)))))
; 6. Jompuses are zumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))
; 7. Every zumpus is happy.
(assert (forall ((x Entity)) (=> (zumpus x) (happy x))))
; 8. Zumpuses are wumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (wumpus x))))
; 9. Every dumpus is not fruity.
(assert (forall ((x Entity)) (=> (dumpus x) (not (fruity x))))
)
; 10. Each wumpus is sweet.
(assert (forall ((x Entity)) (=> (wumpus x) (sweet x))))
; 11. Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (wumpus x) (yumpus x))))
; 12. Yumpuses are orange.
(assert (forall ((x Entity)) (=> (yumpus x) (orange x))))
; 13. Every yumpus is a numpus.
(assert (forall ((x Entity)) (=> (yumpus x) (numpus x))))
; 14. Numpuses are transparent.
(assert (forall ((x Entity)) (=> (numpus x) (transparent x))))
; 15. Each numpus is a vumpus.
(assert (forall ((x Entity)) (=> (numpus x) (vumpus x))))
; 16. Vumpuses are fruity.
(assert (forall ((x Entity) (=> (vumpus x) (fruity x)))))
; 17. Every vumpus is a rompus.
(assert (forall ((x Entity) (=> (vumpus x) (rompus x)))))

; 18. Fae is a zumpus.
(assert (zumpus fae))

; Query: Is "Fae is not fruity" true?
(assert (not (fruity fae)))

; Check satisfiability
(check-sat)
(get-model)