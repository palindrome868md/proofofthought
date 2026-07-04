; Sorts
(declare-sort Creature 0)

; Predicates (unary relations)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)

(declare-fun shy (Creature) Bool)
(declare-fun wooden (Creature) Bool)
(declare-fun opaque (Creature) Bool)
(declare-fun floral (Creature) Bool)
(declare-fun bitter (Creature) Bool)
(declare-fun orange (Creature) Bool)
(declare-fun amenable (Creature) Bool)
(declare-fun small (Creature) Bool)

; Constants
(declare-const wren Creature)

; Knowledge base (rules)
; 1. Every dumpus is not shy.
(assert (forall ((x Creature))
  (=> (is-dumpus x) (not (shy x)))))

; 2. Each dumpus is a tumpus.
(assert (forall ((x Creature))
  (=> (is-dumpus x) (is-tumpus x))))

; 3. Rompuses are not wooden.
(assert (forall ((x Creature))
  (=> (is-rompus x) (not (wooden x)))))

; 4. Tumpuses are opaque.
(assert (forall ((x Creature))
  (=> (is-tumpus x) (opaque x))))

; 5. Every tumpus is a wumpus.
(assert (forall ((x Creature))
  (=> (is-tumpus x) (is-wumpus x))))

; 6. Wumpuses are not floral.
(assert (forall ((x Creature))
  (=> (is-wumpus x) (not (floral x)))))

; 7. Each wumpus is an impus.
(assert (forall ((x Creature))
  (=> (is-wumpus x) (is-impus x))))

; 8. Impuses are bitter.
(assert (forall ((x Creature))
  (=> (is-impus x) (bitter x))))

; 9. Every impus is a vumpus.
(assert (forall ((x Creature))
  (=> (is-impus x) (is-vumpus x))))

; 10. Vumpuses are small.
(assert (forall ((x Creature))
  (=> (is-vumpus x) (small x))))

; 11. Each vumpus is a numpus.
(assert (forall ((x Creature))
  (=> (is-vumpus x) (is-numpus x))))

; 12. Every numpus is wooden.
(assert (forall ((x Creature))
  (=> (is-numpus x) (wooden x))))

; 13. Each numpus is a yumpus.
(assert (forall ((x Creature))
  (=> (is-numpus x) (is-yumpus x))))

; 14. Each yumpus is orange.
(assert (forall ((x Creature))
  (=> (is-yumpus x) (orange x))))

; 15. Each yumpus is a jompus.
(assert (forall ((x Creature))
  (=> (is-yumpus x) (is-jompus x))))

; 16. Each jompus is amenable.
(assert (forall ((x Creature))
  (=> (is-jompus x) (amenable x))))

; 17. Every jompus is a zumpus.
(assert (forall ((x Creature))
  (=> (is-jompus x) (is-zumpus x))))

; 18. Wren is a tumpus.
(assert (is-tumpus wren))

; Question testing: Is Wren wooden?
; Test: Wren wooden -> satisfiable if this can be true given KB
(assert (wooden wren))

; Verify
(check-sat)
(get-model)