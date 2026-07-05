; Declare sorts
(declare-sort Person 0)
(declare-sort Property 0)

; Predicates / functions
(declare-fun is-disabled (Person) Bool)
(declare-fun owns (Person Property) Bool)
(declare-fun lives-in (Person Property) Bool)
(declare-fun intends-live (Person Property) Bool)
(declare-fun eligible-for-dfg (Person Property) Bool)

; Constants representing the scenario
(declare-const aunt Person)
(declare-const aunt-house Property)

; Knowledge base (scenario description)
(assert (is-disabled aunt))
(assert (owns aunt aunt-house))
(assert (lives-in aunt aunt-house))
(assert (intends-live aunt aunt-house))

; Eligibility rule: if someone is disabled, owns a property, lives in it, and intends to live there, they are eligible for a Disabled Facilities Grant (DFG)
(assert (forall ((p Person) (h Property))
  (=> (and (is-disabled p) (owns p h) (lives-in p h) (intends-live p h))
      (eligible-for-dfg p h))))

; Test scenario: Is aunt eligible for DFG for her house?
(assert (eligible-for-dfg aunt aunt-house))

; Check satisfiability to answer the question
(check-sat)
(get-model)