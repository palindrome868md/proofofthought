; Declare sorts
(declare-sort Person 0)

; Declare predicates (uninterpreted relations)
(declare-fun is-dumpus (Person) Bool)
(declare-fun is-rompus (Person) Bool)
(declare-fun is-yumpus (Person) Bool)
(declare-fun is-vumpus (Person) Bool)
(declare-fun is-numpus (Person) Bool)
(declare-fun is-zumpus (Person) Bool)
(declare-fun is-jompus (Person) Bool)
(declare-fun is-tumpus (Person) Bool)
(declare-fun is-wumpus (Person) Bool)
(declare-fun is-impus (Person) Bool)

; Predicates for properties
(declare-fun bright (Person) Bool)
(declare-fun aggressive (Person) Bool)
(declare-fun brown (Person) Bool)
(declare-fun sour (Person) Bool)
(declare-fun temperate (Person) Bool)
(declare-fun metallic (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun fruity (Person) Bool)

; Sam
(declare-const sam Person)

; Knowledge base (universal rules)
(assert (forall ((d Person)) (=> (is-dumpus d) (bright d))))
(assert (forall ((d Person)) (=> (is-dumpus d) (is-rompus d))))
(assert (forall ((d Person)) (=> (is-rompus d) (aggressive d))))
(assert (forall ((d Person)) (=> (is-rompus d) (is-yumpus d))))
(assert (forall ((p Person)) (=> (is-yumpus p) (brown p))))
(assert (forall ((p Person)) (=> (is-yumpus p) (is-vumpus p))))
(assert (forall ((p Person)) (=> (is-impus p) (fruity p))))
(assert (forall ((p Person)) (=> (is-vumpus p) (sour p))))
(assert (forall ((p Person)) (=> (is-vumpus p) (is-numpus p))))
(assert (forall ((p Person)) (=> (is-numpus p) (not (temperate p)))))
(assert (forall ((p Person)) (=> (is-numpus p) (is-zumpus p))))
(assert (forall ((p Person)) (=> (is-zumpus p) (metallic p))))
(assert (forall ((p Person)) (=> (is-zumpus p) (is-jompus p))))
(assert (forall ((p Person)) (=> (is-jompus p) (not (fruity p)))))
(assert (forall ((p Person)) (=> (is-jompus p) (is-tumpus p))))
(assert (forall ((p Person)) (=> (is-tumpus p) (opaque p))))
(assert (forall ((p Person)) (=> (is-tumpus p) (is-wumpus p))))

; Sam is a yumpus
(assert (is-yumpus sam))

; Test: Is Sam fruity?
; If the knowledge base implies Sam is not fruity, asserting "Sam is fruity" should lead to unsat.
(assert (fruity sam))

; Check satisfiability
(check-sat)