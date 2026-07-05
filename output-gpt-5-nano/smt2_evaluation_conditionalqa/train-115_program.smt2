; Sorts
(declare-sort Person 0)

; Constants
(declare-const donor Person)
(declare-const daughter Person)

; Predicates
(declare-fun adult (Person) Bool)
(declare-fun willing (Person) Bool)

; Knowledge base
(assert (adult donor))
(assert (adult daughter))
(assert (not (willing daughter)))

; Test scenario: appointing daughter as attorney (requires willingness)
(assert (and (adult donor) (adult daughter) (willing daughter)))

; Check satisfiability
(check-sat)
(get-model)