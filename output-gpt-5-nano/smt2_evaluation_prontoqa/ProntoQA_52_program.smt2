; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const Polly Person)

; Declare predicates (uninterpreted)
(declare-fun jompus (Person) Bool)
(declare-fun spicy (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun transparent (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun dull (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun floral (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun feisty (Person) Bool)

; Knowledge base
(assert (forall ((p Person)) (=> (jompus p) (spicy p))))
(assert (forall ((p Person)) (=> (jompus p) (dumpus p))))
(assert (forall ((p Person)) (=> (dumpus p) (not (transparent p)))))
(assert (forall ((p Person)) (=> (dumpus p) (zumpus p))))
(assert (forall ((p Person)) (=> (zumpus p) (feisty p))))
(assert (forall ((p Person)) (=> (zumpus p) (wumpus p))))
(assert (forall ((p Person)) (=> (wumpus p) (not (dull p)))))
(assert (forall ((p Person)) (=> (wumpus p) (impus p))))
(assert (forall ((p Person)) (=> (vumpus p) (not (blue p)))))
(assert (forall ((p Person)) (=> (impus p) (blue p))))
(assert (forall ((p Person)) (=> (impus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (not (floral p)))))
(assert (forall ((p Person)) (=> (tumpus p) (numpus p))))

; Fact: Polly is a jompus
(assert (jompus Polly))

; Test: Is Polly blue?
(assert (blue Polly))

; Check satisfiability (one query)
(check-sat)
(get-model)