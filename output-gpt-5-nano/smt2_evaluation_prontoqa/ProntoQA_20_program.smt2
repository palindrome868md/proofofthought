(declare-sort Thing 0)

; Predicates
(declare-fun yumpus (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun opaque (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun shy (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun sour (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun brown (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun rompuses (Thing) Bool)
(declare-fun luminous (Thing) Bool)
(declare-fun impuses (Thing) Bool)

; Small predicate (optional for consistency with "not small")
(declare-fun small (Thing) Bool)

; Constants
(declare-const Stella Thing)

; Knowledge base
(assert (forall ((x Thing)) (=> (yumpus x) (not (small x)))))
(assert (forall ((x Thing)) (=> (yumpus x) (dumpus x))))
(assert (forall ((x Thing)) (=> (dumpus x) (opaque x))))
(assert (forall ((x Thing)) (=> (dumpus x) (jompus x))))
(assert (forall ((x Thing)) (=> (jompus x) (shy x))))
(assert (forall ((x Thing)) (=> (numpus x) (sour x))))
(assert (forall ((x Thing)) (=> (jompus x) (tumpus x))))
(assert (forall ((x Thing)) (=> (tumpus x) (brown x))))
(assert (forall ((x Thing)) (=> (tumpus x) (vumpus x))))
(assert (forall ((x Thing)) (=> (vumpus x) (dull x))))
(assert (forall ((x Thing)) (=> (vumpus x) (wumpus x))))
(assert (forall ((x Thing)) (=> (wumpus x) (not (sour x)))))
(assert (forall ((x Thing)) (=> (wumpus x) (rompuses x))))
(assert (forall ((x Thing)) (=> (rompuses x) (not (luminous x)))))
(assert (forall ((x Thing)) (=> (rompuses x) (impuses x))))
(assert (dumpus Stella))

; Test: Stella is sour
(assert (sour Stella))

(check-sat)