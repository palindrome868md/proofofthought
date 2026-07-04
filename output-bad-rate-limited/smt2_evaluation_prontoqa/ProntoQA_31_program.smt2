(declare-sort Person 0)

; Predicates (uninterpreted for each class)
(declare-fun small (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun angry (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun temperate (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun brown (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun wooden (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun dull (Person) Bool)
(declare-fun vumpus (Person) Bool)

; Constant
(declare-const wren Person)

; Knowledge base
(assert (forall ((p Person)) (=> (jompus p) (not (small p)))))
(assert (forall ((p Person)) (=> (wumpus p) (angry p))))
(assert (forall ((p Person)) (=> (jompus p) (zumpus p))))
(assert (forall ((p Person)) (=> (zumpus p) (temperate p))))
(assert (forall ((p Person)) (=> (zumpus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (brown p))))
(assert (forall ((p Person)) (=> (tumpus p) (yumpus p))))
(assert (forall ((p Person)) (=> (yumpus p) (wooden p))))
(assert (forall ((p Person)) (=> (yumpus p) (dumpus p))))
(assert (forall ((p Person)) (=> (dumpus p) (not (angry p)))))
(assert (forall ((p Person)) (=> (dumpus p) (numpus p))))
(assert (forall ((p Person)) (=> (numpus p) (not (dull p)))))
(assert (forall ((p Person)) (=> (numpus p) (vumpus p))))
(assert (jompus wren))

; Test: Wren is not angry
(assert (not (angry wren)))

(check-sat)
(get-model)