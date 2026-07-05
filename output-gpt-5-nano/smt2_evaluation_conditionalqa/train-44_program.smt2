; Sorts
(declare-sort Person 0)

; Constants
(declare-const claimant Person)
(declare-const father Person)
(declare-const civil-partner Person)

; Predicates
(declare-fun is-claim-for (Person Person) Bool)
(declare-fun is-civil-partner (Person Person) Bool)
(declare-fun send-copy (Person Person) Bool)

; Knowledge base
; The claimant is making a claim about the missing person 'father'
(assert (is-claim-for claimant father))

; The missing person has a civil partner
(assert (is-civil-partner father civil-partner))

; Rule: If a claimant makes a claim about a missing person, and that missing person has a civil partner,
; then a copy must be sent to that civil partner.
(assert (forall ((c Person) (m Person) (r Person))
  (=> (and (is-claim-for c m) (is-civil-partner m r))
      (send-copy c r))))

; Test: Do we need to send a copy to the civil partner?
; This asserts that the claimant must send a copy to the civil partner of the missing person.
(assert (send-copy claimant civil-partner))

; Check satisfiability and provide a model
(check-sat)
(get-model)