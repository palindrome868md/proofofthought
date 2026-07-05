(declare-sort Person 0)

; Predicates for each type
(declare-fun is-numpus (Person) Bool)
(declare-fun is-impuse (Person) Bool)
(declare-fun is-dumpuse (Person) Bool)
(declare-fun is-vumpuse (Person) Bool)
(declare-fun is-yumpuse (Person) Bool)
(declare-fun is-rompus (Person) Bool)
(declare-fun is-tumpus (Person) Bool)
(declare-fun is-zumpus (Person) Bool)
(declare-fun is-wumpus (Person) Bool)
(declare-fun is-jompus (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-large (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-floral (Person) Bool)
(declare-fun is-luminous (Person) Bool)
(declare-fun is-happy (Person) Bool)
(declare-fun is-sour (Person) Bool)
(declare-fun is-bright (Person) Bool)

; Sally
(declare-const sally Person)

; Knowledge base
(assert (is-numpus sally))
(assert (forall ((p Person)) (=> (is-numpus p) (is-impuse p))))
(assert (forall ((p Person)) (=> (is-impuse p) (not (is-cold p)))))
(assert (forall ((p Person)) (=> (is-impuse p) (is-dumpuse p))))
(assert (forall ((p Person)) (=> (is-dumpuse p) (not (is-floral p)))))
(assert (forall ((p Person)) (=> (is-dumpuse p) (is-vumpuse p))))
(assert (forall ((p Person)) (=> (is-vumpuse p) (not (is-luminous p)))))
(assert (forall ((p Person)) (=> (is-vumpuse p) (is-yumpuse p))))
(assert (forall ((p Person)) (=> (is-yumpuse p) (is-blue p))))
(assert (forall ((p Person)) (=> (is-yumpuse p) (is-tumpus p))))
(assert (forall ((p Person)) (=> (is-tumpus p) (is-happy p))))
(assert (forall ((p Person)) (=> (is-tumpus p) (is-zumpus p))))
(assert (forall ((p Person)) (=> (is-zumpus p) (is-sour p))))
(assert (forall ((p Person)) (=> (is-zumpus p) (is-wumpus p))))
(assert (forall ((p Person)) (=> (is-wumpus p) (is-bright p))))
(assert (forall ((p Person)) (=> (is-wumpus p) (is-jompus p))))
(assert (forall ((p Person)) (=> (is-rompus p) (not (is-blue p)))))

; Test: Is Sally blue?
(assert (is-blue sally))

(check-sat)
(get-model)