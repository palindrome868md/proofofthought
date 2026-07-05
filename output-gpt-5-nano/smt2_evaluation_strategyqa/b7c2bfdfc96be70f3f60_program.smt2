; Question: Can the Powerpuff Girls form a complete tag team wrestling match?

; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun is-powerpuff (Person) Bool)
(declare-fun can-form-match (Person Person Person Person) Bool)

; Participants
(declare-const blossom Person)
(declare-const bubbles Person)
(declare-const buttercup Person)
(declare-const rival1 Person)
(declare-const rival2 Person)

; Knowledge base: identify Powerpuff Girls
(assert (is-powerpuff blossom))
(assert (is-powerpuff bubbles))
(assert (is-powerpuff buttercup))

; Opponents are not Powerpuff Girls
(assert (not (is-powerpuff rival1)))
(assert (not (is-powerpuff rival2)))

; Distinct participants involved in the test scenario
(assert (distinct blossom bubbles buttercup rival1 rival2))

; Scenario: the Powerpuff Girls form Team A = {blossom, bubbles} and Team B = {rival1, rival2}
(assert (can-form-match blossom bubbles rival1 rival2))

; Check satisfiability (exactly one check-sat as required)
(check-sat)
(get-model)