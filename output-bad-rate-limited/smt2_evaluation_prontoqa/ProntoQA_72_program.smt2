; Declare sorts
(declare-sort Creature 0)

; Declare predicates
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-small (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-aggressive (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-bright (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-liquid (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-orange (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-transparent (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-fruity (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-sour (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)

; Declare constants
(declare-const sam Creature)

; Knowledge base
; 1. Tumpuses are not small
(assert (forall ((x Creature)) (=> (is-tumpus x) (not (is-small x)))))

; 2. Tumpuses are yumpuses
(assert (forall ((x Creature)) (=> (is-tumpus x) (is-yumpus x))))

; 3. Every yumpus is aggressive
(assert (forall ((x Creature)) (=> (is-yumpus x) (is-aggressive x))))

; 4. Each yumpus is a wumpus
(assert (forall ((x Creature)) (=> (is-yumpus x) (is-wumpus x))))

; 5. Every wumpus is bright
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-bright x))))

; 6. Each wumpus is a jompus
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-jompus x))))

; 7. Jompuses are not liquid
(assert (forall ((x Creature)) (=> (is-jompus x) (not (is-liquid x)))))

; 8. Every jompus is a vumpus
(assert (forall ((x Creature)) (=> (is-jompus x) (is-vumpus x))))

; 9. Every vumpus is orange
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-orange x))))

; 10. Every vumpus is an impus
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-impus x))))

; 11. Every impus is not transparent
(assert (forall ((x Creature)) (=> (is-impus x) (not (is-transparent x)))))

; 12. Each impus is a zumpus
(assert (forall ((x Creature)) (=> (is-impus x) (is-zumpus x))))

; 13. Every zumpus is fruity
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-fruity x))))

; 14. Every zumpus is a numpus
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-numpus x))))

; 15. Every numpus is sour
(assert (forall ((x Creature)) (=> (is-numpus x) (is-sour x))))

; 16. Rompuses are not fruity
(assert (forall ((x Creature)) (=> (is-rompus x) (not (is-fruity x)))))

; 17. Numpuses are dumpuses
(assert (forall ((x Creature)) (=> (is-numpus x) (is-dumpus x))))

; 18. Sam is a wumpus
(assert (is-wumpus sam))

; 19. Test: Is Sam fruity?
(assert (is-fruity sam))

; 20. Check satisfiability and get model
(check-sat)
(get-model)