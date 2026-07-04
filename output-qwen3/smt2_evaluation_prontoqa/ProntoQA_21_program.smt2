; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Constants
(declare-const max Entity)

; 3. Declare Functions (Predicates)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)

; 4. Assert Knowledge Base (Facts and Rules)

; Fact: Max is a dumpus
(assert (is-dumpus max))

; Rule: Vumpuses are earthy
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-earthy x))))

; Rule: Vumpuses are dumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-dumpus x))))

; Rule: Dumpuses are not wooden
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-wooden x)))))

; Rule: Dumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-numpus x))))

; Rule: Every numpus is kind
(assert (forall ((x Entity)) (=> (is-numpus x) (is-kind x))))

; Rule: Each numpus is a rompus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-rompus x))))

; Rule: Each rompus is small
(assert (forall ((x Entity)) (=> (is-rompus x) (is-small x))))

; Rule: Every rompus is a jompus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-jompus x))))

; Rule: Every jompus is bright
(assert (forall ((x Entity)) (=> (is-jompus x) (is-bright x))))

; Rule: Jompuses are yumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-yumpus x))))

; Rule: Yumpuses are orange
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-orange x))))

; Rule: Every yumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-zumpus x))))

; Rule: Zumpuses are sour
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-sour x))))

; Rule: Zumpuses are impuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-impus x))))

; Rule: Impuses are transparent
(assert (forall ((x Entity)) (=> (is-impus x) (is-transparent x))))

; Rule: Tumpuses are not orange
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-orange x)))))

; Rule: Each impus is a wumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-wumpus x))))

; 5. Verification: Test if "Max is orange" is consistent with the KB
(assert (is-orange max))

; 6. Check Satisfiability
(check-sat)
(get-model)