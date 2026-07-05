(declare-sort Thing 0)

; Predicates
(declare-fun zumpus (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun rompuses (Thing) Bool)
(declare-fun kind (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun fruity (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun metallic (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun transparent (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun brown (Thing) Bool)
(declare-fun nervous (Thing) Bool)

; Constants
(declare-const max Thing)

; Knowledge base
(assert (forall ((x Thing)) (=> (zumpus x) (not (nervous x)))))
(assert (forall ((x Thing)) (=> (zumpus x) (dumpus x))))
(assert (forall ((x Thing)) (=> (dumpus x) (vumpus x))))
(assert (forall ((x Thing)) (=> (vumpus x) (not (brown x)))))
(assert (forall ((x Thing)) (=> (vumpus x) (rompuses x))))
(assert (forall ((x Thing)) (=> (rompuses x) (kind x))))
(assert (forall ((x Thing)) (=> (rompuses x) (yumpus x))))
(assert (forall ((x Thing)) (=> (yumpus x) (large x))))
(assert (forall ((x Thing)) (=> (yumpus x) (tumpus x))))
(assert (forall ((x Thing)) (=> (tumpus x) (fruity x))))
(assert (forall ((x Thing)) (=> (tumpus x) (wumpus x))))
(assert (forall ((x Thing)) (=> (impus x) (metallic x))))
(assert (forall ((x Thing)) (=> (wumpus x) (not (metallic x)))))
(assert (forall ((x Thing)) (=> (wumpus x) (numpus x))))
(assert (forall ((x Thing)) (=> (numpus x) (not (transparent x)))))
(assert (forall ((x Thing)) (=> (numpus x) (jompus x))))

; Max is a vumpus
(assert (vumpus max))

; Test question: Is Max metallic?
(assert (metallic max))

; Solve and show a model if sat
(check-sat)
(get-model)