;-------------------------------------------------
;  Declare the domain of individuals
;-------------------------------------------------
(declare-sort Entity 0)

;-------------------------------------------------
;  Declare predicates (unary Boolean functions)
;-------------------------------------------------
(declare-fun Rompus (Entity) Bool)
(declare-fun Large (Entity) Bool)          ; not needed for the query
(declare-fun Wumpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Cold (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)

;-------------------------------------------------
;  Declare the individual mentioned in the problem
;-------------------------------------------------
(declare-const Wren Entity)

;-------------------------------------------------
;  Knowledge base (facts + universal rules)
;-------------------------------------------------
; Rompuses are large.
(assert (forall ((x Entity)) (=> (Rompus x) (Large x))))

; Every rompus is a wumpus.
(assert (forall ((x Entity)) (=> (Rompus x) (Wumpus x))))

; Every wumpus is not blue.
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Blue x)))))

; Wumpuses are numpuses.
(assert (forall ((x Entity)) (=> (Wumpus x) (Numpus x))))

; Numpuses are cold.
(assert (forall ((x Entity)) (=> (Numpus x) (Cold x))))

; Numpuses are impuses.
(assert (forall ((x Entity)) (=> (Numpus x) (Impus x))))

; Every impus is fruity.
(assert (forall ((x Entity)) (=> (Impus x) (Fruity x))))

; Each impus is a jompus.
(assert (forall ((x Entity)) (=> (Impus x) (Jompus x))))

; Every jompus is spicy.
(assert (forall ((x Entity)) (=> (Jompus x) (Spicy x))))

; Jompuses are zumpuses.
(assert (forall ((x Entity)) (=> (Jompus x) (Zumpus x))))

; Each vumpus is not spicy.
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Spicy x)))))

; Zumpuses are not dull.
(assert (forall ((x Entity)) (=> (Zumpus x) (not (Dull x)))))

; Zumpuses are yumpuses.
(assert (forall ((x Entity)) (=> (Zumpus x) (Yumpus x))))

; Yumpuses are liquid.
(assert (forall ((x Entity)) (=> (Yumpus x) (Liquid x))))

; Each yumpus is a tumpus.
(assert (forall ((x Entity)) (=> (Yumpus x) (Tumpus x))))

; Every tumpus is opaque.
(assert (forall ((x Entity)) (=> (Tumpus x) (Opaque x))))

; Tumpuses are dumpuses.
(assert (forall ((x Entity)) (=> (Tumpus x) (Dumpus x))))

; Fact: Wren is a rompus.
(assert (Rompus Wren))

;-------------------------------------------------
;  Query: Is Wren spicy?
;-------------------------------------------------
(assert (Spicy Wren))

;-------------------------------------------------
;  Check the consistency of the whole set of assertions
;-------------------------------------------------
(check-sat)
(get-model)