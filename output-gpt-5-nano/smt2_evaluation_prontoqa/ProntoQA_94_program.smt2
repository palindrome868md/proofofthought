; Sorts
(declare-sort Object 0)

; Predicates (unary relations)
(declare-fun Dumpus (Object) Bool)
(declare-fun Rompus (Object) Bool)
(declare-fun Jompus (Object) Bool)
(declare-fun Wumpus (Object) Bool)
(declare-fun Zumpus (Object) Bool)
(declare-fun Vumpus (Object) Bool)
(declare-fun Yumpus (Object) Bool)
(declare-fun Impus (Object) Bool)
(declare-fun Numpus (Object) Bool)
(declare-fun Angry (Object) Bool)
(declare-fun Wood (Object) Bool)
(declare-fun Small (Object) Bool)
(declare-fun Orange (Object) Bool)
(declare-fun Earthy (Object) Bool)
(declare-fun Spicy (Object) Bool)
(declare-fun Hot (Object) Bool)
(declare-fun Tumpus (Object) Bool)

; Constant representing Max
(declare-const Max Object)

; Knowledge base

; Fact: Max is a dumpus
(assert (Dumpus Max))

; Rules (universal)
(assert (forall ((x Object)) (=> (Dumpus x) (Rompus x))))
(assert (forall ((x Object)) (=> (Dumpus x) (Wood x))))
(assert (forall ((x Object)) (=> (Rompus x) (Small x))))
(assert (forall ((x Object)) (=> (Rompus x) (Jompus x))))
(assert (forall ((x Object)) (=> (Jompus x) (Orange x))))
(assert (forall ((x Object)) (=> (Jompus x) (Wumpus x))))
(assert (forall ((x Object)) (=> (Wumpus x) (Earthy x))))
(assert (forall ((x Object)) (=> (Wumpus x) (Zumpus x))))
(assert (forall ((x Object)) (=> (Zumpus x) (Angry x))))
(assert (forall ((x Object)) (=> (Zumpus x) (Vumpus x))))
(assert (forall ((x Object)) (=> (Vumpus x) (Yumpus x))))
(assert (forall ((x Object)) (=> (Yumpus x) (Impus x))))
(assert (forall ((x Object)) (=> (Impus x) (Numpus x))))
(assert (forall ((x Object)) (=> (Vumpus x) (not (Spicy x)))))
(assert (forall ((x Object)) (=> (Tumpus x) (not (Angry x)))))
(assert (forall ((x Object)) (=> (Yumpus x) (not (Hot x)))))

; Test: Is Max angry?
(assert (Angry Max))

; Check satisfiability and model
(check-sat)
(get-model)