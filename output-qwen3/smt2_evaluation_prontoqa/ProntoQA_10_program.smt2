; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-temperate (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-shy (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)

; 3. Declare Constants
(declare-const fae Entity)

; 4. Assert Knowledge Base (Rules and Facts)

; Rules regarding Impus
(assert (forall ((x Entity)) (=> (is-impus x) (is-earthy x))))
(assert (forall ((x Entity)) (=> (is-impus x) (is-jompus x))))

; Rules regarding Jompus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-small x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-rompus x))))

; Rules regarding Rompus
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-amenable x)))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-wumpus x))))

; Rules regarding Wumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-wooden x))))
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-zumpus x))))

; Rules regarding Zumpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-temperate x))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-dumpus x))))

; Rules regarding Dumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-dull x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-vumpus x))))

; Rules regarding Vumpus
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-shy x)))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-numpus x))))

; Rules regarding Yumpus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-sweet x))))

; Rules regarding Numpus
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-sweet x)))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-tumpus x))))

; Fact: Fae is a wumpus
(assert (is-wumpus fae))

; 5. Verification
; Question: Is Fae sweet?
; We assert the statement to test its consistency with the Knowledge Base.
(assert (is-sweet fae))

; Check satisfiability
(check-sat)
(get-model)