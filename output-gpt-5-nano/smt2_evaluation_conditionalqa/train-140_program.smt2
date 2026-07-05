; Question: Do I need to update the LPA record now that my sister has changed her name?

; Declare sorts
(declare-sort Person 0)
(declare-sort Name 0)

; Declare constants
(declare-const donor Person)
(declare-const sister Person)

; Predicate: has-name-change for a person (e.g., due to marriage)
(declare-fun has-name-change (Person) Bool)

; Policy: if an attorney's name changes, the LPA must be updated (update-needed becomes true)
(declare-const update-needed Bool)

; Facts: sister has changed her name
(assert (has-name-change sister))

; Rule linking name change to required update
(assert (=> (has-name-change sister) update-needed))

; Test scenario: assert that an update is needed
(assert update-needed)

; Check satisfiability to answer the question
(check-sat)
(get-model)