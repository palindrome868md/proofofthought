; Declare sorts
(declare-sort Person 0)

; Predicates (uninterpreted relations)
(declare-fun jompus (Person) Bool)
(declare-fun amenable (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun orange (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun fruity (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun metallic (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun large (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun shy (Person) Bool)
(declare-fun bitter (Person) Bool)

; Constant
(declare-const Sam Person)

; Knowledge base (rules)
(assert (forall ((x Person)) (=> (jompus x) (not (amenable x)))))
(assert (forall ((x Person)) (=> (wumpus x) (not (fruity x)))))
(assert (forall ((x Person)) (=> (jompus x) (vumpus x))))
(assert (forall ((x Person)) (=> (vumpus x) (not (shy x)))))
(assert (forall ((x Person)) (=> (vumpus x) (rompus x))))
(assert (forall ((x Person)) (=> (rompus x) (not (bitter x)))))
(assert (forall ((x Person)) (=> (rompus x) (dumpus x))))
(assert (forall ((x Person)) (=> (dumpus x) (opaque x))))
(assert (forall ((x Person)) (=> (dumpus x) (yumpus x))))
(assert (forall ((x Person)) (=> (yumpus x) (orange x))))
(assert (forall ((x Person)) (=> (yumpus x) (zumpus x))))
(assert (forall ((x Person)) (=> (zumpus x) (fruity x))))
(assert (forall ((x Person)) (=> (zumpus x) (numpus x))))
(assert (forall ((x Person)) (=> (numpus x) (metallic x))))
(assert (forall ((x Person)) (=> (numpus x) (tumpus x))))
(assert (forall ((x Person)) (=> (tumpus x) (large x))))
(assert (forall ((x Person)) (=> (tumpus x) (impus x))))

; Fact: Sam is a vumpus
(assert (vumpus Sam))

; Query: Is Sam not fruity?
(assert (not (fruity Sam)))

; Check satisfiability
(check-sat)