; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun Vumpus (Entity) Bool)
(declare-fun Rompus (Entity) Bool)
(declare-fun Fruity (Entity) Bool)
(declare-fun Zumpus (Entity) Bool)
(declare-fun Bright (Entity) Bool)
(declare-fun Tumpus (Entity) Bool)
(declare-fun Happy (Entity) Bool)
(declare-fun Jompus (Entity) Bool)
(declare-fun Large (Entity) Bool)
(declare-fun Impus (Entity) Bool)
(declare-fun Dumpus (Entity) Bool)
(declare-fun Angry (Entity) Bool)
(declare-fun Yumpus (Entity) Bool)
(declare-fun Orange (Entity) Bool)
(declare-fun Wumpus (Entity) Bool)
(declare-fun Numpus (Entity) Bool)

; Constants
(declare-const Rex Entity)

; Facts
(assert (Zumpus Rex))  ; Rex is a zumpus

; Universal rules (one per line for clarity)
(assert (forall ((x Entity)) (=> (Rompus x) (Fruity x))))
(assert (forall ((x Entity)) (=> (Rompus x) (Zumpus x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Bright x))))
(assert (forall ((x Entity)) (=> (Zumpus x) (Tumpus x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Happy x))))
(assert (forall ((x Entity)) (=> (Tumpus x) (Jompus x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Large x))))
(assert (forall ((x Entity)) (=> (Jompus x) (Impus x))))
(assert (forall ((x Entity)) (=> (Impus x) (Cold x))))
(assert (forall ((x Entity)) (=> (Impus x) (Dumpus x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Angry x))))
(assert (forall ((x Entity)) (=> (Dumpus x) (Yumpus x))))
(assert (forall ((x Entity)) (=> (Yumpus x) (not (Orange x)))))
(assert (forall ((x Entity)) (=> (Wumpus x) (not (Angry x)))))
(assert (forall ((x Entity)) (=> (Yumpus x) (Numpus x))))

; Note: We expressed properties like "Each yumpus is not orange" as:
; (forall x. Yumpus(x) -> not Orange(x))
; and included "Rex is a zumpus" above.

; Additional predicates needed by some rules (e.g., Cold)
(declare-fun Cold (Entity) Bool)

; Test: Is "Rex is not angry" true?
(assert (not (Angry Rex)))

; Check satisfiability and produce a model if possible
(check-sat)
(get-model)