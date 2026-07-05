; Sorts
(declare-sort Person 0)
(declare-sort Fish 0)

; Constants
(declare-const stonefish Fish)
(declare-const some-person Person)

; Predicates
(declare-fun stings (Fish Person) Bool)
(declare-fun stepped-on (Person Fish) Bool)
(declare-fun treated (Person) Bool)
(declare-fun death (Person) Bool)

; Knowledge base

; Some fish stings people
(assert (stings stonefish some-person))

; Stonefish stings when stepped on
(assert (forall ((p Person))
  (=> (stepped-on p stonefish)
      (stings stonefish p))))

; If a stonefish stings someone and they are not treated, it can cause death
(assert (forall ((p Person))
  (=> (and (stings stonefish p) (not (treated p)))
      (death p))))

; To be consistent with premises, assume some-person has not been treated
(assert (not (treated some-person)))

; Test scenario: death occurs for some-person (consistent with premises)
(assert (death some-person))

; Check satisfiability to answer the question
(check-sat)
(get-model)