; Sorts
(declare-sort Thing 0)

; Predicates (uninterpreted)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)

; Additional properties
(declare-fun opaque (Thing) Bool)
(declare-fun floral (Thing) Bool)
(declare-fun hot (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun spicy (Thing) Bool)
(declare-fun amenable (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun metallic (Thing) Bool)

; Constants
(declare-const Max Thing)

; Knowledge base (the given rules)
(assert (forall ((x Thing)) (=> (is-yumpus x) (opaque x))))
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-dumpus x))))
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (dull x)))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (floral x))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-zumpus x))))
(assert (forall ((x Thing)) (=> (is-zumpus x) (hot x))))
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-impus x))))
(assert (forall ((x Thing)) (=> (is-impus x) (large x))))
(assert (forall ((x Thing)) (=> (is-impus x) (is-rompus x))))
(assert (forall ((x Thing)) (=> (is-rompus x) (spicy x))))
(assert (forall ((x Thing)) (=> (is-rompus x) (is-numpus x))))
(assert (forall ((x Thing)) (=> (is-numpus x) (amenable x))))
(assert (forall ((x Thing)) (=> (is-numpus x) (is-jompus x))))
(assert (forall ((x Thing)) (=> (is-jompus x) (dull x))))
(assert (forall ((x Thing)) (=> (is-jompus x) (is-wumpus x))))
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (metallic x)))))
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-tumpus x))))

; Fact: Max is a zumpus
(assert (is-zumpus Max))

; Question: Max is dull?
(assert (dull Max))

; Check and (optional) model
(check-sat)
(get-model)