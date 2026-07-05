(declare-sort Person 0)

; Constants
(declare-const Stella Person)

; Predicates (uninterpreted unary predicates for each category)
(declare-fun Impus (Person) Bool)
(declare-fun Rompus (Person) Bool)
(declare-fun Wumpus (Person) Bool)
(declare-fun Dumpus (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Yumpus (Person) Bool)
(declare-fun Vumpus (Person) Bool)
(declare-fun Jompus (Person) Bool)
(declare-fun Zumpus (Person) Bool)
(declare-fun Tumpus (Person) Bool)

(declare-fun Earthy (Person) Bool)
(declare-fun Kind (Person) Bool)
(declare-fun Temperate (Person) Bool)
(declare-fun Wooden (Person) Bool)
(declare-fun Blue (Person) Bool)
(declare-fun Large (Person) Bool)
(declare-fun Dull (Person) Bool)
(declare-fun Nervous (Person) Bool)

; Knowledge base (rules)
(assert (Impus Stella))  ; Stella is an impus

; Impus -> Rompus, Earthy
(assert (forall ((p Person)) (=> (Impus p) (Rompus p))))
(assert (forall ((p Person)) (=> (Impus p) (Earthy p))))
; Rompus -> Kind, Wumpus
(assert (forall ((p Person)) (=> (Rompus p) (Kind p))))
(assert (forall ((p Person)) (=> (Rompus p) (Wumpus p))))
; Wumpus -> Temperate, Dumpus
(assert (forall ((p Person)) (=> (Wumpus p) (Temperate p))))
(assert (forall ((p Person)) (=> (Wumpus p) (Dumpus p))))
; Dumpus -> Wooden, Numpus
(assert (forall ((p Person)) (=> (Dumpus p) (Wooden p))))
(assert (forall ((p Person)) (=> (Dumpus p) (Numpus p))))
; Numpus -> not Blue, Yumpus
(assert (forall ((p Person)) (=> (Numpus p) (not (Blue p)))))
(assert (forall ((p Person)) (=> (Numpus p) (Yumpus p))))
; Yumpus -> Large, Vumpus
(assert (forall ((p Person)) (=> (Yumpus p) (Large p))))
(assert (forall ((p Person)) (=> (Yumpus p) (Vumpus p))))
; Vumpus -> Dull, Jompus
(assert (forall ((p Person)) (=> (Vumpus p) (Dull p))))
(assert (forall ((p Person)) (=> (Vumpus p) (Jompus p))))
; Jompus -> Nervous, Zumpus
(assert (forall ((p Person)) (=> (Jompus p) (Nervous p))))
(assert (forall ((p Person)) (=> (Jompus p) (Zumpus p))))
; Tumpus -> Blue
(assert (forall ((p Person)) (=> (Tumpus p) (Blue p))))

; Query: Is Stella blue?
(assert (Blue Stella))

(check-sat)
(get-model)