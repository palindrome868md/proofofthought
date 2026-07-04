; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const Rex Person)

; Declare predicates
(declare-fun Dumpus (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Blue (Person) Bool)
(declare-fun Wumpus (Person) Bool)
(declare-fun Hot (Person) Bool)
(declare-fun Vumpus (Person) Bool)
(declare-fun Luminous (Person) Bool)
(declare-fun Jompus (Person) Bool)
(declare-fun Mean (Person) Bool)
(declare-fun Impus (Person) Bool)
(declare-fun Rompus (Person) Bool)
(declare-fun Feisty (Person) Bool)
(declare-fun Zumpus (Person) Bool)
(declare-fun Yumpus (Person) Bool)
(declare-fun Dull (Person) Bool)
(declare-fun Small (Person) Bool)

; Knowledge base (as universal rules)
(assert (forall ((p Person)) (=> (Dumpus p) (Numpus p))))
(assert (forall ((p Person)) (=> (Dumpus p) (Dull p))))
(assert (forall ((p Person)) (=> (Numpus p) (Blue p))))
(assert (forall ((p Person)) (=> (Numpus p) (Wumpus p))))
(assert (forall ((p Person)) (=> (Wumpus p) (Hot p))))
(assert (forall ((p Person)) (=> (Wumpus p) (Vumpus p))))
(assert (forall ((p Person)) (=> (Vumpus p) (Luminous p))))
(assert (forall ((p Person)) (=> (Vumpus p) (Jompus p))))
(assert (forall ((p Person)) (=> (Jompus p) (Mean p))))
(assert (forall ((p Person)) (=> (Jompus p) (Impus p))))
(assert (forall ((p Person)) (=> (Impus p) (not (Small p)))))
(assert (forall ((p Person)) (=> (Rompus p) (not (Feisty p)))))
(assert (forall ((p Person)) (=> (Rompus p) (Zumpus p))))
(assert (forall ((p Person)) (=> (Yumpus p) (not (Mean p)))))

; Base fact
(assert (Dumpus Rex))

; Test scenario: Rex is mean
(assert (Mean Rex))

; Check satisfiability
(check-sat)
(get-model)