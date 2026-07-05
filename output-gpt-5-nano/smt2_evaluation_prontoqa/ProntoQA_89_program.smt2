; Domain
(declare-sort Person 0)

; Predicates (uninterpreted relations)
(declare-fun Tumpus (Person) Bool)
(declare-fun Vumpus (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Rompus (Person) Bool)
(declare-fun Impuse (Person) Bool)
(declare-fun Jompuse (Person) Bool)
(declare-fun Yumpuse (Person) Bool)
(declare-fun Brown (Person) Bool)
(declare-fun Small (Person) Bool)
(declare-fun Liquid (Person) Bool)

; Constants
(declare-const max Person)

; Axioms / Knowledge base
; Max is a tumpus
(assert (Tumpus max))

; Tumpus -> Vumpus
(assert (forall ((p Person)) (=> (Tumpus p) (Vumpus p))))
; Vumpus -> Numpus
(assert (forall ((p Person)) (=> (Vumpus p) (Numpus p))))
; Numpus -> Liquid
(assert (forall ((p Person)) (=> (Numpus p) (Liquid p))))
; Numpus -> Impuse
(assert (forall ((p Person)) (=> (Numpus p) (Impuse p))))
; Impuse -> Jompuse
(assert (forall ((p Person)) (=> (Impuse p) (Jompuse p))))
; Jompuse -> Brown
(assert (forall ((p Person)) (=> (Jompuse p) (Brown p))))
; Jompuse -> Yumpuse
(assert (forall ((p Person)) (=> (Jompuse p) (Yumpuse p))))
; Rompus -> not Brown
(assert (forall ((p Person)) (=> (Rompus p) (not (Brown p)))))
; Impuse -> not Small
(assert (forall ((p Person)) (=> (Impuse p) (not (Small p)))))

; Test scenario: Max is not brown
(assert (not (Brown max)))

; Query
(check-sat)