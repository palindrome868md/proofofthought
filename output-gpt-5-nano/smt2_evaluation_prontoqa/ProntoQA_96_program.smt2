; Declare a generic domain of entities
(declare-sort Thing 0)

; Predicates (unary properties)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-bright (Thing) Bool)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-orange (Thing) Bool)
(declare-fun is-mean (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)

; Constant: Fae
(declare-const fae Thing)

; Knowledge base (rules)
(assert (forall ((x Thing)) (=> (is-impus x) (is-sour x))))
(assert (forall ((x Thing)) (=> (is-impus x) (is-vumpus x))))
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-cold x))))
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-zumpus x))))
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-luminous x)))))
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-numpus x))))
(assert (forall ((x Thing)) (=> (is-numpus x) (is-earthy x))))
(assert (forall ((x Thing)) (=> (is-numpus x) (is-yumpus x))))
(assert (forall ((x Thing)) (=> (is-yumpus x) (not (is-mean x)))))
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-bright x))))
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-rompus x))))
(assert (forall ((x Thing)) (=> (is-rompus x) (is-orange x))))
(assert (forall ((x Thing)) (=> (is-rompus x) (is-dumpus x))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-bright x)))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-jompus x))))
(assert (forall ((x Thing)) (=> (is-jompus x) (is-wumpus x))))
(assert (forall ((x Thing)) (=> (is-jompus x) (is-small x))))

; Fact: Fae is a zumpus
(assert (is-zumpus fae))

; Test: Is Fae bright?
(assert (is-bright fae))

; Check satisfiability
(check-sat)