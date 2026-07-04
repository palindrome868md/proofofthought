; Question: Could the members of The Police perform lawful arrests?
; Reasoning: The Police is a musical band, not law enforcement.
; Only law enforcement officers can perform lawful arrests.

; Declare sorts
(declare-sort Person 0)
(declare-sort Organization 0)

; Declare functions
(declare-fun is-band-member (Person Organization) Bool)
(declare-fun is-law-enforcement (Person) Bool)
(declare-fun can-perform-lawful-arrest (Person) Bool)

; Declare constants
(declare-const the-police-band Organization)
(declare-const police-member Person)

; Knowledge base
; The Police is a musical band (not a law enforcement organization)
(assert (is-band-member police-member the-police-band))

; Band members are NOT law enforcement officers
(assert (=> (is-band-member police-member the-police-band)
            (not (is-law-enforcement police-member))))

; Rule: Only law enforcement can perform lawful arrests
(assert (forall ((p Person))
  (=> (can-perform-lawful-arrest p)
      (is-law-enforcement p))))

; Test scenario: Could a member of The Police perform lawful arrests?
; We assert they CAN and check if this is satisfiable
(assert (can-perform-lawful-arrest police-member))

; Check satisfiability
; If unsat: They COULD NOT perform lawful arrests (answer: NO)
; If sat: They COULD perform lawful arrests (answer: YES)
(check-sat)
(get-model)