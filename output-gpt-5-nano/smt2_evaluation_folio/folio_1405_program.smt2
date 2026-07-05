; Declare sorts
(declare-sort Thing 0)

; Declare predicates
(declare-fun biodegradable (Thing) Bool)
(declare-fun environment_friendly (Thing) Bool)
(declare-fun woodware (Thing) Bool)
(declare-fun paper (Thing) Bool)
(declare-fun good (Thing) Bool)
(declare-fun bad (Thing) Bool)

; Declare constants
(declare-const worksheet Thing)

; Knowledge base
(assert (forall ((x Thing)) (=> (biodegradable x) (environment_friendly x))))
(assert (forall ((x Thing)) (=> (woodware x) (biodegradable x))))
(assert (forall ((x Thing)) (=> (paper x) (woodware x))))
(assert (forall ((x Thing)) (not (and (good x) (bad x)))))
(assert (forall ((x Thing)) (=> (environment_friendly x) (good x))))
; A worksheet is either paper or environment-friendly
(assert (or (paper worksheet) (environment_friendly worksheet)))

; Test: A worksheet is not bad
(assert (not (bad worksheet)))

; Check satisfiability
(check-sat)
(get-model)