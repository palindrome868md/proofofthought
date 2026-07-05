; Declared sort for all entities
(declare-sort Thing 0)

; Predicates representing each category/property
(declare-fun Dumpuse  (Thing) Bool)
(declare-fun Rompuse (Thing) Bool)
(declare-fun Red     (Thing) Bool)
(declare-fun Numpus  (Thing) Bool)
(declare-fun Dull    (Thing) Bool)
(declare-fun Yumpus  (Thing) Bool)
(declare-fun Happy   (Thing) Bool)
(declare-fun Tumpus  (Thing) Bool)
(declare-fun Zumpus  (Thing) Bool)
(declare-fun Vumpus  (Thing) Bool)
(declare-fun Impuse   (Thing) Bool)
(declare-fun Wumpus  (Thing) Bool)
(declare-fun Jompus  (Thing) Bool)
(declare-fun Earthy  (Thing) Bool)
(declare-fun Large   (Thing) Bool)
(declare-fun Liquid  (Thing) Bool)
(declare-fun Kind    (Thing) Bool)

; Sam as an individual
(declare-const sam Thing)

; Knowledge base (universal rules)
(assert (forall ((x Thing)) (=> (Dumpuse x) (Rompuse x))))
(assert (forall ((x Thing)) (=> (Dumpuse x) (Cold x))))  ; Dumpuses are cold (need Cold)
(assert (forall ((x Thing)) (=> (Rompuse x) (Red x))))
(assert (forall ((x Thing)) (=> (Rompuse x) (Numpus x))))
(assert (forall ((x Thing)) (=> (Numpus x) (Dull x))))
(assert (forall ((x Thing)) (=> (Numpus x) (Yumpus x))))
(assert (forall ((x Thing)) (=> (Yumpus x) (Happy x))))
(assert (forall ((x Thing)) (=> (Yumpus x) (Tumpus x))))
(assert (forall ((x Thing)) (=> (Tumpus x) (not (Kind x)))))
(assert (forall ((x Thing)) (=> (Tumpus x) (Zumpus x))))
(assert (forall ((x Thing)) (=> (Zumpus x) (Large x))))
(assert (forall ((x Thing)) (=> (Zumpus x) (Vumpus x))))
(assert (forall ((x Thing)) (=> (Vumpus x) (Earthy x))))
(assert (forall ((x Thing)) (=> (Vumpus x) (Impuse x))))
(assert (forall ((x Thing)) (=> (Impuse x) (Wumpus x))))
(assert (forall ((x Thing)) (=> (Impuse x) (not (Liquid x))))))
(assert (forall ((x Thing)) (=> (Jompus x) (not (Earthy x)))))

; Additional facts needed for the chain (some predicates not yet used in rules)
; Sam is a numpus
(assert (Numpus sam))

; Note: The rule "Dumpuses are cold" uses Cold; declare the predicate usage:
(declare-fun Cold (Thing) Bool)

; Test: Is "Sam is not earthy" true?
; We test the proposition directly by asserting its negation to see if it's contradicted.
(assert (not (Earthy sam)))

; Check satisfiability to answer the question
(check-sat)