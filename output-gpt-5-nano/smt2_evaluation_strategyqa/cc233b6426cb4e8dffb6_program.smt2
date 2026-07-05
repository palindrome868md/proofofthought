; Declare sorts
(declare-sort Person 0)
(declare-sort Location 0)

; Declare constants
(declare-const sean-connery Person)
(declare-const washington-monument Location)

; Declare predicates
(declare-fun is-original-bond-actor (Person) Bool)
(declare-fun born-near-washington-monument (Person) Bool)

; Knowledge base
(assert (is-original-bond-actor sean-connery))
; The original Bond actor was NOT born near the Washington Monument
(assert (not (born-near-washington-monument sean-connery)))

; Test: Was the original James Bond actor born near the Washington Monument?
(assert (born-near-washington-monument sean-connery))

; Check satisfiability
(check-sat)
(get-model)