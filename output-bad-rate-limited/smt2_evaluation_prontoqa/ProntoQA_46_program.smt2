; Sorts
(declare-sort Entity 0)

; Predicates (uninterpreted)
(declare-fun Rompus (Entity) Bool)
(declare-fun Nervous (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Angry (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Earthy (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)

; Constant Sally
(declare-const sally Entity)

; Knowledge base
(assert (forall ((x Entity)) (=> (Rompus x) (Nervous x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Angry x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Earthy x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Numpus x))))
(assert (forall ((x Entity)) (=> (Numpus x) (not (Cold x)))))
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Opaque x)))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Wumpus x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Blue x))))
(assert (forall ((x Entity)) (=> (Wumpus x) (Vumpus x))))
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Metallic x)))))
(assert (forall ((x Entity)) (=> (Vumpus x) (Yumpus x))))

; Sally is a numpus
(assert (Numpus sally))

; Test scenario: Is Sally not metallic?
(assert (not (Metallic sally)))

(check-sat)
(get-model)