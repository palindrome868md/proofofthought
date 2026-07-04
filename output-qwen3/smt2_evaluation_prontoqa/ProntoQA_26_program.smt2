; Reasoning Steps:
; 1. Analyze the Knowledge Base:
;    - Chain of implications starting from 'jompus':
;      jompus -> impus -> wumpus -> rompus -> zumpus -> large.
;    - Other rules (numpus, tumpus, vumpus, yumpus, etc.) define properties 
;      but do not interfere with the specific chain for Rex.
;
; 2. Trace Properties of 'Rex':
;    - Fact: Rex is a jompus.
;    - Rule: Every jompus is an impus. => Rex is an impus.
;    - Rule: Impuses are wumpuses. => Rex is a wumpus.
;    - Rule: Wumpuses are rompuses. => Rex is a rompus.
;    - Rule: Each rompus is a zumpus. => Rex is a zumpus.
;    - Rule: Every zumpus is large. => Rex is large.
;
; 3. Formulate Verification:
;    - To verify "Rex is large", we assert the Knowledge Base.
;    - We assert the specific fact "Rex is a jompus".
;    - We assert the statement in question "(large rex)".
;    - We check satisfiability.
;    - If 'sat', the statement is consistent/True given the KB.
;    - If 'unsat', the statement contradicts the KB/False.
;    - Based on the deduction, we expect 'sat'.

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Predicates (Functions returning Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun fruity (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun dull (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun orange (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun shy (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun sweet (Thing) Bool)
(declare-fun rompus (Thing) Bool)
(declare-fun amenable (Thing) Bool)
(declare-fun zumpus (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun transparent (Thing) Bool)
(declare-fun dumpus (Thing) Bool)

; 3. Declare Constants
(declare-const rex Thing)

; 4. Assert Knowledge Base (Rules)
; Each numpus is fruity
(assert (forall ((x Thing)) (=> (numpus x) (fruity x))))
; Every numpus is a tumpus
(assert (forall ((x Thing)) (=> (numpus x) (tumpus x))))
; Every tumpus is dull
(assert (forall ((x Thing)) (=> (tumpus x) (dull x))))
; Every tumpus is a jompus
(assert (forall ((x Thing)) (=> (tumpus x) (jompus x))))
; Every jompus is not orange
(assert (forall ((x Thing)) (=> (jompus x) (not (orange x)))))
; Each jompus is an impus
(assert (forall ((x Thing)) (=> (jompus x) (impus x))))
; Each impus is not shy
(assert (forall ((x Thing)) (=> (impus x) (not (shy x)))))
; Impuses are wumpuses
(assert (forall ((x Thing)) (=> (impus x) (wumpus x))))
; Wumpuses are sweet
(assert (forall ((x Thing)) (=> (wumpus x) (sweet x))))
; Wumpuses are rompuses
(assert (forall ((x Thing)) (=> (wumpus x) (rompus x))))
; Every rompus is not amenable
(assert (forall ((x Thing)) (=> (rompus x) (not (amenable x)))))
; Each rompus is a zumpus
(assert (forall ((x Thing)) (=> (rompus x) (zumpus x))))
; Every zumpus is large
(assert (forall ((x Thing)) (=> (zumpus x) (large x))))
; Zumpuses are yumpuses
(assert (forall ((x Thing)) (=> (zumpus x) (yumpus x))))
; Every vumpus is not large
(assert (forall ((x Thing)) (=> (vumpus x) (not (large x)))))
; Yumpuses are transparent
(assert (forall ((x Thing)) (=> (yumpus x) (transparent x))))
; Yumpuses are dumpuses
(assert (forall ((x Thing)) (=> (yumpus x) (dumpus x))))

; 5. Assert Facts about Rex
; Rex is a jompus
(assert (jompus rex))

; 6. Verification Query
; Question: Is the following statement true or false? Rex is large.
; We assert the statement to check if it is satisfiable (True) or unsatisfiable (False)
(assert (large rex))

; 7. Check Satisfiability
(check-sat)
(get-model)