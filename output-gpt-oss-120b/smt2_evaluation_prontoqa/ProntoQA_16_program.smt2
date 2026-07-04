; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Thing 0)

; unary predicates
(declare-fun yumpus   (Thing) Bool)
(declare-fun rompus   (Thing) Bool)
(declare-fun happy    (Thing) Bool)
(declare-fun impus    (Thing) Bool)
(declare-fun amenable (Thing) Bool)
(declare-fun dumpus   (Thing) Bool)
(declare-fun opaque   (Thing) Bool)
(declare-fun tumpus   (Thing) Bool)
(declare-fun numpus   (Thing) Bool)
(declare-fun small    (Thing) Bool)
(declare-fun orange   (Thing) Bool)
(declare-fun wumpus   (Thing) Bool)
(declare-fun vumpus   (Thing) Bool)
(declare-fun fruity   (Thing) Bool)
(declare-fun jompus   (Thing) Bool)
(declare-fun dull     (Thing) Bool)
(declare-fun zumpus   (Thing) Bool)
(declare-fun hot      (Thing) Bool)

; the individual Sally
(declare-const sally Thing)

; -------------------------------------------------
;  Knowledge base (facts + universal rules)
; -------------------------------------------------
; 1. Sally is a rompus
(assert (rompus sally))

; 2. Universal statements
(assert (forall ((x Thing)) (=> (yumpus x) (hot x))))
(assert (forall ((x Thing)) (=> (yumpus x) (rompus x))))
(assert (forall ((x Thing)) (=> (rompus x) (happy x))))
(assert (forall ((x Thing)) (=> (rompus x) (impus x))))
(assert (forall ((x Thing)) (=> (impus x) (not (amenable x)))))
(assert (forall ((x Thing)) (=> (impus x) (dumpus x))))
(assert (forall ((x Thing)) (=> (dumpus x) (opaque x))))
(assert (forall ((x Thing)) (=> (dumpus x) (tumpus x))))
(assert (forall ((x Thing)) (=> (numpus x) (small x))))
(assert (forall ((x Thing)) (=> (tumpus x) (orange x))))
(assert (forall ((x Thing)) (=> (tumpus x) (wumpus x))))
(assert (forall ((x Thing)) (=> (wumpus x) (not (small x)))))
(assert (forall ((x Thing)) (=> (wumpus x) (vumpus x))))
(assert (forall ((x Thing)) (=> (vumpus x) (fruity x))))
(assert (forall ((x Thing)) (=> (vumpus x) (jompus x))))
(assert (forall ((x Thing)) (=> (jompus x) (not (dull x)))))
(assert (forall ((x Thing)) (=> (jompus x) (zumpus x))))

; -------------------------------------------------
;  Query: "Sally is small."
; -------------------------------------------------
(assert (small sally))

(check-sat)      ; expected result: unsat (the statement is false)
(get-model)