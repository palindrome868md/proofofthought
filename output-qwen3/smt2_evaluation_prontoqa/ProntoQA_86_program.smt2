; 1. Declare sorts
(declare-sort Creature 0)

; 2. Declare constants
(declare-const stella Creature)

; 3. Declare functions (predicates)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-rompus (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-luminous (Creature) Bool)
(declare-fun is-spicy (Creature) Bool)
(declare-fun is-fruity (Creature) Bool)
(declare-fun is-small (Creature) Bool)
(declare-fun is-shy (Creature) Bool)
(declare-fun is-temperate (Creature) Bool)
(declare-fun is-bright (Creature) Bool)
(declare-fun is-amenable (Creature) Bool)

; 4. Assert knowledge base (facts and rules)

; Zumpuses are luminous
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-luminous x))))

; Each zumpus is a tumpus
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-tumpus x))))

; Each tumpus is not spicy
(assert (forall ((x Creature)) (=> (is-tumpus x) (not (is-spicy x)))))

; Tumpuses are vumpuses
(assert (forall ((x Creature)) (=> (is-tumpus x) (is-vumpus x))))

; Vumpuses are not fruity
(assert (forall ((x Creature)) (=> (is-vumpus x) (not (is-fruity x)))))

; Every vumpus is an impus
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-impus x))))

; Each impus is small
(assert (forall ((x Creature)) (=> (is-impus x) (is-small x))))

; Rompuses are not shy
(assert (forall ((x Creature)) (=> (is-rompus x) (not (is-shy x)))))

; Impuses are yumpuses
(assert (forall ((x Creature)) (=> (is-impus x) (is-yumpus x))))

; Each yumpus is temperate
(assert (forall ((x Creature)) (=> (is-yumpus x) (is-temperate x))))

; Every yumpus is a jompus
(assert (forall ((x Creature)) (=> (is-yumpus x) (is-jompus x))))

; Each jompus is bright
(assert (forall ((x Creature)) (=> (is-jompus x) (is-bright x))))

; Each jompus is a wumpus
(assert (forall ((x Creature)) (=> (is-jompus x) (is-wumpus x))))

; Wumpuses are amenable
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-amenable x))))

; Each wumpus is a dumpus
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-dumpus x))))

; Dumpuses are shy
(assert (forall ((x Creature)) (=> (is-dumpus x) (is-shy x))))

; Dumpuses are numpuses
(assert (forall ((x Creature)) (=> (is-dumpus x) (is-numpus x))))

; Stella is an impus
(assert (is-impus stella))

; 5. Check satisfiability
; Question: Is the statement "Stella is not shy" true?
; We assert the statement. If unsat, the statement is False.
(assert (not (is-shy stella)))

(check-sat)
(get-model)