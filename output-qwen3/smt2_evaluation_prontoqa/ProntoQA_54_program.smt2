; Reasoning Steps:
; 1. Stella is a vumpus (Given).
; 2. Vumpuses are impuses (Rule 6). So, Stella is an impus.
; 3. Impuses are zumpuses (Rule 9). So, Stella is a zumpus.
; 4. Each zumpus is a rompus (Rule 11). So, Stella is a rompus.
; 5. Rompuses are wumpuses (Rule 13). So, Stella is a wumpus.
; 6. Every wumpus is not red (Rule 14). So, Stella is not red.
;
; Question: Is the statement "Stella is not red" true or false?
; Based on the deduction, the statement is TRUE.
; Verification: Assert (not (red Stella)) and check for satisfiability.
; Expected Result: sat (True).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun tumpus (Entity) Bool)
(declare-fun transparent (Entity) Bool)
(declare-fun jompus (Entity) Bool)
(declare-fun large (Entity) Bool)
(declare-fun vumpus (Entity) Bool)
(declare-fun angry (Entity) Bool)
(declare-fun impus (Entity) Bool)
(declare-fun yumpus (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun happy (Entity) Bool)
(declare-fun zumpus (Entity) Bool)
(declare-fun metallic (Entity) Bool)
(declare-fun rompus (Entity) Bool)
(declare-fun dull (Entity) Bool)
(declare-fun wumpus (Entity) Bool)
(declare-fun numpus (Entity) Bool)
(declare-fun sweet (Entity) Bool)
(declare-fun dumpus (Entity) Bool)

; 3. Declare constants
(declare-const Stella Entity)

; 4. Assert knowledge base (facts and rules)
; Every tumpus is not transparent.
(assert (forall ((x Entity)) (=> (tumpus x) (not (transparent x)))))
; Tumpuses are jompuses.
(assert (forall ((x Entity)) (=> (tumpus x) (jompus x))))
; Each jompus is not large.
(assert (forall ((x Entity)) (=> (jompus x) (not (large x)))))
; Jompuses are vumpuses.
(assert (forall ((x Entity)) (=> (jompus x) (vumpus x))))
; Vumpuses are angry.
(assert (forall ((x Entity)) (=> (vumpus x) (angry x))))
; Vumpuses are impuses.
(assert (forall ((x Entity)) (=> (vumpus x) (impus x))))
; Yumpuses are red.
(assert (forall ((x Entity)) (=> (yumpus x) (red x))))
; Impuses are happy.
(assert (forall ((x Entity)) (=> (impus x) (happy x))))
; Impuses are zumpuses.
(assert (forall ((x Entity)) (=> (impus x) (zumpus x))))
; Zumpuses are metallic.
(assert (forall ((x Entity)) (=> (zumpus x) (metallic x))))
; Each zumpus is a rompus.
(assert (forall ((x Entity)) (=> (zumpus x) (rompus x))))
; Rompuses are dull.
(assert (forall ((x Entity)) (=> (rompus x) (dull x))))
; Rompuses are wumpuses.
(assert (forall ((x Entity)) (=> (rompus x) (wumpus x))))
; Every wumpus is not red.
(assert (forall ((x Entity)) (=> (wumpus x) (not (red x)))))
; Each wumpus is a numpus.
(assert (forall ((x Entity)) (=> (wumpus x) (numpus x))))
; Numpuses are not sweet.
(assert (forall ((x Entity)) (=> (numpus x) (not (sweet x)))))
; Numpuses are dumpuses.
(assert (forall ((x Entity)) (=> (numpus x) (dumpus x))))
; Stella is a vumpus.
(assert (vumpus Stella))

; 5. Test the statement: "Stella is not red"
(assert (not (red Stella)))

; 6. Check satisfiability
(check-sat)
(get-model)