; Determine whether the Space Race used relay batons

; Sorts
(declare-sort Event 0)

; Constants
(declare-const space-race Event)

; Predicates
(declare-fun uses-relay-baton (Event) Bool)

; Knowledge base (facts/rules)
; The Space Race did not use relay batons
(assert (not (uses-relay-baton space-race)))

; Test: Did the Space Race use relay batons?
(assert (uses-relay-baton space-race))

; Check satisfiability to answer the question
(check-sat)