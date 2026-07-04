; Declare sort
(declare-sort Thing 0)

; Declare predicates
(declare-fun is-cold (Thing) Bool)
(declare-fun is-green (Thing) Bool)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-quiet (Thing) Bool)
(declare-fun is-red (Thing) Bool)

; Declare constants
(declare-const bob Thing)
(declare-const erin Thing)
(declare-const gary Thing)
(declare-const harry Thing)

; Facts about Bob
(assert (is-cold bob))
(assert (is-green bob))
(assert (is-kind bob))
(assert (is-quiet bob))

; Facts about Erin
(assert (is-kind erin))
(assert (is-quiet erin))

; Facts about Gary
(assert (is-cold gary))
(assert (is-green gary))
(assert (is-quiet gary))
(assert (is-red gary))

; Facts about Harry
(assert (is-cold harry))
(assert (is-red harry))

; Rules
; All cold things are kind
(assert (forall ((x Thing)) (=> (is-cold x) (is-kind x))))

; If something is kind then it is green
(assert (forall ((x Thing)) (=> (is-kind x) (is-green x))))

; Test: Is Gary kind?
(assert (is-kind gary))

; Check satisfiability
(check-sat)
(get-model)