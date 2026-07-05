; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun is-wumpus (Person) Bool)
(declare-fun is-impus (Person) Bool)
(declare-fun is-numpus (Person) Bool)
(declare-fun is-vumpus (Person) Bool)
(declare-fun is-dumpus (Person) Bool)
(declare-fun is-tumpus (Person) Bool)
(declare-fun is-zumpus (Person) Bool)
(declare-fun is-mean (Person) Bool)
(declare-fun is-large (Person) Bool)
(declare-fun is-hot (Person) Bool)
(declare-fun is-earthy (Person) Bool)
(declare-fun is-liquid (Person) Bool)

; Sam
(declare-const sam Person)

; Facts
(assert (is-wumpus sam))

; Rules
; Wumpuses are large
(assert (forall ((p Person)) (=> (is-wumpus p) (is-large p))))
; Wumpuses are impus
(assert (forall ((p Person)) (=> (is-wumpus p) (is-impus p))))
; Impus are not hot
(assert (forall ((p Person)) (=> (is-impus p) (not (is-hot p)))))
; Impus are numpuses
(assert (forall ((p Person)) (=> (is-impus p) (is-numpus p))))
; Numpus are earthy
(assert (forall ((p Person)) (=> (is-numpus p) (is-earthy p))))
; Numpus are vumpuses
(assert (forall ((p Person)) (=> (is-numpus p) (is-vumpus p))))
; Vumpus are liquid
(assert (forall ((p Person)) (=> (is-vumpus p) (is-liquid p))))
; Vumpus are dumpuses
(assert (forall ((p Person)) (=> (is-vumpus p) (is-dumpus p))))
; Dumpus are not mean
(assert (forall ((p Person)) (=> (is-dumpus p) (not (is-mean p)))))
; Dumpus are tumpuses
(assert (forall ((p Person)) (=> (is-dumpus p) (is-tumpus p))))
; Zumpuses are mean (not directly used for Sam, but included per knowledge)
(assert (forall ((p Person)) (=> (is-zumpus p) (is-mean p))))

; Test: Is Sam mean?
(assert (is-mean sam))

; Check satisfiability
(check-sat)