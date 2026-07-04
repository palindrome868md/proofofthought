; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for properties)
(declare-fun zumpus (Thing) Bool)
(declare-fun opaque (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun brown (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun amenable (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun bitter (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun cold (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun wooden (Thing) Bool)
(declare-fun rompus (Thing) Bool)
(declare-fun floral (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun feisty (Thing) Bool)
(declare-fun jompus (Thing) Bool)

; 3. Declare constants
(declare-const sally Thing)

; 4. Assert knowledge base (facts from the problem description)
; Every zumpus is not opaque
(assert (forall ((x Thing)) (=> (zumpus x) (not (opaque x)))))
; Each zumpus is a numpus
(assert (forall ((x Thing)) (=> (zumpus x) (numpus x))))
; Numpuses are brown
(assert (forall ((x Thing)) (=> (numpus x) (brown x))))
; Numpuses are dumpuses
(assert (forall ((x Thing)) (=> (numpus x) (dumpus x))))
; Each dumpus is amenable
(assert (forall ((x Thing)) (=> (dumpus x) (amenable x))))
; Impuses are not bitter
(assert (forall ((x Thing)) (=> (impus x) (not (bitter x)))))
; Every dumpus is a vumpus
(assert (forall ((x Thing)) (=> (dumpus x) (vumpus x))))
; Each vumpus is not cold
(assert (forall ((x Thing)) (=> (vumpus x) (not (cold x)))))
; Each vumpus is a tumpus
(assert (forall ((x Thing)) (=> (vumpus x) (tumpus x))))
; Every tumpus is wooden
(assert (forall ((x Thing)) (=> (tumpus x) (wooden x))))
; Every tumpus is a rompus
(assert (forall ((x Thing)) (=> (tumpus x) (rompus x))))
; Each rompus is floral
(assert (forall ((x Thing)) (=> (rompus x) (floral x))))
; Rompuses are yumpuses
(assert (forall ((x Thing)) (=> (rompus x) (yumpus x))))
; Yumpuses are bitter
(assert (forall ((x Thing)) (=> (yumpus x) (bitter x))))
; Every yumpus is a wumpus
(assert (forall ((x Thing)) (=> (yumpus x) (wumpus x))))
; Wumpuses are not feisty
(assert (forall ((x Thing)) (=> (wumpus x) (not (feisty x)))))
; Wumpuses are jompuses
(assert (forall ((x Thing)) (=> (wumpus x) (jompus x))))
; Sally is a dumpus
(assert (dumpus sally))

; 5. Verify the statement: "Sally is bitter"
; We assert the statement and check for satisfiability.
; If sat, the statement is True (consistent with KB).
; If unsat, the statement is False (contradicts KB).
(assert (bitter sally))

(check-sat)
(get-model)