; Sorts
(declare-sort Person 0)

; Constants
(declare-const alex Person)

; Predicates
(declare-fun impus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun nervous (Person) Bool)
(declare-fun small (Person) Bool)
(declare-fun bitter (Person) Bool)
(declare-fun fruity (Person) Bool)
(declare-fun wooden (Person) Bool)
(declare-fun temperate (Person) Bool)
(declare-fun dull (Person) Bool)
(declare-fun kind (Person) Bool)

; Knowledge base
; Alex is a rompus
(assert (rompus alex))

; Rules
(assert (forall ((p Person)) (=> (impus p) (small p))))
(assert (forall ((p Person)) (=> (zumpus p) (not (fruity p)))))
(assert (forall ((p Person)) (=> (zumpus p) (numpus p))))
(assert (forall ((p Person)) (=> (numpus p) (bitter p))))
(assert (forall ((p Person)) (=> (numpus p) (rompus p))))
(assert (forall ((p Person)) (=> (rompus p) (kind p))))
(assert (forall ((p Person)) (=> (rompus p) (wumpus p))))
(assert (forall ((p Person)) (=> (wumpus p) (not (wooden p)))))
(assert (forall ((p Person)) (=> (wumpus p) (yumpus p))))
(assert (forall ((p Person)) (=> (yumpus p) (not (temperate p)))))
(assert (forall ((p Person)) (=> (yumpus p) (dumpus p))))
(assert (forall ((p Person)) (=> (dumpus p) (dull p))))
(assert (forall ((p Person)) (=> (dumpus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (not (small p)))))
(assert (forall ((p Person)) (=> (tumpus p) (jompus p))))
(assert (forall ((p Person)) (=> (jompus p) (nervous p))))
(assert (forall ((p Person)) (=> (jompus p) (vumpus p))))

; Test: Is Alex small?
(assert (small alex))

(check-sat)
(get-model)