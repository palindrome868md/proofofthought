;--- Sort declaration -------------------------------------------------
(declare-sort Obj 0)                     ; universal sort for all objects

;--- Predicate (function) declarations --------------------------------
(declare-fun Jompus   (Obj) Bool)
(declare-fun Spicy    (Obj) Bool)
(declare-fun Yumpus   (Obj) Bool)
(declare-fun Small    (Obj) Bool)
(declare-fun Vumpus   (Obj) Bool)
(declare-fun Impus    (Obj) Bool)
(declare-fun Liquid   (Obj) Bool)
(declare-fun Blue     (Obj) Bool)
(declare-fun Dumpus   (Obj) Bool)
(declare-fun Fruity   (Obj) Bool)
(declare-fun Zumpus   (Obj) Bool)
(declare-fun Aggressive (Obj) Bool)
(declare-fun Rompus   (Obj) Bool)
(declare-fun Opaque   (Obj) Bool)
(declare-fun Wumpus   (Obj) Bool)
(declare-fun Tumpus   (Obj) Bool)

;--- Constant (individual) declaration --------------------------------
(declare-const Wren Obj)

;--- Knowledge base (facts & rules) ------------------------------------
; Jompuses are spicy.
(assert (forall ((x Obj))
        (=> (Jompus x) (Spicy x))))

; Jompuses are yumpuses.
(assert (forall ((x Obj))
        (=> (Jompus x) (Yumpus x))))

; Yumpuses are small.
(assert (forall ((x Obj))
        (=> (Yumpus x) (Small x))))

; Each yumpus is a vumpus.
(assert (forall ((x Obj))
        (=> (Yumpus x) (Vumpus x))))

; Every impus is not liquid.
(assert (forall ((x Obj))
        (=> (Impus x) (not (Liquid x)))))

; Every vumpus is blue.
(assert (forall ((x Obj))
        (=> (Vumpus x) (Blue x))))

; Vumpuses are dumpuses.
(assert (forall ((x Obj))
        (=> (Vumpus x) (Dumpus x))))

; Every dumpus is fruity.
(assert (forall ((x Obj))
        (=> (Dumpus x) (Fruity x))))

; Every dumpus is a zumpus.
(assert (forall ((x Obj))
        (=> (Dumpus x) (Zumpus x))))

; Each zumpus is aggressive.
(assert (forall ((x Obj))
        (=> (Zumpus x) (Aggressive x))))

; Every zumpus is a rompus.
(assert (forall ((x Obj))
        (=> (Zumpus x) (Rompus x))))

; Rompuses are opaque.
(assert (forall ((x Obj))
        (=> (Rompus x) (Opaque x))))

; Every rompus is a wumpus.
(assert (forall ((x Obj))
        (=> (Rompus x) (Wumpus x))))

; Each wumpus is liquid.
(assert (forall ((x Obj))
        (=> (Wumpus x) (Liquid x))))

; Each wumpus is a tumpus.
(assert (forall ((x Obj))
        (=> (Wumpus x) (Tumpus x))))

; Fact: Wren is a vumpus.
(assert (Vumpus Wren))

;--- Test the query ----------------------------------------------------
; Is Wren liquid?
(assert (Liquid Wren))

;--- Solve -------------------------------------------------------------
(check-sat)
(get-model)