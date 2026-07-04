; Reasoning Steps:
; 1. Analyze the Knowledge Base to trace properties of "Wren".
; 2. Fact: Wren is a dumpus.
; 3. Rule: Dumpuses are rompuses. -> Wren is a rompus.
; 4. Rule: Each rompus is a numpus. -> Wren is a numpus.
; 5. Rule: Numpuses are wumpuses. -> Wren is a wumpus.
; 6. Rule: Every wumpus is a yumpus. -> Wren is a yumpus.
; 7. Rule: Every yumpus is not transparent. -> Wren is not transparent.
; 8. Conclusion: The statement "Wren is not transparent" is True.
; 9. Verification Strategy: Assert the statement (not (is_transparent Wren)) and check for satisfiability.
;    - If sat: The statement is consistent/True.
;    - If unsat: The statement contradicts the KB/False.

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is_zumpus (Thing) Bool)
(declare-fun is_nervous (Thing) Bool)
(declare-fun is_dumpus (Thing) Bool)
(declare-fun is_large (Thing) Bool)
(declare-fun is_rompus (Thing) Bool)
(declare-fun is_brown (Thing) Bool)
(declare-fun is_vumpus (Thing) Bool)
(declare-fun is_transparent (Thing) Bool)
(declare-fun is_numpus (Thing) Bool)
(declare-fun is_bitter (Thing) Bool)
(declare-fun is_wumpus (Thing) Bool)
(declare-fun is_floral (Thing) Bool)
(declare-fun is_yumpus (Thing) Bool)
(declare-fun is_tumpus (Thing) Bool)
(declare-fun is_bright (Thing) Bool)
(declare-fun is_impus (Thing) Bool)

; 3. Declare constants
(declare-const Wren Thing)

; 4. Assert knowledge base (facts and rules)
; Every zumpus is nervous.
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_nervous x))))
; Every zumpus is a dumpus.
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_dumpus x))))
; Every dumpus is large.
(assert (forall ((x Thing)) (=> (is_dumpus x) (is_large x))))
; Dumpuses are rompuses.
(assert (forall ((x Thing)) (=> (is_dumpus x) (is_rompus x))))
; Every rompus is brown.
(assert (forall ((x Thing)) (=> (is_rompus x) (is_brown x))))
; Vumpuses are transparent.
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_transparent x))))
; Each rompus is a numpus.
(assert (forall ((x Thing)) (=> (is_rompus x) (is_numpus x))))
; Numpuses are not bitter.
(assert (forall ((x Thing)) (=> (is_numpus x) (not (is_bitter x)))))
; Numpuses are wumpuses.
(assert (forall ((x Thing)) (=> (is_numpus x) (is_wumpus x))))
; Each wumpus is floral.
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_floral x))))
; Every wumpus is a yumpus.
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_yumpus x))))
; Every yumpus is not transparent.
(assert (forall ((x Thing)) (=> (is_yumpus x) (not (is_transparent x)))))
; Yumpuses are tumpuses.
(assert (forall ((x Thing)) (=> (is_yumpus x) (is_tumpus x))))
; Tumpuses are not bright.
(assert (forall ((x Thing)) (=> (is_tumpus x) (not (is_bright x)))))
; Every tumpus is an impus.
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_impus x))))

; Fact: Wren is a dumpus.
(assert (is_dumpus Wren))

; 5. Verification
; Question: Is the following statement true or false? Wren is not transparent.
; Test: Assert the statement "Wren is not transparent"
(assert (not (is_transparent Wren)))

; Check satisfiability
; Expected: sat (True)
(check-sat)
(get-model)