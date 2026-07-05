; Declare sort for all entities
(declare-sort Thing 0)

; Declare constants
(declare-const Stella Thing)

; Declare predicates (unary relations)
(declare-fun tumpus (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun impuse (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun red (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun transparent (Thing) Bool)
(declare-fun angry (Thing) Bool)
(declare-fun zumpus (Thing) Bool)
(declare-fun rompus (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun metallic (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun happy (Thing) Bool)
(declare-fun sweet (Thing) Bool)

; Knowledge base (axioms)

; 1) Every tumpus is not transparent
(assert (forall ((x Thing)) (=> (tumpus x) (not (transparent x)))))

; 2) Tumpuses are jompuses
(assert (forall ((x Thing)) (=> (tumpus x) (jompus x))))

; 3) Each jompus is not large
(assert (forall ((x Thing)) (=> (jompus x) (not (large x)))))

; 4) Jompuses are vumpuses
(assert (forall ((x Thing)) (=> (jompus x) (vumpus x))))

; 5) Vumpuses are angry
(assert (forall ((x Thing)) (=> (vumpus x) (angry x))))

; 6) Vumpuses are impuses
(assert (forall ((x Thing)) (=> (vumpus x) (impuse x))))

; 7) Yumpuses are red
(assert (forall ((x Thing)) (=> (yumpus x) (red x))))

; 8) Impuses are happy
(assert ( forall ((x Thing)) (=> (impuse x) (happy x)) ))

; 9) Impuses are zumpuses
(assert (forall ((x Thing)) (=> (impuse x) (zumpus x))))

; 10) Zumpuses are metallic
(assert (forall ((x Thing)) (=> (zumpus x) (metallic x))))

; 11) Each zumpus is a rompus
(assert (forall ((x Thing)) (=> (zumpus x) (rompus x))))

; 12) Rompuses are dull
(assert (forall ((x Thing)) (=> (rompus x) (dull x))))

; 13) Rompuses are wumpuses
(assert (forall ((x Thing)) (=> (rompus x) (wumpus x))))

; 14) Every wumpus is not red
(assert (forall ((x Thing)) (=> (wumpus x) (not (red x)))))

; 15) Each wumpus is a numpus
(assert (forall ((x Thing)) (=> (wumpus x) (numpus x))))

; 16) Numpuses are not sweet
(assert (forall ((x Thing)) (=> (numpus x) (not (sweet x)))))

; 17) Numpuses are dumpuses
(assert (forall ((x Thing)) (=> (numpus x) (dumpus x))))

; 18) Stella is a vumpus
(assert (vumpus Stella))

; Test scenario: Is "Stella is not red" (i.e., (not (red Stella))) true?
(assert (not (red Stella)))

; Check satisfiability to determine the truth of the query
(check-sat)
(get-model)