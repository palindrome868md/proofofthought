; 1. Declare sorts
(declare-sort Creature 0)

; 2. Declare functions (predicates)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-spicy (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-small (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-opaque (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-floral (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-cold (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-bright (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-nervous (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-mean (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)

; 3. Declare constants
(declare-const Wren Creature)

; 4. Assert knowledge base (Rules)
(assert (forall ((x Creature)) (=> (is-numpus x) (is-spicy x))))
(assert (forall ((x Creature)) (=> (is-dumpus x) (not (is-small x)))))
(assert (forall ((x Creature)) (=> (is-numpus x) (is-yumpus x))))
(assert (forall ((x Creature)) (=> (is-yumpus x) (not (is-opaque x)))))
(assert (forall ((x Creature)) (=> (is-yumpus x) (is-wumpus x))))
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-floral x))))
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-tumpus x))))
(assert (forall ((x Creature)) (=> (is-tumpus x) (is-cold x))))
(assert (forall ((x Creature)) (=> (is-tumpus x) (is-vumpus x))))
(assert (forall ((x Creature)) (=> (is-vumpus x) (not (is-bright x)))))
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-impus x))))
(assert (forall ((x Creature)) (=> (is-impus x) (is-nervous x))))
(assert (forall ((x Creature)) (=> (is-impus x) (is-jompus x))))
(assert (forall ((x Creature)) (=> (is-jompus x) (is-mean x))))
(assert (forall ((x Creature)) (=> (is-jompus x) (is-zumpus x))))
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-small x))))
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-rompus x))))

; Assert knowledge base (Facts)
(assert (is-tumpus Wren))

; 5. Verification: Test the statement "Wren is not small"
; Logic Chain: Wren is Tumpus -> Vumpus -> Impus -> Jompus -> Zumpus -> Small.
; Therefore, Wren IS small. The statement "Wren is not small" contradicts the KB.
; Expected result: unsat (False)
(assert (not (is-small Wren)))

; 6. Check satisfiability
(check-sat)
(get-model)