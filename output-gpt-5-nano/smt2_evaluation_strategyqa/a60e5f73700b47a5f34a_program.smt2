; Sorts
(declare-sort Person 0)
(declare-sort Movie 0)

; Data type for roles
(declare-datatypes () ((Role
  (captain-of-boat)
  (crew)
  (other)
)))

; Constants
(declare-const keith-richards Person)
(declare-const pirates-of-worlds-end Movie)

; Relationship: plays(person, movie) -> Role
(declare-fun plays (Person Movie) Role)

; Knowledge base (facts)
; Keith Richards plays a captain of a boat in a movie ( Pirates of the Caribbean: At World's End )
(assert (= (plays keith-richards pirates-of-worlds-end) captain-of-boat))

; Test scenario: Does Keith Richards play a captain of a boat in a movie?
(assert (= (plays keith-richards pirates-of-worlds-end) captain-of-boat))

; Verification
(check-sat)
(get-model)