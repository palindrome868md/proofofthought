; Scenario: Will I be allowed to include him in my will?

; Sorts
(declare-sort Person 0)
(declare-sort Will 0)

; Constants
(declare-const you Person)
(declare-const partner Person)

; Will constants
(declare-const old-will Will)
(declare-const new-will Will)

; Predicates
(declare-fun remarried (Person) Bool)
(declare-fun after-remarriage (Person Will) Bool)
(declare-fun includes (Will Person) Bool)

; Knowledge base (facts and rules)
; You remarried
(assert (remarried you))

; There is a will made after remarriage
(assert (after-remarriage you new-will))

; If a will is made after remarriage, it can include the partner
(assert (=> (after-remarriage you new-will) (includes new-will partner)))

; Test scenario: Would you be allowed to include your partner in your will?
; We assert that the new will includes the partner
(assert (includes new-will partner))

; Check satisfiability
(check-sat)
(get-model)