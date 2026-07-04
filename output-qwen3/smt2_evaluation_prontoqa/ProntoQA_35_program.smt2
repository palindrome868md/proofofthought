; Reasoning Steps:
; 1. Fae is a jompus (Given Fact).
; 2. Each jompus is a wumpus (Rule) -> Fae is a wumpus.
; 3. Wumpuses are impuses (Rule) -> Fae is an impus.
; 4. Every impus is a yumpus (Rule) -> Fae is a yumpus.
; 5. Every yumpus is a dumpus (Rule) -> Fae is a dumpus.
; 6. Dumpuses are orange (Rule) -> Fae is orange.
; Conclusion: The statement "Fae is orange" is logically derived as True.
; Verification Strategy: Assert the knowledge base, assert (is-orange Fae), and check satisfiability.
; Expected Result: sat (True).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (Predicates for categories)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)

; 2. Declare functions (Predicates for properties)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-aggressive (Entity) Bool)

; 3. Declare constants
(declare-const Fae Entity)

; 4. Assert knowledge base (Rules)
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-wooden x)))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-vumpus x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-sour x)))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-jompus x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-floral x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-transparent x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-impus x))))
(assert (forall ((x Entity)) (=> (is-impus x) (is-dull x))))
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-feisty x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-orange x)))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-dumpus x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-orange x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-rompus x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-aggressive x)))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-tumpus x))))

; 4. Assert knowledge base (Facts)
(assert (is-jompus Fae))

; 5. Verification
; Test: Is Fae orange?
(assert (is-orange Fae))

(check-sat)
(get-model)