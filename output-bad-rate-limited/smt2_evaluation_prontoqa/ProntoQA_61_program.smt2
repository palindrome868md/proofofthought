; Declare a single domain of individuals
(declare-sort Person 0)

; Constants
(declare-const Max Person)

; Predicates representing class membership and properties
(declare-fun is-rompus (Person) Bool)
(declare-fun is-numpus (Person) Bool)
(declare-fun is-zumpus (Person) Bool)
(declare-fun is-dumpus (Person) Bool)
(declare-fun is-yumpus (Person) Bool)
(declare-fun is-jompus (Person) Bool)
(declare-fun is-impus (Person) Bool)
(declare-fun is-tumpus (Person) Bool)
(declare-fun is-wumpus (Person) Bool)
(declare-fun is-vumpus (Person) Bool)

; Properties
(declare-fun is-nervous (Person) Bool)
(declare-fun is-bright (Person) Bool)
(declare-fun is-brown (Person) Bool)
(declare-fun is-liquid (Person) Bool)
(declare-fun is-small (Person) Bool)
(declare-fun is-transparent (Person) Bool)
(declare-fun is-sweet (Person) Bool)

; Knowledge base (the given statements)
(assert (is-rompus Max))

; Rompuses are numpuses
(assert (forall ((p Person)) (=> (is-rompus p) (is-numpus p))))
; Numpuses are brown
(assert (forall ((p Person)) (=> (is-numpus p) (is-brown p))))
; Numpuses are zumpuses
(assert (forall ((p Person)) (=> (is-numpus p) (is-zumpus p))))
; Every zumpus is bright
(assert (forall ((p Person)) (=> (is-zumpus p) (is-bright p))))
; Every zumpus is a dumpus
(assert (forall ((p Person)) (=> (is-zumpus p) (is-dumpus p))))
; Every dumpus is a yumpus
(assert (forall ((p Person)) (=> (is-dumpus p) (is-yumpus p))))
; Every yumpus is not nervous
(assert (forall ((p Person)) (=> (is-yumpus p) (not (is-nervous p)))))
; Yumpuses are jompuses
(assert (forall ((p Person)) (=> (is-yumpus p) (is-jompus p))))
; Jompuses are not liquid
(assert (forall ((p Person)) (=> (is-jompus p) (not (is-liquid p)))))
; Jompuses are impuses
(assert (forall ((p Person)) (=> (is-jompus p) (is-impus p))))
; Impuses are not small
(assert (forall ((p Person)) (=> (is-impus p) (not (is-small p)))))
; Each impus is a tumpus
(assert (forall ((p Person)) (=> (is-impus p) (is-tumpus p))))
; Tumpuses are not transparent
(assert (forall ((p Person)) (=> (is-tumpus p) (not (is-transparent p)))))
; Tumpuses are wumpuses
(assert (forall ((p Person)) (=> (is-tumpus p) (is-wumpus p))))

; Vumpuses are nervous (defined for completeness, though not used in deriving Max's status)
(assert (forall ((p Person)) (=> (is-vumpus p) (is-nervous p))))

; Test query: Is Max not nervous?
(assert (not (is-nervous Max)))
(check-sat)