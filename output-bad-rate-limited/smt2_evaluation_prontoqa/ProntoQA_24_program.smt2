; Sorts
(declare-sort Person 0)

; Constants
(declare-const alex Person)

; Predicates (unary relations)
(declare-fun numpus (Person) Bool)
(declare-fun floral (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun nervous (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun brown (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun amenable (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun bitter (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun hot (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun bright (Person) Bool)
(declare-fun yumpus (Person) Bool)

; Knowledge base (universal rules)
(assert (forall ((p Person)) (=> (numpus p) (floral p))))
(assert (forall ((p Person)) (=> (numpus p) (jompus p))))
(assert (forall ((p Person)) (=> (jompus p) (not (nervous p)))))
(assert (forall ((p Person)) (=> (jompus p) (impus p))))
(assert (forall ((p Person)) (=> (impus p) (brown p))))
(assert (forall ((p Person)) (=> (dumpus p) (not (amenable p)))))
(assert (forall ((p Person)) (=> (impus p) (wumpus p))))
(assert (forall ((p Person)) (=> (wumpus p) (not (bitter p)))))
(assert (forall ((p Person)) (=> (wumpus p) (zumpus p))))
(assert (forall ((p Person)) (=> (zumpus p) (not (small p)))))
(assert (forall ((p Person)) (=> (zumpus p) (vumpus p))))
(assert (forall ((p Person)) (=> (vumpus p) (hot p))))
(assert (forall ((p Person)) (=> (vumpus p) (rompus p))))
(assert (forall ((p Person)) (=> (rompus p) (amenable p))))
(assert (forall ((p Person)) (=> (rompus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (bright p))))
(assert (forall ((p Person)) (=> (tumpus p) (yumpus p))))

; Fact: Alex is an impus
(assert (impus alex))

; Test: Is Alex amenable?
(assert (amenable alex))

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)