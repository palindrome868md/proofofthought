; Sort
(declare-sort Entity 0)

; Predicates (uninterpreted relations)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-spicy (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-dull (Entity) Bool)

; Constant
(declare-const wren Entity)

; Knowledge base (facts and rules)

; Wren is a tumpus
(assert (is-tumpus wren))

; 1. Every tumpus is large
(assert (forall ((p Entity)) (=> (is-tumpus p) (is-large p))))

; 2. Tumpuses are wumpuses
(assert (forall ((p Entity)) (=> (is-tumpus p) (is-wumpus p))))

; 3. Every wumpus is not opaque
(assert (forall ((p Entity)) (=> (is-wumpus p) (not (is-opaque p)))))

; 4. Every dumpus is not dull
(assert (forall ((p Entity)) (=> (is-dumpus p) (not (is-dull p)))))

; 5. Every wumpus is a rompus
(assert (forall ((p Entity)) (=> (is-wumpus p) (is-rompus p))))

; 6. Every rompus is brown
(assert (forall ((p Entity)) (=> (is-rompus p) (is-brown p))))

; 7. Each rompus is a vumpus
(assert (forall ((p Entity)) (=> (is-rompus p) (is-vumpus p))))

; 8. Each vumpus is temperate
(assert (forall ((p Entity)) (=> (is-vumpus p) (is-temperate p))))

; 9. Vumpuses are jompuses
(assert (forall ((p Entity)) (=> (is-vumpus p) (is-jompus p))))

; 10. Jompuses are dull
(assert (forall ((p Entity)) (=> (is-jompus p) (is-dull p))))

; 11. Jompuses are numpuses
(assert (forall ((p Entity)) (=> (is-jompus p) (is-numpus p))))

; 12. Every numpus is liquid
(assert (forall ((p Entity)) (=> (is-numpus p) (is-liquid p))))

; 13. Each numpus is an impus
(assert (forall ((p Entity)) (=> (is-numpus p) (is-impus p))))

; 14. Impuses are spicy
(assert (forall ((p Entity)) (=> (is-impus p) (is-spicy p))))

; 15. Every impus is a yumpus
(assert (forall ((p Entity)) (=> (is-impus p) (is-yumpus p))))

; 16. Every yumpus is not nervous
(assert (forall ((p Entity)) (=> (is-yumpus p) (not (is-nervous p)))))

; 17. Every yumpus is a zumpus
(assert (forall ((p Entity)) (=> (is-yumpus p) (is-zumpus p))))

; Test question: Is Wren dull?
(assert (is-dull wren))

; Check satisfiability (single check)
(check-sat)
(get-model)