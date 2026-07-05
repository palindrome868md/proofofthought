; Sorts
(declare-sort Entity 0)

; Predicates (unary relations on Entity)
(declare-fun rompus (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun numpus (Entity) Bool)

(declare-fun vumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)

(declare-fun dull (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun mean (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun shy (Entity) Bool)
(declare-fun wooden (Entity) Bool)

; Constants
(declare-const sally Entity)

; Knowledge base (axioms)
; 1. Every rompus is cold.  and  Every rompus is an impus
(assert (forall ((x Entity)) (=> (rompus x) (impus x))))
(assert (forall ((x Entity)) (=> (rompus x) (cold x))))

; 2. Every numpus is not dull
(assert (forall ((x Entity)) (=> (numpus x) (not (dull x)))))

; 3. Each impus is large
(assert (forall ((x Entity)) (=> (impus x) (large x))))

; 4. Impuses are vumpuses
(assert (forall ((x Entity)) (=> (impus x) (vumpus x))))

; 5. Every vumpus is mean
(assert (forall ((x Entity)) (=> (vumpus x) (mean x))))

; 6. Vumpuses are dumpuses
(assert (forall ((x Entity)) (=> (vumpus x) (dumpus x))))

; 7. Each dumpus is floral
(assert (forall ((x Entity)) (=> (dumpus x) (floral x))))

; 8. Dumpuses are zumpuses
(assert (forall ((x Entity)) (=> (dumpus x) (zumpus x))))

; 9. Zumpuses are opaque
(assert (forall ((x Entity)) (=> (zumpus x) (opaque x))))

; 10. Every zumpus is a jompus
(assert (forall ((x Entity)) (=> (zumpus x) (jompus x))))

; 11. Each jompus is dull
(assert (forall ((x Entity)) (=> (jompus x) (dull x))))

; 12. Each jompus is a wumpus
(assert (forall ((x Entity)) (=> (jompus x) (wumpus x))))

; 13. Each wumpus is shy
(assert (forall ((x Entity)) (=> (wumpus x) (shy x))))

; 14. Each wumpus is a tumpus
(assert (forall ((x Entity)) (=> (wumpus x) (tumpus x))))

; 15. Each tumpus is wooden
(assert (forall ((x Entity) (=> (tumpus x) (wooden x)))))

; 16. Each tumpus is a yumpus
(assert (forall ((x Entity) (=> (tumpus x) (yumpus x)))))

; 17. Sally is an impus
(assert (impus sally))

; Test scenario: Is Sally not dull?
(assert (not (dull sally)))

; Verification: check satisfiability
(check-sat)