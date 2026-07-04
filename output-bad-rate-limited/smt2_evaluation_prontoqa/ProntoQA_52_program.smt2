; Determine if Polly is blue given the knowledge base

(declare-sort Person 0)

; Predicates
(declare-fun jompus (Person) Bool)
(declare-fun spicy (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun transparent (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun feisty (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun dull (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun floral (Person) Bool)
(declare-fun numpus (Person) Bool)

; Constant
(declare-const polly Person)

; Knowledge base
(assert (jompus polly))

; Rules from the problem
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

; Question: Is Polly blue?
(assert (blue polly))

(check-sat)
(get-model)