; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const max Person)

; Declare unary predicates
(declare-fun jompus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun impuse (Person) Bool)
(declare-fun feisty (Person) Bool)
(declare-fun temperate (Person) Bool)
(declare-fun liquid (Person) Bool)
(declare-fun transparent (Person) Bool)
(declare-fun earthy (Person) Bool)
(declare-fun mean (Person) Bool)
(declare-fun bright (Person) Bool)

; Knowledge base
(assert (jompus max))

; Rules
(assert (forall ((p Person)) (=> (jompus p) (rompus p))))
(assert (forall ((p Person)) (=> (rompus p) (mean p))))
(assert (forall ((p Person)) (=> (rompus p) (zumpus p))))
(assert (forall ((p Person)) (=> (zumpus p) (transparent p))))
(assert (forall ((p Person)) (=> (zumpus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (not (earthy p)))))
(assert (forall ((p Person)) (=> (tumpus p) (yumpus p))))
(assert (forall ((p Person)) (=> (yumpus p) (not (bright p)))))
(assert (forall ((p Person)) (=> (yumpus p) (impuse p))))
(assert (forall ((p Person)) (=> (impuse p) (temperate p))))
(assert (forall ((p Person)) (=> (impuse p) (numpus p))))
(assert (forall ((p Person)) (=> (numpus p) (feisty p))))
(assert (forall ((p Person)) (=> (numpus p) (wumpus p))))
(assert (forall ((p Person)) (=> (jompus p) (liquid p))))
; Optional: include dumpus -> bright if desired
(assert (forall ((p Person)) (=> (dumpus p) (bright p))))

; Test: Is Max bright?
(assert (bright max))

; Check satisfiability
(check-sat)
(get-model)