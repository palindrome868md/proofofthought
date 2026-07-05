(declare-sort Person 0)

; Predicates
(declare-fun jompus (Person) Bool)
(declare-fun small (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun metallic (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun fruity (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun nervous (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun hot (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun dull (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun opaque (Person) Bool)

; Constants
(declare-const sam Person)

; Knowledge base
; Sam is a numpus
(assert (numpus sam))

; Jompuses are not small
(assert (forall ((p Person)) (=> (jompus p) (not (small p)))))

; Jompuses are tumpuses
(assert (forall ((p Person)) (=> (jompus p) (tumpus p))))

; Each tumpus is a vumpus
(assert (forall ((p Person)) (=> (tumpus p) (vumpus p))))

; Vumpuses are metallic
(assert (forall ((p Person)) (=> (vumpus p) (metallic p))))

; Vumpuses are numpuses
(assert (forall ((p Person)) (=> (vumpus p) (numpus p))))

; Each numpus is fruity
(assert (forall ((p Person)) (=> (numpus p) (fruity p))))

; Each numpus is a dumpus
(assert (forall ((p Person)) (=> (numpus p) (dumpus p))))

; Dumpuses are nervous
(assert (forall ((p Person)) (=> (dumpus p) (nervous p))))

; Dumpuses are rompuses
(assert (forall ((p Person)) (=> (dumpus p) (rompus p))))

; Each romp us is a zumpus
(assert (forall ((p Person)) (=> (rompus p) (zumpus p))))

; Each zumpus is hot
(assert (forall ((p Person)) (=> (zumpus p) (hot p))))

; Every zumpus is an impus
(assert (forall ((p Person)) (=> (zumpus p) (impus p))))

; Every impus is not dull
(assert (forall ((p Person)) (=> (impus p) (not (dull p)))))

; Each impus is a yumpus
(assert (forall ((p Person)) (=> (impus p) (yumpus p))))

; Each rompus is opaque
(assert (forall ((p Person)) (=> (rompus p) (opaque p))))

; Is the statement true or false? "Sam is not dull."
; Test: assert the negation of the statement and check satisfiability
(assert (not (dull sam)))

(check-sat)
(get-model)