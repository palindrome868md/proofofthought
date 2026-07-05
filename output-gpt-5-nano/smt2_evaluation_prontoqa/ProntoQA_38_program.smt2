; Sorts
(declare-sort Person 0)

; Constants
(declare-const Polly Person)

; Predicates (unary relations)
(declare-fun is-vumpus (Person) Bool)
(declare-fun is-jompus (Person) Bool)
(declare-fun is-wumpus (Person) Bool)
(declare-fun is-yumpus (Person) Bool)
(declare-fun is-impus (Person) Bool)
(declare-fun is-dumpus (Person) Bool)
(declare-fun is-zumpus (Person) Bool)
(declare-fun is-numpus (Person) Bool)
(declare-fun is-tumpus (Person) Bool)
(declare-fun is-rompus (Person) Bool)
(declare-fun is-happy (Person) Bool)
(declare-fun is-angry (Person) Bool)
(declare-fun is-sour (Person) Bool)
(declare-fun is-bright (Person) Bool)
(declare-fun is-wooden (Person) Bool)
(declare-fun is-transparent (Person) Bool)

; Knowledge base (facts and rules)

; Polly is a vumpus
(assert (is-vumpus Polly))

; Vumpuses are wooden
(assert (forall ((p Person)) (=> (is-vumpus p) (is-wooden p))))

; Every vumpus is a jompus
(assert (forall ((p Person)) (=> (is-vumpus p) (is-jompus p))))

; Each jompus is a wumpus
(assert (forall ((p Person)) (=> (is-jompus p) (is-wumpus p))))

; Wumpuses are not transparent
(assert (forall ((p Person)) (=> (is-wumpus p) (not (is-transparent p)))))

; Wumpuses are yumpuses
(assert (forall ((p Person)) (=> (is-wumpus p) (is-yumpus p))))

; Yumpuses are not bright
(assert (forall ((p Person)) (=> (is-yumpus p) (not (is-bright p)))))

; Each yumpus is an impus
(assert (forall ((p Person)) (=> (is-yumpus p) (is-impus p))))

; Every rompus is happy (not directly used for Polly, but included per the problem)
(assert (forall ((p Person)) (=> (is-rompus p) (is-happy p))))

; Impuses are not happy
(assert (forall ((p Person)) (=> (is-impus p) (not (is-happy p)))))

; Each impus is a dumpus
(assert (forall ((p Person)) (=> (is-impus p) (is-dumpus p))))

; Dumpuses are brown (not needed for happiness, but included for completeness)
; (assert (forall ((p Person)) (=> (is-dumpus p) (is-brown p))))

; Dumpuses are zumpuses
(assert (forall ((p Person)) (=> (is-dumpus p) (is-zumpus p))))

; Zumpuses are not sour
(assert (forall ((p Person)) (=> (is-zumpus p) (not (is-sour p)))))

; Zumpuses are numpuses
(assert (forall ((p Person)) (=> (is-zumpus p) (is-numpus p))))

; Every numpus is not angry
(assert (forall ((p Person)) (=> (is-numpus p) (not (is-angry p)))))

; Numpuses are tumpuses
(assert (forall ((p Person)) (=> (is-numpus p) (is-tumpus p))))

; (Optional) Additional facts could be added here if desired

; Test: Would Polly be happy? To verify, assert Polly is happy and check consistency
(assert (is-happy Polly))

(check-sat)
(get-model)