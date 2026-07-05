(declare-sort Person 0)

; Predicates
(declare-fun luminous (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun feisty (Person) Bool)
(declare-fun sour (Person) Bool)
(declare-fun fruity (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun large (Person) Bool)

; Constant
(declare-const Alex Person)

; Knowledge base
; Rompuses are luminous
(assert (forall ((p Person)) (=> (rompus p) (luminous p))))
; Rompuses are impuses
(assert (forall ((p Person)) (=> (rompus p) (impus p))))
; Yumpuses are feisty
(assert (forall ((p Person)) (=> (yumpus p) (feisty p))))
; Each impus is not sour
(assert (forall ((p Person)) (=> (impus p) (not (sour p)))))
; Impuses are wumpuses
(assert (forall ((p Person)) (=> (impus p) (wumpus p))))
; Wumpuses are not fruity
(assert (forall ((p Person)) (=> (wumpus p) (not (fruity p)))))
; Wumpuses are numpuses
(assert (forall ((p Person)) (=> (wumpus p) (numpus p))))
; Every numpus is blue
(assert (forall ((p Person)) (=> (numpus p) (blue p))))
; Every numpus is a dumpus
(assert (forall ((p Person)) (=> (numpus p) (dumpus p))))
; Every dumpus is not feisty
(assert (forall ((p Person)) (=> (dumpus p) (not (feisty p)))))
; Each dumpus is a tumpus
(assert (forall ((p Person)) (=> (dumpus p) (tumpus p))))
; Tumpuses are kind
(assert (forall ((p Person)) (=> (tumpus p) (kind p))))
; Every tumpus is a vumpus
(assert (forall ((p Person)) (=> (tumpus p) (vumpus p))))
; Each vumpus is opaque
(assert (forall ((p Person)) (=> (vumpus p) (opaque p))))
; Vumpuses are zumpuses
(assert (forall ((p Person)) (=> (vumpus p) (zumpus p))))
; Each zumpus is not large
(assert (forall ((p Person)) (=> (zumpus p) (not (large p)))))
; Zumpuses are jompuses
(assert (forall ((p Person)) (=> (zumpus p) (jompus p))))

; Alex is a rompus
(assert (rompus Alex))

; Query: Is Alex not feisty?
(assert (not (feisty Alex)))

; Check
(check-sat)
(get-model)