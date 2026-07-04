; Sorts
(declare-sort Entity 0)

; Predicates (uninterpreted relations)
(declare-fun numpus (Entity) Bool)
(declare-fun opaque (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun feisty (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun fruity (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun wooden (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun spicy (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun dull (Entity) Bool)

; Constant representing Sam
(declare-const sam Entity)

; Knowledge base: universal rules (one-directional implications)

; 1. numpus -> not opaque
(assert (forall ((x Entity)) (=> (numpus x) (not (opaque x)))))

; 2. numpus -> wumpus
(assert (forall ((x Entity)) (=> (numpus x) (wumpus x))))

; 3. wumpus -> feisty
(assert (forall ((x Entity)) (=> (wumpus x) (feisty x))))

; 4. wumpus -> tumpus
(assert (forall ((x Entity)) (=> (wumpus x) (tumpus x))))

; 5. tumpus -> fruity
(assert (forall ((x Entity)) (=> (tumpus x) (fruity x))))

; 6. tumpus -> dumpus
(assert (forall ((x Entity)) (=> (tumpus x) (dumpus x))))

; 7. dumpus -> wooden
(assert (forall ((x Entity)) (=> (dumpus x) (wooden x))))

; 8. dumpus -> yumpus
(assert (forall ((x Entity)) (=> (dumpus x) (yumpus x))))

; 9. yumpus -> blue
(assert (forall ((x Entity)) (=> (yumpus x) (blue x))))

; 10. yumpus -> zumpus
(assert (forall ((x Entity)) (=> (yumpus x) (zumpus x))))

; 11. zumpus -> spicy
(assert (forall ((x Entity)) (=> (zumpus x) (spicy x))))

; 12. zumpus -> impus
(assert (forall ((x Entity)) (=> (zumpus x) (impus x))))

; 13. impus -> not kind
(assert (forall ((x Entity)) (=> (impus x) (not (kind x)))))

; 14. impus -> rompus
(assert (forall ((x Entity)) (=> (impus x) (rompus x))))

; 15. jompus -> not dull
(assert (forall ((x Entity)) (=> (jompus x) (not (dull x)))))

; 16. rompus -> dull
(assert (forall ((x Entity)) (=> (rompus x) (dull x))))

; 17. rompus -> vumpus
(assert (forall ((x Entity)) (=> (rompus x) (vumpus x))))

; Facts about Sam
(assert (dumpus sam))

; Query: Is Sam not dull?
(assert (not (dull sam)))

; Check the satisfiability of the scenario
(check-sat)