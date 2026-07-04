(declare-sort Entity 0)

; Category predicates
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)

; Property predicates
(declare-fun is-orange (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)

; Constant
(declare-const fae Entity)

; Rules
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-orange x))))
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-numpus x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-small x))))
(assert (forall ((x Entity)) (=> (is-numpus x) (is-vumpus x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-sour x))))
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-dumpus x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-cold x))))
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-zumpus x))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-dull x))))
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-yumpus x))))
(assert (forall ((x Entity)) (=> (is-jompus x) (is-floral x))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-amenable x)))))
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-rompus x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-opaque x))))
(assert (forall ((x Entity)) (=> (is-rompus x) (is-impus x))))
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-floral x)))))
(assert (forall ((x Entity)) (=> (is-impus x) (is-wumpus x))))

; Fact: Fae is a dumpus
(assert (is-dumpus fae))

; Verification: Test the statement "Fae is not floral"
(assert (not (is-floral fae)))

; Check satisfiability
(check-sat)
(get-model)