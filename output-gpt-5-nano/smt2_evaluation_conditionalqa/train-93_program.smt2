; Sorts
(declare-sort Person 0)

; Constants
(declare-const me Person)
(declare-const aunt Person)

; Predicates
; automatically-authorised(p, r) means p is automatically authorised to act for r
(declare-fun automatically-authorised (Person Person) Bool)

; Knowledge base: there is no concept of automatic authorisation in this scenario
; i.e., for all p, r, p is not automatically authorised to act for r
(assert (forall ((p Person) (r Person))
  (not (automatically-authorised p r))))

; Test scenario: assert that I (me) am automatically authorised to act for my aunt
(assert (automatically-authorised me aunt))

; Check satisfiability to answer the question "Will I be automatically authorised?"
(check-sat)
(get-model)