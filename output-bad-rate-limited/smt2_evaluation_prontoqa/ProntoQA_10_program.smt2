; Sorts
(declare-sort Thing 0)

; Predicates
(declare-fun is-impus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-rompuse (Thing) Bool)
(declare-fun is-amenable (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-sweet (Thing) Bool)

; Constants
(declare-const fae Thing)

; Knowledge base (universal rules)
(assert (forall ((x Thing)) (=> (is-impus x) (is-earthy x))))
(assert (forall ((x Thing)) (=> (is-impus x) (is-jompus x))))
(assert (forall ((x Thing)) (=> (is-jompus x) (is-small x))))
(assert (forall ((x Thing)) (=> (is-jompus x) (is-rompuse x))))
(assert (forall ((x Thing)) (=> (is-rompuse x) (not (is-amenable x)))))

(assert (forall ((x Thing)) (=> (is-rompuse x) (is-wumpus x))))
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-wooden x))))
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-zumpus x))))
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-temperate x))))
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-dumpus x))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-dull x))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-vumpus x))))
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-shy x))))) ;; not shy
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-sweet x)))) ;; yumpus -> sweet
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-numpus x))))
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-sweet x)))))
(assert (forall ((x Thing)) (=> (is-numpus x) (is-tumpus x))))

; Facts
(assert (is-wumpus fae))

; Test: Is Fae sweet?
(assert (is-sweet fae))

; Check satisfiability
(check-sat)