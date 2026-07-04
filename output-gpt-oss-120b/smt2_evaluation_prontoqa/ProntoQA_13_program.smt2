; ---------- Sort ----------
(declare-sort Creature 0)

; ---------- Predicates ----------
(declare-fun yumpus   (Creature) Bool)
(declare-fun opaque   (Creature) Bool)
(declare-fun dumpus   (Creature) Bool)
(declare-fun vumpus   (Creature) Bool)
(declare-fun dull     (Creature) Bool)
(declare-fun floral   (Creature) Bool)
(declare-fun zumpus   (Creature) Bool)
(declare-fun hot      (Creature) Bool)
(declare-fun impus    (Creature) Bool)
(declare-fun large    (Creature) Bool)
(declare-fun rompus   (Creature) Bool)
(declare-fun spicy    (Creature) Bool)
(declare-fun numpus   (Creature) Bool)
(declare-fun amenable (Creature) Bool)
(declare-fun jompus   (Creature) Bool)
(declare-fun wumpus   (Creature) Bool)
(declare-fun metallic (Creature) Bool)
(declare-fun tumpus   (Creature) Bool)

; ---------- Constants ----------
(declare-const Max Creature)

; ---------- Knowledge base ----------
; 1. Each yumpus is opaque.
(assert (forall ((x Creature))
  (=> (yumpus x) (opaque x))))

; 2. Each yumpus is a dumpus.
(assert (forall ((x Creature))
  (=> (yumpus x) (dumpus x))))

; 3. Vumpuses are not dull.
(assert (forall ((x Creature))
  (=> (vumpus x) (not (dull x)))))

; 4. Dumpuses are floral.
(assert (forall ((x Creature))
  (=> (dumpus x) (floral x))))

; 5. Each dumpus is a zumpus.
(assert (forall ((x Creature))
  (=> (dumpus x) (zumpus x))))

; 6. Each zumpus is hot.
(assert (forall ((x Creature))
  (=> (zumpus x) (hot x))))

; 7. Every zumpus is an impus.
(assert (forall ((x Creature))
  (=> (zumpus x) (impus x))))

; 8. Each impus is large.
(assert (forall ((x Creature))
  (=> (impus x) (large x))))

; 9. Every impus is a rompus.
(assert (forall ((x Creature))
  (=> (impus x) (rompus x))))

;10. Rompuses are spicy.
(assert (forall ((x Creature))
  (=> (rompus x) (spicy x))))

;11. Each rompus is a numpus.
(assert (forall ((x Creature))
  (=> (rompus x) (numpus x))))

;12. Numpuses are amenable.
(assert (forall ((x Creature))
  (=> (numpus x) (amenable x))))

;13. Each numpus is a jompus.
(assert (forall ((x Creature))
  (=> (numpus x) (jompus x))))

;14. Jompuses are dull.
(assert (forall ((x Creature))
  (=> (jompus x) (dull x))))

;15. Each jompus is a wumpus.
(assert (forall ((x Creature))
  (=> (jompus x) (wumpus x))))

;16. Wumpuses are not metallic.
(assert (forall ((x Creature))
  (=> (wumpus x) (not (metallic x)))))

;17. Every wumpus is a tumpus.
(assert (forall ((x Creature))
  (=> (wumpus x) (tumpus x))))

; Fact: Max is a zumpus.
(assert (zumpus Max))

; ---------- Question to verify ----------
; Is Max dull?
(assert (dull Max))

; ---------- Solve ----------
(check-sat)
(get-model)