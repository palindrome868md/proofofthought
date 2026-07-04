; Reasoning Steps:
; 1. Identify the goal: Determine if "Alex is amenable" is True or False.
; 2. Trace the properties of Alex based on the knowledge base:
;    - Fact: Alex is an impus.
;    - Rule: Each impus is a wumpus. (Alex is wumpus)
;    - Rule: Each wumpus is a zumpus. (Alex is zumpus)
;    - Rule: Zumpuses are vumpuses. (Alex is vumpus)
;    - Rule: Vumpuses are rompuses. (Alex is rompus)
;    - Rule: Rompuses are amenable. (Alex is amenable)
; 3. Conclusion: The logic chain implies Alex is amenable.
; 4. Verification Strategy: Assert the knowledge base and the statement "Alex is amenable".
;    - If (check-sat) returns 'sat', the statement is consistent/True.
;    - If (check-sat) returns 'unsat', the statement contradicts/False.
;    - Expected result: sat.

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
(declare-fun numpus (Entity) Bool)
(declare-fun floral (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun nervous (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun brown (Entity) Bool)
(declare-fun dumpus (Entity) Bool)
(declare-fun amenable (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun bitter (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun small (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun hot (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun tumpus (Entity) Bool)
(declare-fun bright (Entity) Bool)
(declare-fun yumpus (Entity) Bool)

; 3. Declare Constants
(declare-const alex Entity)

; 4. Assert Knowledge Base (Rules)
; Every numpus is floral.
(assert (forall ((x Entity)) (=> (numpus x) (floral x))))
; Numpuses are jompuses.
(assert (forall ((x Entity)) (=> (numpus x) (jompus x))))
; Jompuses are not nervous.
(assert (forall ((x Entity)) (=> (jompus x) (not (nervous x)))))
; Each jompus is an impus.
(assert (forall ((x Entity)) (=> (jompus x) (impus x))))
; Every impus is brown.
(assert (forall ((x Entity)) (=> (impus x) (brown x))))
; Every dumpus is not amenable.
(assert (forall ((x Entity)) (=> (dumpus x) (not (amenable x)))))
; Each impus is a wumpus.
(assert (forall ((x Entity)) (=> (impus x) (wumpus x))))
; Wumpuses are not bitter.
(assert (forall ((x Entity)) (=> (wumpus x) (not (bitter x)))))
; Each wumpus is a zumpus.
(assert (forall ((x Entity)) (=> (wumpus x) (zumpus x))))
; Every zumpus is not small.
(assert (forall ((x Entity)) (=> (zumpus x) (not (small x)))))
; Zumpuses are vumpuses.
(assert (forall ((x Entity)) (=> (zumpus x) (vumpus x))))
; Vumpuses are hot.
(assert (forall ((x Entity)) (=> (vumpus x) (hot x))))
; Vumpuses are rompuses.
(assert (forall ((x Entity)) (=> (vumpus x) (rompus x))))
; Rompuses are amenable.
(assert (forall ((x Entity)) (=> (rompus x) (amenable x))))
; Every rompus is a tumpus.
(assert (forall ((x Entity)) (=> (rompus x) (tumpus x))))
; Every tumpus is bright.
(assert (forall ((x Entity)) (=> (tumpus x) (bright x))))
; Every tumpus is a yumpus.
(assert (forall ((x Entity)) (=> (tumpus x) (yumpus x))))

; 5. Assert Facts
; Alex is an impus.
(assert (impus alex))

; 6. Verification Test
; Question: Is Alex amenable?
; Assert the statement to test its consistency with the KB.
(assert (amenable alex))

; 7. Check Satisfiability
(check-sat)
(get-model)