; Sorts
(declare-sort Person 0)
(declare-sort Academy 0)

; Constants
(declare-const powerpuff-girls Person)
(declare-const camden-military-academy Academy)

; Relation: attends(person, academy) -> Bool
(declare-fun attends (Person Academy) Bool)

; Test: Could the Powerpuff Girls attend Camden Military Academy?
(assert (attends powerpuff-girls camden-military-academy))

; Check whether this scenario is satisfiable (i.e., possible)
(check-sat)
(get-model)