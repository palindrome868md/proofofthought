; Sorts
(declare-sort Entity 0)

; Predicates (unary classifications)
(declare-fun yumpus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun rompuses (Entity) Bool)
(declare-fun tumpuses (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun temperate (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun impus (Entity) Bool)

; Facts about Sally
(declare-const sally Entity)
(assert (wumpus sally))

; Knowledge base (rules)
; 1. Yumpuses are small
(assert (forall ((x Entity)) (=> (yumpus x) (small x))))
; 2. Yumpuses are vumpuses
(assert (forall ((x Entity)) (=> (yumpus x) (vumpus x))))
; 3. Vumpuses are red
(assert (forall ((x Entity)) (=> (vumpus x) (red x))))
; 4. Vumpuses are numpuses
(assert (forall ((x Entity)) (=> (vumpus x) (numpus x))))
; 5. Numpuses are bitter
(assert (forall ((x Entity)) (=> (numpus x) (bitter x))))
; 6. Each numpus is a wumpus
(assert (forall ((x Entity)) (=> (numpus x) (wumpus x))))
; 7. Each impus is not amenable
(assert (forall ((x Entity)) (=> (impus x) (not (amenable x)))))
; 8. Every wumpus is bright
(assert (forall ((x Entity)) (=> (wumpus x) (bright x))))
; 9. Every wumpus is a dumpus
(assert (forall ((x Entity)) (=> (wumpus x) (dumpus x))))
; 10. Every dumpus is temperate
(assert (forall ((x Entity)) (=> (dumpus x) (temperate x))))
; 11. Dumpuses are rompuses
(assert (forall ((x Entity)) (=> (dumpus x) (rompuses x))))
; 12. Rompuses are floral
(assert (forall ((x Entity)) (=> (rompuses x) (floral x))))
; 13. Rompuses are tumpuses
(assert (forall ((x Entity)) (=> (rompuses x) (tumpuses x))))
; 14. Tumpuses are opaque
(assert (forall ((x Entity)) (=> (tumpuses x) (opaque x))))
; 15. Each tumpus is a jompus
(assert (forall ((x Entity)) (=> (tumpuses x) (jompus x))))
; 16. Every jompus is amenable
(assert (forall ((x Entity)) (=> (jompus x) (amenable x))))
; 17. Every jompus is a zumpus
(assert (forall ((x Entity)) (=> (jompus x) (zumpus x))))

; Query: Is Sally amenable?
; To test entailment, assert the negation and check satisfiability
(assert (not (amenable sally)))

; Check satisfiability
(check-sat)