; Sorts
(declare-sort Person 0)

; Predicates (uninterpreted)
(declare-fun Tumpus (Person) Bool)
(declare-fun Rompus (Person) Bool)
(declare-fun Dumpus (Person) Bool)
(declare-fun Zumpus (Person) Bool)
(declare-fun Luminous (Person) Bool)
(declare-fun Impuse (Person) Bool)
(declare-fun Wumpus (Person) Bool)
(declare-fun Yumpus (Person) Bool)
(declare-fun Jompus (Person) Bool)
(declare-fun Vumpus (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Temperate (Person) Bool)
(declare-fun Earthy (Person) Bool)
(declare-fun Red (Person) Bool)
(declare-fun Kind (Person) Bool)
(declare-fun Shy (Person) Bool)

; Constant
(declare-const Sam Person)

; Knowledge base (from the statements)
(assert (forall ((p Person)) (=> (Tumpus p) (Rompus p))))
(assert (forall ((p Person)) (=> (Rompus p) (not (Earthy p)))))
(assert (forall ((p Person)) (=> (Rompus p) (Dumpus p))))
(assert (forall ((p Person)) (=> (Dumpus p) (Zumpus p))))
(assert (forall ((p Person)) (=> (Zumpus p) (Luminous p))))
(assert (forall ((p Person)) (=> (Zumpus p) (Impuse p))))
(assert (forall ((p Person)) (=> (Impuse p) (not (Temperate p)))))
(assert (forall ((p Person)) (=> (Impuse p) (Wumpus p))))
(assert (forall ((p Person)) (=> (Wumpus p) (Red p))))
(assert (forall ((p Person)) (=> (Wumpus p) (Yumpus p))))
(assert (forall ((p Person)) (=> (Yumpus p) (Kind p))))
(assert (forall ((p Person)) (=> (Yumpus p) (Jompus p))))
(assert (forall ((p Person)) (=> (Jompus p) (Shy p))))
(assert (forall ((p Person)) (=> (Jompus p) (Vumpus p))))

; Fact: Sam is a tumpus
(assert (Tumpus Sam))

; The question: "Sam is not temperate."
; We test the statement by asserting its truth value directly.
(assert (not (Temperate Sam)))

; Check satisfiability and produce a model if one exists
(check-sat)
(get-model)