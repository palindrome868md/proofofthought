; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Predicates (Functions returning Bool)
(declare-fun rompus (Thing) Bool)
(declare-fun cold (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun mean (Thing) Bool)
(declare-fun dumpus (Thing) Bool)
(declare-fun floral (Thing) Bool)
(declare-fun zumpus (Thing) Bool)
(declare-fun opaque (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun shy (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun wooden (Thing) Bool)
(declare-fun yumpus (Thing) Bool)

; 3. Declare Constants
(declare-const sally Thing)

; 4. Assert Knowledge Base (Rules)
; Every rompus is cold.
(assert (forall ((x Thing)) (=> (rompus x) (cold x))))
; Each rompus is an impus.
(assert (forall ((x Thing)) (=> (rompus x) (impus x))))
; Every numpus is not dull.
(assert (forall ((x Thing)) (=> (numpus x) (not (dull x)))))
; Each impus is large.
(assert (forall ((x Thing)) (=> (impus x) (large x))))
; Impuses are vumpuses.
(assert (forall ((x Thing)) (=> (impus x) (vumpus x))))
; Every vumpus is mean.
(assert (forall ((x Thing)) (=> (vumpus x) (mean x))))
; Vumpuses are dumpuses.
(assert (forall ((x Thing)) (=> (vumpus x) (dumpus x))))
; Each dumpus is floral.
(assert (forall ((x Thing)) (=> (dumpus x) (floral x))))
; Dumpuses are zumpuses.
(assert (forall ((x Thing)) (=> (dumpus x) (zumpus x))))
; Zumpuses are opaque.
(assert (forall ((x Thing)) (=> (zumpus x) (opaque x))))
; Every zumpus is a jompus.
(assert (forall ((x Thing)) (=> (zumpus x) (jompus x))))
; Each jompus is dull.
(assert (forall ((x Thing)) (=> (jompus x) (dull x))))
; Each jompus is a wumpus.
(assert (forall ((x Thing)) (=> (jompus x) (wumpus x))))
; Every wumpus is shy.
(assert (forall ((x Thing)) (=> (wumpus x) (shy x))))
; Each wumpus is a tumpus.
(assert (forall ((x Thing)) (=> (wumpus x) (tumpus x))))
; Each tumpus is wooden.
(assert (forall ((x Thing)) (=> (tumpus x) (wooden x))))
; Each tumpus is a yumpus.
(assert (forall ((x Thing)) (=> (tumpus x) (yumpus x))))

; 5. Assert Facts
; Sally is an impus.
(assert (impus sally))

; 6. Verification
; Test Statement: "Sally is not dull"
; We assert the negation of "Sally is dull" to check consistency.
(assert (not (dull sally)))

; 7. Check Satisfiability
; Expected: unsat (meaning the statement "Sally is not dull" is False)
(check-sat)
(get-model)