; 1. Sorts
(declare-sort Entity 0)

; 2. Predicates (uninterpreted)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Dull (Entity) Bool)
(declare-fun Transparent (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Spicy (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Floral (Entity) Bool)
(declare-fun Impus (Entity) Bool
)
(declare-fun Jompus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Blue (Entity) Bool)
(declare-fun Liquid (Entity) Bool)
(declare-fun Hot (Entity) Bool)

; 3. Constants
(declare-const sam Entity)

; 4. Facts
(assert (Vumpus sam))

; 5. Knowledge base (universal rules)
; Zumpuses are dull
(assert (forall ((x Entity)) (=> (Zumpus x) (Dull x))))
; Every vumpus is not transparent
(assert (forall ((x Entity)) (=> (Vumpus x) (not (Transparent x)))))
; Vumpuses are numpuses
(assert (forall ((x Entity)) (=> (Vumpus x) (Numpus x))))
; Numpuses are blue
(assert (forall ((x Entity)) (=> (Numpus x) (Blue x))))
; Numpuses are wumpuses
(assert (forall ((x Entity)) (=> (Numpus x) (Wumpus x))))
; Wumpuses are liquid
(assert (forall ((x Entity)) (=> (Wumpus x) (Liquid x))))
; Each wumpus is a tumpus
(assert (forall ((x Entity)) (=> (Wumpus x) (Tumpus x))))
; Tumpuses are not spicy
(assert (forall ((x Entity)) (=> (Tumpus x) (not (Spicy x))))
)
; Tumpuses are rompuses
(assert (forall ((x Entity)) (=> (Tumpus x) (Rompus x))))
; Each rompus is not dull
(assert (forall ((x Entity)) (=> (Rompus x) (not (Dull x))))
)
; Rompuses are yumpuses
(assert (forall ((x Entity)) (=> (Rompus x) (Yumpus x))))
; Every yumpus is floral
(assert (forall ((x Entity) ( => (Yumpus x) (Floral x)) )))
; Every yumpus is an impus
(assert (forall ((x Entity)) (=> (Yumpus x) (Impus x))))
; Impuses are hot
(assert (forall ((x Entity)) (=> (Impus x) (Hot x))))
; Each impus is a jompus
(assert (forall ((x Entity)) (=> (Implus x) (Jompus x))))
; Every jompus is large
(assert (forall ((x Entity) ( => (Jompus x) (Large x)) )))
; Jompuses are dumpuses
(assert (forall ((x Entity) ( => (Jompus x) (Dumpus x)) )))

; 6. Test: Is "Sam not dull" true?
(assert (not (Dull sam)))

; 7. Check satisfiability and model
(check-sat)
(get-model)