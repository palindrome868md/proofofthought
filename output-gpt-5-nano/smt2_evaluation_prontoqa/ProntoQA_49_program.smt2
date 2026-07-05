; Sorts
(declare-sort Thing 0)

; Constants
(declare-const wren Thing)

; Predicates (uninterpreted relations)
(declare-fun Wumpus (Thing) Bool)
(declare-fun Rompus (Thing) Bool)
(declare-fun Dumpus (Thing) Bool)
(declare-fun Numpus (Thing) Bool)
(declare-fun Zumpus (Thing) Bool)
(declare-fun Tumpus (Thing) Bool)
(declare-fun Vumpus (Thing) Bool)
(declare-fun Jompus (Thing) Bool)
(declare-fun Yumpus (Thing) Bool)
(declare-fun Impuse (Thing) Bool)

; Properties
(declare-fun Dull (Thing) Bool)
(declare-fun Cold (Thing) Bool)
(declare-fun Earthy (Thing) Bool)
(declare-fun Feisty (Thing) Bool)
(declare-fun Opaque (Thing) Bool)
(declare-fun Liquid (Thing) Bool)
(declare-fun Spicy (Thing) Bool)
(declare-fun Mean (Thing) Bool)

; Knowledge Base
(assert (forall ((x Thing)) (=> (Wumpus x) (Dull x))))
(assert (forall ((x Thing)) (=> (Wumpus x) (Rompus x))))
(assert (forall ((x Thing)) (=> (Rompus x) (not (Cold x)))))
(assert (forall ((x Thing)) (=> (Rompus x) (Dumpus x))))
(assert (forall ((x Thing)) (=> (Dumpus x) (Feisty x))))
(assert (forall ((x Thing)) (=> (Dumpus x) (Numpus x))))
(assert (forall ((x Thing)) (=> (Numpus x) (Mean x))))
(assert (forall ((x Thing)) (=> (Numpus x) (Zumpus x))))
(assert (forall ((x Thing)) (=> (Zumpus x) (not (Earthy x)))))
(assert (forall ((x Thing)) (=> (Zumpus x) (Tumpus x))))
(assert (forall ((x Thing)) (=> (Tumpus x) (Opaque x))))
(assert (forall ((x Thing)) (=> (Impuse x) (Liquid x))))
(assert (forall ((x Thing)) (=> (Tumpus x) (Vumpus x))))
(assert (forall ((x Thing)) (=> (Vumpus x) (not (Liquid x)))))
(assert (forall ((x Thing)) (=> (Vumpus x) (Jompus x))))
(assert (forall ((x Thing)) (=> (Jompus x) (not (Spicy x)))))
(assert (forall ((x Thing)) (=> (Jompus x) (Yumpus x))))
(assert (Dumpus wren))

; Query: Is Wren liquid?
(assert (Liquid wren))

; Check satisfiability
(check-sat)