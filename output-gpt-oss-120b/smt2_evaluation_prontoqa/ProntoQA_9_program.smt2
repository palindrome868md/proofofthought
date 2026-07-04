;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations (unary predicates) -----------------------
(declare-fun Dumpus (Entity) Bool)
(declare-fun Shy (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Wooden (Entity) Bool)
(declare-fun Opaque (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Floral (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Bitter (Entity) Bool)
(declare-fun Vumpus (Entity) Bool)
(declare-fun Small (Entity) Bool)
(declare-fun Numpus (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Orange (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Amenable (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)

;--- Constant ---------------------------------------------------------
(declare-const Wren Entity)

;--- Knowledge base (universal rules) ---------------------------------
; Every dumpus is not shy.
(assert (forall ((x Entity))
        (=> (Dumpus x) (not (Shy x)))))

; Each dumpus is a tumpus.
(assert (forall ((x Entity))
        (=> (Dumpus x) (Tumpus x))))

; Rompuses are not wooden.
(assert (forall ((x Entity))
        (=> (Rompus x) (not (Wooden x)))))

; Tumpuses are opaque.
(assert (forall ((x Entity))
        (=> (Tumpus x) (Opaque x))))

; Every tumpus is a wumpus.
(assert (forall ((x Entity))
        (=> (Tumpus x) (Wumpus x))))

; Wumpuses are not floral.
(assert (forall ((x Entity))
        (=> (Wumpus x) (not (Floral x)))))

; Each wumpus is an impus.
(assert (forall ((x Entity))
        (=> (Wumpus x) (Impus x))))

; Impuses are bitter.
(assert (forall ((x Entity))
        (=> (Impus x) (Bitter x))))

; Every impus is a vumpus.
(assert (forall ((x Entity))
        (=> (Impus x) (Vumpus x))))

; Vumpuses are small.
(assert (forall ((x Entity))
        (=> (Vumpus x) (Small x))))

; Each vumpus is a numpus.
(assert (forall ((x Entity))
        (=> (Vumpus x) (Numpus x))))

; Every numpus is wooden.
(assert (forall ((x Entity))
        (=> (Numpus x) (Wooden x))))

; Each numpus is a yumpus.
(assert (forall ((x Entity))
        (=> (Numpus x) (Yumpus x))))

; Each yumpus is orange.
(assert (forall ((x Entity))
        (=> (Yumpus x) (Orange x))))

; Each yumpus is a jompus.
(assert (forall ((x Entity))
        (=> (Yumpus x) (Jompus x))))

; Each jompus is amenable.
(assert (forall ((x Entity))
        (=> (Jompus x) (Amenable x))))

; Every jompus is a zumpus.
(assert (forall ((x Entity))
        (=> (Jompus x) (Zumpus x))))

;--- Specific fact ----------------------------------------------------
; Wren is a tumpus.
(assert (Tumpus Wren))

;--- Query: Is Wren wooden? -------------------------------------------
(assert (Wooden Wren))

;--- Check the query ---------------------------------------------------
(check-sat)
(get-model)