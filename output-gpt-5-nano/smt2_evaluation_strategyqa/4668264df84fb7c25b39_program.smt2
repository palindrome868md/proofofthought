; Question: Could the members of The Police perform lawful arrests?

; Declare sorts
(declare-sort Person 0)
(declare-sort Organization 0)

; Declare constants
(declare-const the-police Organization)

; Declare predicates/functions
; is-police-member(p, org) => true if p is a member of organization org
(declare-fun is-police-member (Person Organization) Bool)

; can-perform-lawful-arrest(p) => true if p can perform a lawful arrest
(declare-fun can-perform-lawful-arrest (Person) Bool)

; Witness for existential claim: there exists a person p0 who is a member of The Police
(declare-const p0 Person)

; Knowledge base / scenario
; p0 is a member of The Police
(assert (is-police-member p0 the-police))
; p0 can perform a lawful arrest
(assert (can-perform-lawful-arrest p0))

; Test: Could members of The Police perform lawful arrests?
; (This is captured by the existence of p0 that satisfies the above.)
(check-sat)
(get-model)