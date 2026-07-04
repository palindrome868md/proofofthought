; -------------------------------------------------
; Sort declaration
(declare-sort Entity 0)

; -------------------------------------------------
; Predicate declarations (unary predicates)
(declare-fun numpus   (Entity) Bool)
(declare-fun opaque   (Entity) Bool)
(declare-fun wumpus   (Entity) Bool)
(declare-fun feisty   (Entity) Bool)
(declare-fun tumpus   (Entity) Bool)
(declare-fun fruity   (Entity) Bool)
(declare-fun dumpus   (Entity) Bool)
(declare-fun wooden   (Entity) Bool)
(declare-fun yumpus   (Entity) Bool)
(declare-fun blue     (Entity) Bool)
(declare-fun zumpus   (Entity) Bool)
(declare-fun spicy    (Entity) Bool)
(declare-fun impus    (Entity) Bool)
(declare-fun kind     (Entity) Bool)
(declare-fun rompus   (Entity) Bool)
(declare-fun dull     (Entity) Bool)
(declare-fun vumpus   (Entity) Bool)
(declare-fun jompus   (Entity) Bool)

; -------------------------------------------------
; Constant declaration
(declare-const Sam Entity)

; -------------------------------------------------
; Knowledge base (facts and universal rules)

; Each numpus is not opaque.
(assert (forall ((x Entity))
        (=> (numpus x) (not (opaque x)))))

; Each numpus is a wumpus.
(assert (forall ((x Entity))
        (=> (numpus x) (wumpus x))))

; Each wumpus is feisty.
(assert (forall ((x Entity))
        (=> (wumpus x) (feisty x))))

; Wumpuses are tumpuses.
(assert (forall ((x Entity))
        (=> (wumpus x) (tumpus x))))

; Tumpuses are fruity.
(assert (forall ((x Entity))
        (=> (tumpus x) (fruity x))))

; Every tumpus is a dumpus.
(assert (forall ((x Entity))
        (=> (tumpus x) (dumpus x))))

; Every dumpus is wooden.
(assert (forall ((x Entity))
        (=> (dumpus x) (wooden x))))

; Each dumpus is a yumpus.
(assert (forall ((x Entity))
        (=> (dumpus x) (yumpus x))))

; Yumpuses are blue.
(assert (forall ((x Entity))
        (=> (yumpus x) (blue x))))

; Each yumpus is a zumpus.
(assert (forall ((x Entity))
        (=> (yumpus x) (zumpus x))))

; Every zumpus is spicy.
(assert (forall ((x Entity))
        (=> (zumpus x) (spicy x))))

; Zumpuses are impuses.
(assert (forall ((x Entity))
        (=> (zumpus x) (impus x))))

; Each impus is not kind.
(assert (forall ((x Entity))
        (=> (impus x) (not (kind x)))))

; Impuses are rompuses.
(assert (forall ((x Entity))
        (=> (impus x) (rompus x))))

; Jompuses are not dull.
(assert (forall ((x Entity))
        (=> (jompus x) (not (dull x)))))

; Every rompus is dull.
(assert (forall ((x Entity))
        (=> (rompus x) (dull x))))

; Each rompus is a vumpus.
(assert (forall ((x Entity))
        (=> (rompus x) (vumpus x))))

; Sam is a dumpus.
(assert (dumpus Sam))

; -------------------------------------------------
; Test the statement: "Sam is not dull"
(assert (not (dull Sam)))

; -------------------------------------------------
; Check the consistency of the whole set of assertions
(check-sat)
(get-model)