; Question: Is Miami a city on the American West Coast?
; Expected answer: unsat (false) - Miami is on the East Coast, not West Coast

; Declare sorts
(declare-sort City 0)
(declare-sort Coast 0)
(declare-sort State 0)

; Declare constants
(declare-const miami City)
(declare-const florida State)
(declare-const west-coast Coast)
(declare-const east-coast Coast)

; Declare functions/predicates
(declare-fun in-state (City State) Bool)
(declare-fun on-coast (State Coast) Bool)
(declare-fun is-west-coast-city (City) Bool)

; Knowledge Base Facts

; Miami is in Florida
(assert (in-state miami florida))

; Florida is on the East Coast (not West Coast)
(assert (on-coast florida east-coast))
(assert (not (on-coast florida west-coast)))

; Rule: A city is on the West Coast only if its state is on the West Coast
(assert (forall ((c City) (s State))
  (=> (and (in-state c s) (on-coast s west-coast))
      (is-west-coast-city c))))

; Rule: If a state is on the East Coast, it's not on the West Coast
(assert (forall ((s State))
  (=> (on-coast s east-coast)
      (not (on-coast s west-coast)))))

; Test: Is Miami a West Coast city?
(assert (is-west-coast-city miami))

; Check satisfiability
(check-sat)
; Expected: unsat (Miami is NOT on the American West Coast)

(get-model)