; Reasoning Steps:
; 1. Goal: Determine truth value of "Wren is liquid".
; 2. Fact: Wren is a vumpus.
; 3. Rule: Vumpuses are dumpuses. -> Wren is a dumpus.
; 4. Rule: Every dumpus is a zumpus. -> Wren is a zumpus.
; 5. Rule: Every zumpus is a rompus. -> Wren is a rompus.
; 6. Rule: Every rompus is a wumpus. -> Wren is a wumpus.
; 7. Rule: Each wumpus is liquid. -> Wren is liquid.
; 8. Conclusion: The statement is True.
; 9. Verification: Assert (is_liquid Wren). Expected: sat.

(declare-sort Thing 0)

; Declare predicates for relevant categories and properties
(declare-fun is_vumpus (Thing) Bool)
(declare-fun is_dumpus (Thing) Bool)
(declare-fun is_zumpus (Thing) Bool)
(declare-fun is_rompus (Thing) Bool)
(declare-fun is_wumpus (Thing) Bool)
(declare-fun is_liquid (Thing) Bool)

; Declare constant for the specific entity
(declare-const Wren Thing)

; Assert Knowledge Base
; Fact: Wren is a vumpus
(assert (is_vumpus Wren))

; Rule: Vumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_dumpus x))))

; Rule: Every dumpus is a zumpus
(assert (forall ((x Thing)) (=> (is_dumpus x) (is_zumpus x))))

; Rule: Every zumpus is a rompus
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_rompus x))))

; Rule: Every rompus is a wumpus
(assert (forall ((x Thing)) (=> (is_rompus x) (is_wumpus x))))

; Rule: Each wumpus is liquid
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_liquid x))))

; Verification: Test the statement "Wren is liquid"
(assert (is_liquid Wren))

; Check satisfiability
(check-sat)

; Get model to confirm values
(get-model)