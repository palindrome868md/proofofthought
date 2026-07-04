; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const sam Person)

; Declare predicates (uninterpreted relations)
(declare-fun numpus (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun small (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun transparent (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun orange (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun sweet (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun wooden (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun bright (Person) Bool)
(declare-fun mean (Person) Bool)
(declare-fun fruity (Person) Bool)
(declare-fun wumpus (Person) Bool)

; Knowledge base

; Sam is an impus
(assert (impus sam))

; Numpuses are not mean
(assert (forall ((p Person)) (=> (numpus p) (not (mean p)))))

; Numpuses are impuses
(assert (forall ((p Person)) (=> (numpus p) (impus p))))

; Every impus is not fruity
(assert (forall ((p Person)) (=> (impus p) (not (fruity p)))))

; Impuses are zumpuses
(assert (forall ((p Person)) (=> (impus p) (zumpus p))))

; Each zumpus is small
(assert (forall ((p Person)) (=> (zumpus p) (small p))))

; Zumpuses are tumpuses
(assert (forall ((p Person)) (=> (zumpus p) (tumpus p))))

; Each tumpus is transparent
(assert (forall ((p Person)) (=> (tumpus p) (transparent p))))

; Each tumpus is a jompus
(assert (forall ((p Person)) (=> (tumpus p) (jompus p))))

; Wumpuses are not orange
(assert (forall ((p Person)) (=> (wumpus p) (not (orange p)))))

; Each jompus is not bright
(assert (forall ((p Person)) (=> (jompus p) (not (bright p)))))

; Jompuses are dumpuses
(assert (forall ((p Person)) (=> (jompus p) (dumpus p))))

; Dumpuses are orange
(assert (forall ((p Person)) (=> (dumpus p) (orange p))))

; Each dumpus is a vumpus
(assert (forall ((p Person)) (=> (dumpus p) (vumpus p))))

; Every vumpus is sweet
(assert (forall ((p Person)) (=> (vumpus p) (sweet p))))

; Vumpuses are yumpuses
(assert (forall ((p Person)) (=> (vumpus p) (yumpus p))))

; Yumpuses are wooden
(assert (forall ((p Person)) (=> (yumpus p) (wooden p))))

; Every yumpus is a rompus
(assert (forall ((p Person)) (=> (yumpus p) (rompus p))))

; Question: Is Sam orange?
(assert (orange sam))

; Check satisfiability (one and only one check-sat for the direct question)
(check-sat)
(get-model)