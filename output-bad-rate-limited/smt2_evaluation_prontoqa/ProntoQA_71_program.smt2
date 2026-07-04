; Declare sorts
(declare-sort Entity 0)

; Predicates
(declare-fun rompus (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun shy (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun yumpus (Entity) Bool)

; Constant: Sally
(declare-const sally Entity)

; Knowledge base
(assert (impus sally))

; 1. Every rompus is cold
(assert (forall ((x Entity)) (=> (rompus x) (cold x))))
; 2. Each rompus is an impus
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
; 3. Every numpus is not dull
(assert (forall ((x Entity)) (=> (numpus x) (not (dull x)))))
; 4. Each impus is large
(assert (forall ((x Entity)) (=> (impus x) (large x))))
; 5. Impuses are vumpuses
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))
; 6. Every vumpus is mean
(assert (forall ((x Entity)) (=> (vumpus x) (mean x))))
; 7. Vumpuses are dumpuses
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))
; 8. Each dumpus is floral
(assert (forall ((x Entity)) (=> (dumpus x) (floral x))))
; 9. Dumpuses are zumpuses
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))
; 10. Zumpuses are opaque
(assert (forall ((x Entity)) (=> (zumpus x) (opaque x))))
; 11. Every zumpus is a jompus
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))
; 12. Each jompus is dull
(assert (forall ((x Entity)) (=> (jompus x) (dull x))))
; 13. Each jompus is a wumpus
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))
; 14. Every wumpus is shy
(assert (forall ((x Entity)) (=> (wumpus x) (shy x))))
; 15. Each wumpus is a tumpus
(assert (forall ((x Entity)) (=> (wumpus x) (tumpus x))))
; 16. Each tumpus is wooden
(assert (forall ((x Entity)) (=> (tumpus x) (wooden x))))
; 17. Each tumpus is a yumpus
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

; Test: Is "Sally is not dull" true?
(assert (not (dull sally)))

; Check satisfiability (answers the question)
(check-sat)
(get-model)