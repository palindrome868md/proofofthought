; Declare sorts
(declare-sort Person 0)

; Declare predicates (unary predicates representing properties or classes)
(declare-fun impus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun floral (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun mean (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun temperate (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun bright (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun bitter (Person) Bool)

; Declare constants
(declare-const sam Person)

; Knowledge base (implication chains)
(assert (forall ((p Person)) (=> (impus p) (rompus p))))
(assert (forall ((p Person)) (=> (rompus p) (floral p))))
(assert (forall ((p Person)) (=> (rompus p) (yumpus p))))
(assert (forall ((p Person)) (=> (yumpus p) (opaque p))))
(assert (forall ((p Person)) (=> (yumpus p) (numpus p))))
(assert (forall ((p Person)) (=> (numpus p) (red p))))
(assert (forall ((p Person)) (=> (numpus p) (dumpus p))))
(assert (forall ((p Person)) (=> (dumpus p) (bitter p))))
(assert (forall ((p Person)) (=> (dumpus p) (vumpus p))))
(assert (forall ((p Person)) (=> (vumpus p) (not (mean p)))))
(assert (forall ((p Person)) (=> (vumpus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (not (shy p)))))
(assert (forall ((p Person)) (=> (wumpus p) (shy p))))
(assert (forall ((p Person)) (=> (tumpus p) (zumpus p))))
(assert (forall ((p Person)) (=> (zumpus p) (temperate p))))
(assert (forall ((p Person)) (=> (zumpus p) (jompus p))))
(assert (yumpus sam))

; Test: Is Sam shy?
(assert (shy sam))

; Check satisfiability
(check-sat)