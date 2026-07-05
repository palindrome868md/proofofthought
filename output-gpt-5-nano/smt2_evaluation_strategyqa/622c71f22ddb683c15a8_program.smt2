; Declare sorts
(declare-sort Store 0)
(declare-sort Brand 0)

; Declare constants
(declare-const petco Store)
(declare-const casio Brand)

; Declare predicates
(declare-fun sells (Store Brand) Bool)

; Knowledge base: Petco does not sell Casio products
(assert (not (sells petco casio)))

; Test: Can you buy Casio products at Petco?
(assert (sells petco casio))

; Check satisfiability
(check-sat)