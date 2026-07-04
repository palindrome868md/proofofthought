; Declare sorts
(declare-sort Person 0)
(declare-sort Role 0)
(declare-sort Movie 0)

; Declare functions
(declare-fun is-rock-star (Person) Bool)
(declare-fun plays-role (Person Role) Bool)
(declare-fun is-boat-captain (Role) Bool)
(declare-fun appears-in-movie (Role Movie) Bool)

; Declare constants
(declare-const keith-richards Person)
(declare-const captain-teague Role)
(declare-const pirates-of-caribbean Movie)

; Knowledge base - facts about Keith Richards
(assert (is-rock-star keith-richards))
(assert (plays-role keith-richards captain-teague))
(assert (is-boat-captain captain-teague))
(assert (appears-in-movie captain-teague pirates-of-caribbean))

; Test: Does Keith Richards play a captain of a boat in a movie?
; We assert the claim and check if it's satisfiable with the knowledge base
(assert (plays-role keith-richards captain-teague))
(assert (is-boat-captain captain-teague))
(assert (appears-in-movie captain-teague pirates-of-caribbean))

; Check satisfiability
(check-sat)
(get-model)