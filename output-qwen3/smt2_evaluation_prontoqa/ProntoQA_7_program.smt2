; ==============================================================================
; REASONING STEPS:
; ==============================================================================
; 1. Analyze the premises to determine the properties of 'Stella'.
;    - Fact: Stella is a wumpus.
;    - Rule: Wumpuses are numpuses. (wumpus -> numpus)
;    - Rule: Numpuses are tumpuses. (numpus -> tumpus)
;    - Rule: Tumpuses are yumpuses. (tumpus -> yumpus)
;    - Rule: Yumpuses are dumpuses. (yumpus -> dumpus)
;    - Rule: Each dumpus is not happy. (dumpus -> not happy)
;
; 2. Chain the logic:
;    Stella is wumpus 
;    -> Stella is numpus 
;    -> Stella is tumpus 
;    -> Stella is yumpus 
;    -> Stella is dumpus 
;    -> Stella is NOT happy.
;
; 3. Evaluate the question: "Is the following statement true or false? Stella is happy."
;    - Based on the deduction, "Stella is happy" contradicts the knowledge base.
;    - Therefore, the statement is False.
;
; 4. SMT Verification Strategy:
;    - Assert the Knowledge Base (rules).
;    - Assert the Fact (Stella is a wumpus).
;    - Assert the Test Statement (Stella is happy).
;    - Run (check-sat).
;    - Expected Result: 'unsat' (indicating the statement contradicts the KB, so it is False).
; ==============================================================================

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates for Categories and Properties)
; Categories
(declare-fun is_rompus (Entity) Bool)
(declare-fun is_impus (Entity) Bool)
(declare-fun is_vumpus (Entity) Bool)
(declare-fun is_wumpus (Entity) Bool)
(declare-fun is_numpus (Entity) Bool)
(declare-fun is_tumpus (Entity) Bool)
(declare-fun is_yumpus (Entity) Bool)
(declare-fun is_dumpus (Entity) Bool)
(declare-fun is_zumpus (Entity) Bool)
(declare-fun is_jompus (Entity) Bool)

; Properties
(declare-fun is_orange (Entity) Bool)
(declare-fun is_happy (Entity) Bool)
(declare-fun is_spicy (Entity) Bool)
(declare-fun is_transparent (Entity) Bool)
(declare-fun is_kind (Entity) Bool)
(declare-fun is_bright (Entity) Bool)
(declare-fun is_liquid (Entity) Bool)
(declare-fun is_earthy (Entity) Bool)

; 3. Declare Constants
(declare-const stella Entity)

; 4. Assert Knowledge Base (Rules)
; Every rompus is orange
(assert (forall ((x Entity)) (=> (is_rompus x) (is_orange x))))
; Every rompus is an impus
(assert (forall ((x Entity)) (=> (is_rompus x) (is_impus x))))
; Vumpuses are happy
(assert (forall ((x Entity)) (=> (is_vumpus x) (is_happy x))))
; Every impus is spicy
(assert (forall ((x Entity)) (=> (is_impus x) (is_spicy x))))
; Every impus is a wumpus
(assert (forall ((x Entity)) (=> (is_impus x) (is_wumpus x))))
; Wumpuses are transparent
(assert (forall ((x Entity)) (=> (is_wumpus x) (is_transparent x))))
; Wumpuses are numpuses
(assert (forall ((x Entity)) (=> (is_wumpus x) (is_numpus x))))
; Every numpus is not kind
(assert (forall ((x Entity)) (=> (is_numpus x) (not (is_kind x)))))
; Numpuses are tumpuses
(assert (forall ((x Entity)) (=> (is_numpus x) (is_tumpus x))))
; Each tumpus is not bright
(assert (forall ((x Entity)) (=> (is_tumpus x) (not (is_bright x)))))
; Tumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is_tumpus x) (is_yumpus x))))
; Every yumpus is not liquid
(assert (forall ((x Entity)) (=> (is_yumpus x) (not (is_liquid x)))))
; Yumpuses are dumpuses
(assert (forall ((x Entity)) (=> (is_yumpus x) (is_dumpus x))))
; Each dumpus is not happy
(assert (forall ((x Entity)) (=> (is_dumpus x) (not (is_happy x)))))
; Dumpuses are zumpuses
(assert (forall ((x Entity)) (=> (is_dumpus x) (is_zumpus x))))
; Every zumpus is earthy
(assert (forall ((x Entity)) (=> (is_zumpus x) (is_earthy x))))
; Each zumpus is a jompus
(assert (forall ((x Entity)) (=> (is_zumpus x) (is_jompus x))))

; 5. Assert Facts about Stella
; Stella is a wumpus
(assert (is_wumpus stella))

; 6. Verification: Test the statement "Stella is happy"
; We assert the statement to check for consistency.
; If 'unsat', the statement is False (contradicts KB).
; If 'sat', the statement is True (consistent with KB).
(assert (is_happy stella))

; 7. Check Satisfiability
(check-sat)

; 8. Get Model (will be empty or partial if unsat)
(get-model)