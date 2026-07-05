; Declarations
(declare-sort Person 0)

(declare-const me Person)
(declare-const uncle Person)

; A boolean indicating the uncle has died (scenario flag)
(declare-const uncle-dead Bool)

; Predicate: is-deputy (deputy, for-whom)
(declare-fun is-deputy (Person Person) Bool)

; Knowledge base
; 1) You are the deputy for your uncle
(assert (is-deputy me uncle))

; 2) If a deputy for someone dies, they no longer have deputy power for that person
(assert (forall ((d Person) (p Person))
  (=> (and (is-deputy d p) uncle-dead)
      (not (is-deputy d p)))))

; Scenario: the uncle has died
(assert uncle-dead)

; Question: Will my power as his deputy be valid after he dies?
; Check satisfiability directly answers the question
(check-sat)
(get-model)