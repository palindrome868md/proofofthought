; Declare sorts
(declare-sort Person 0)

; Declare predicates (unary relations)
(declare-fun impus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun shy (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun large (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun angry (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun earthy (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun luminous (Person) Bool)
(declare-fun sour (Person) Bool)

; Declare constants
(declare-const polly Person)

; Knowledge base (universal rules)
(assert (forall ((p Person)) (=> (impus p) (luminous p))))
(assert (forall ((p Person)) (=> (impus p) (zumpus p))))
(assert (forall ((p Person)) (=> (zumpus p) (shy p))))
(assert (forall ((p Person)) (=> (zumpus p) (numpus p))))
(assert (forall ((p Person)) (=> (numpus p) (not (cold p)))))
(assert (forall ((p Person)) (=> (numpus p) (tumpus p))))
(assert (forall ((p Person)) (=> (tumpus p) (large p))))
(assert (forall ((p Person)) (=> (tumpus p) (yumpus p))))
(assert (forall ((p Person)) (=> (yumpus p) (angry p))))
(assert (forall ((p Person)) (=> (yumpus p) (vumpus p))))
(assert (forall ((p Person)) (=> (vumpus p) (not (earthy p)))))
(assert (forall ((p Person)) (=> (vumpus p) (jompus p))))
(assert (forall ((p Person)) (=> (jompus p) (not (sour p)))))
(assert (forall ((p Person)) (=> (dumpus p) (not (angry p)))))
(assert (forall ((p Person)) (=> (jompus p) (rompus p))))
(assert (forall ((p Person)) (=> (rompus p) (not (opaque p)))))
(assert (forall ((p Person)) (=> (rompus p) (wumpus p))))

; Fact: Polly is an impus
(assert (impus polly))

; Test scenario: Is Polly angry?
(assert (angry polly))

; Check satisfiability and get a model
(check-sat)
(get-model)