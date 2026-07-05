; Sorts
(declare-sort Person 0)

; Constants
(declare-const me Person)
(declare-const spouse Person)

; Age and residency data
(declare-const me-age Int)
(declare-fun years-in-uk (Person) Int)

; Marriage validity predicates
(declare-fun is-void-marriage (Person Person) Bool)
(declare-fun is-voidable-marriage (Person Person) Bool)

; Decision predicate
(declare-fun can-file-annulment (Person) Bool)

; Knowledge base (the scenario)
(assert (>= me-age 24))
(assert (>= (years-in-uk me) 2))
; You are married to a cousin, which the model treats as a 'void' marriage
(assert (is-void-marriage me spouse))

; Residency requirement: at least 1 year in the UK (as per guidance)
(assert (>= (years-in-uk me) 1))

; If the marriage is void or voidable and residency requirement is met, you can file
(assert (=> (and (or (is-void-marriage me spouse)
                    (is-voidable-marriage me spouse))
                 (>= (years-in-uk me) 1))
            (can-file-annulment me)))

; Test scenario: Can I file an annulment?
(assert (can-file-annulment me))

; Check satisfiability and model
(check-sat)
(get-model)