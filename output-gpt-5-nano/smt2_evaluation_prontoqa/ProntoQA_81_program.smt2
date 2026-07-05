; Declare the domain of discourse
(declare-sort Thing 0)

; Predicates representing properties and kinds
(declare-fun Jompus (Thing) Bool)
(declare-fun Wumpus (Thing) Bool)
(declare-fun Dumpus (Thing) Bool)
(declare-fun Numpus (Thing) Bool)
(declare-fun Vumpus (Thing) Bool)
(declare-fun Tumpus (Thing) Bool)
(declare-fun Zumpus (Thing) Bool)
(declare-fun Impus (Thing) Bool)
(declare-fun Rompus (Thing) Bool)
(declare-fun Yumpus (Thing) Bool)

; Additional properties used in chains
(declare-fun Dull (Thing) Bool)
(declare-fun Floral (Thing) Bool)
(declare-fun Luminous (Thing) Bool)
(declare-fun Orange (Thing) Bool)
(declare-fun Large (Thing) Bool)
(declare-fun Opaque (Thing) Bool)
(declare-fun Temperate (Thing) Bool)
(declare-fun Spicy (Thing) Bool)

; Sam as a constant individual
(declare-const Sam Thing)

; Knowledge base (universal rules)
(assert (forall ((x Thing)) (=> (Jompus x) (not (Dull x)))))
(assert (forall ((x Thing)) (=> (Wumpus x) (Opaque x))))
(assert (forall ((x Thing)) (=> (Wumpus x) (Dumpus x))))
(assert (forall ((x Thing)) (=> (Dumpus x) (not (Floral x)))))
(assert (forall ((x Thing)) (=> (Dumpus x) (Numpus x))))
(assert (forall ((x Thing)) (=> (Numpus x) (not (Luminous x)))))
(assert (forall ((x Thing)) (=> (Numpus x) (Vumpus x))))
(assert (forall ((x Thing)) (=> (Vumpus x) (Large x))))
(assert (forall ((x Thing)) (=> (Vumpus x) (Tumpus x))))
(assert (forall ((x Thing)) (=> (Tumpus x) (not (Orange x)))))
(assert (forall ((x Thing)) (=> (Tumpus x) (Zumpus x))))
(assert (forall ((x Thing)) (=> (Zumpus x) (Dull x))))
(assert (forall ((x Thing)) (=> (Zumpus x) (Impus x))))
(assert (forall ((x Thing)) (=> (Impus x) (Spicy x))))
(assert (forall ((x Thing)) (=> (Impus x) (Rompus x))))
(assert (forall ((x Thing)) (=> (Rompus x) (not (Temperate x)))))
(assert (forall ((x Thing)) (=> (Rompus x) (Yumpus x))))

; Fact: Sam is a dumpus
(assert (Dumpus Sam))

; Test scenario: Sam is dull
(assert (Dull Sam))

; Check and retrieve a model
(check-sat)
(get-model)