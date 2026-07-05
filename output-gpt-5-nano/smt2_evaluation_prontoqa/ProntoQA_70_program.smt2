(declare-sort Object 0)

(declare-const Rex Object)

; Predicates for the various types and properties
(declare-fun jompus (Object) Bool)
(declare-fun earthy (Object) Bool)
(declare-fun yumpus (Object) Bool)
(declare-fun metallic (Object) Bool)
(declare-fun impus (Object) Bool)
(declare-fun dumpus (Object) Bool)
(declare-fun nervous (Object) Bool)
(declare-fun rompus (Object) Bool)
(declare-fun small (Object) Bool)
(declare-fun tumpus (Object) Bool)
(declare-fun transparent (Object) Bool)
(declare-fun vumpus (Object) Bool)

; Knowledge base (rules)
(assert (forall ((x Object)) (=> (jompus x) (earthy x))))
(assert (forall ((x Object)) (=> (jompus x) (yumpus x))))
(assert (forall ((x Object)) (=> (yumpus x) (metallic x))))
(assert (forall ((x Object)) (=> (yumpus x) (impus x))))
(assert (forall ((x Object)) (=> (impus x) (nervous x))))
(assert (forall ((x Object)) (=> (impus x) (rompus x))))
(assert (forall ((x Object)) (=> (rompus x) (small x))))
(assert (forall ((x Object)) (=> (rompus x) (tumpus x))))
(assert (forall ((x Object)) (=> (tumpus x) (transparent x))))
(assert (forall ((x Object)) (=> (tumpus x) (vumpus x))))
(assert (forall ((x Object)) (=> (dumpus x) (not (transparent x)))))

; Fact: Rex is a jompus
(assert (jompus Rex))

; Test: Would Rex be not transparent?
(assert (not (transparent Rex)))

; Determine satisfiability
(check-sat)
(get-model)