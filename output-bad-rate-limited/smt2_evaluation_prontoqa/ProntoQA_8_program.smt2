; Sorts
(declare-sort Person 0)

; Predicates (unary relations on Person)
(declare-fun jompus (Person) Bool)
(declare-fun sour (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun feisty (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun small (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun impuse (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun brown (Person) Bool)
(declare-fun hot (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun numpuses (Person) Bool)
(declare-fun dull (Person) Bool)

; Constants
(declare-const alex Person)

; Knowledge base (facts and rules)

; 1) If someone is a jompus, they are sour
(assert (forall ((p Person)) (=> (jompus p) (sour p))))
; 2) If someone is a jompus, they are a rompus
(assert (forall ((p Person)) (=> (jompus p) (rompus p))))
; 3) Rompuses are not kind
(assert (forall ((p Person)) (=> (rompus p) (not (kind p)))))
; 4) Every rompus is a zumpus
(assert (forall ((p Person)) (=> (rompus p) (zumpus p))))
; 5) Every zumpus is feisty
(assert (forall ((p Person)) (=> (zumpus p) (feisty p))))
; 6) Every zumpus is a tumpus
(assert (forall ((p Person)) (=> (zumpus p) (tumpus p))))
; 7) Every tumpus is small
(assert (forall ((p Person)) (=> (tumpus p) (small p))))
; 8) Every tumpus is a wumpus
(assert (forall ((p Person)) (=> (tumpus p) (wumpus p))))
; 9) Every wumpus is opaque
(assert (forall ((p Person)) (=> (wumpus p) (opaque p))))
; 10) Every wumpus is an impuse
(assert (forall ((p Person)) (=> (wumpus p) (impuse p))))
; 11) Every yumpus is hot
(assert (forall ((p Person)) (=> (yumpus p) (hot p))))
; 12) Impuses are brown
(assert (forall ((p Person)) (=> (impuse p) (brown p))))
; 13) Impuses are dumpuses
(assert (forall ((p Person)) (=> (impuse p) (dumpus p))))
; 14) Dumpuses are not hot
(assert (forall ((p Person)) (=> (dumpus p) (not (hot p)))))
; 15) Every dumpus is a vumpus
(assert (forall ((p Person)) (=> (dumpus p) (vumpus p))))
; 16) Each vumpus is dull
(assert (forall ((p Person)) (=> (vumpus p) (dull p))))
; 17) Vumpuses are numpuses
(assert (forall ((p Person)) (=> (vumpus p) (numpuses p))))

; 18) Alex is a zumpus
(assert (zumpus alex))

; Test scenario: Is Alex hot?
(assert (hot alex))

; Verification
(check-sat)
(get-model)