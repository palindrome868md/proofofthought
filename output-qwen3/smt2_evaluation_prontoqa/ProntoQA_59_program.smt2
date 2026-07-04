; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)

; 3. Declare constants
(declare-const Max Entity)

; 4. Assert knowledge base (facts and rules)

; Each rompus is mean.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-mean x))))

; Every rompus is a wumpus.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-wumpus x))))

; Each tumpus is nervous.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-nervous x))))

; Wumpuses are brown.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-brown x))))

; Wumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-yumpus x))))

; Every yumpus is large.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-large x))))

; Yumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-vumpus x))))

; Each vumpus is dull.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-dull x))))

; Vumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-zumpus x))))

; Zumpuses are earthy.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-earthy x))))

; Every zumpus is a numpus.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-numpus x))))

; Numpuses are not sour.
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-sour x)))))

; Numpuses are impuses.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-impus x))))

; Impuses are transparent.
(assert (forall ((x Entity)) (=> (is-impus x) (is-transparent x))))

; Each impus is a dumpus.
(assert (forall ((x Entity)) (=> (is-impus x) (is-dumpus x))))

; Dumpuses are not nervous.
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-nervous x)))))

; Dumpuses are jompuses.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-jompus x))))

; Max is a vumpus.
(assert (is-vumpus Max))

; 5. Verification: Test the statement "Max is not nervous"
(assert (not (is-nervous Max)))

; 6. Check satisfiability
(check-sat)
(get-model)