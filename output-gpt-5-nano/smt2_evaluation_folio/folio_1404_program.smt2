; Sort
(declare-sort Thing 0)

; Predicates
(declare-fun is-worksheet (Thing) Bool)
(declare-fun paper (Thing) Bool)
(declare-fun woodware (Thing) Bool)
(declare-fun biodegradable (Thing) Bool)
(declare-fun environment-friendly (Thing) Bool)
(declare-fun good (Thing) Bool)
(declare-fun bad (Thing) Bool)

; Witness for existential test (to check "There exists a worksheet that is bad")
(declare-const w Thing)

; Knowledge base (premises translated)
(assert (forall ((x Thing)) (=> (biodegradable x) (environment-friendly x))))
(assert (forall ((x Thing)) (=> (woodware x) (biodegradable x))))
(assert (forall ((x Thing)) (=> (paper x) (woodware x))))
(assert (forall ((x Thing)) (not (and (good x) (bad x)))))
(assert (forall ((x Thing)) (=> (environment-friendly x) (good x))))
(assert (forall ((x Thing)) (=> (is-worksheet x) (or (paper x) (environment-friendly x)))))

; Test: There exists a worksheet that is bad
(assert (and (is-worksheet w) (bad w)))

; Check satisfiability
(check-sat)