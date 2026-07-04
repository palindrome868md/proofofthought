; ==============================================================================
; Step-by-Step Reasoning:
; ==============================================================================
; 1. Analyze the Premises:
;    - Fae is a jompus.
;    - Every jompus is a zumpus.
;    - Zumpuses are numpuses.
;    - Numpuses are yumpuses.
;    - Each yumpus is a wumpus.
;    - Wumpuses are not opaque.
;
; 2. Logical Chain for Fae:
;    Fae (Jompus) 
;      -> Zumpus 
;      -> Numpus 
;      -> Yumpus 
;      -> Wumpus 
;      -> NOT Opaque.
;
; 3. Conclusion:
;    Based on the knowledge base, Fae cannot be opaque.
;    The statement "Fae is opaque" contradicts the derived facts.
;
; 4. Verification Strategy:
;    - Assert the Knowledge Base (rules and facts).
;    - Assert the statement to test: (is-opaque fae).
;    - Run (check-sat).
;    - Expected Result: unsat (meaning the statement is False).
; ==============================================================================

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-impus (Entity) Bool)

; 3. Declare Constants
(declare-const fae Entity)

; 4. Assert Knowledge Base (Facts)
; Fae is a jompus
(assert (is-jompus fae))

; 5. Assert Knowledge Base (Rules)
; Jompuses are large
(assert (forall ((x Entity)) (=> (is-jompus x) (is-large x))))

; Every jompus is a zumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-zumpus x))))

; Each zumpus is sweet
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-sweet x))))

; Zumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-numpus x))))

; Every numpus is hot
(assert (forall ((x Entity)) (=> (is-numpus x) (is-hot x))))

; Each tumpus is opaque
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-opaque x))))

; Numpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-yumpus x))))

; Every yumpus is brown
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-brown x))))

; Each yumpus is a wumpus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-wumpus x))))

; Wumpuses are not opaque
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-opaque x)))))

; Wumpuses are impuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-impus x))))

; 6. Verification
; Test Statement: Fae is opaque.
; If this leads to 'unsat', the statement is False.
(assert (is-opaque fae))

; 7. Check Satisfiability
(check-sat)

; 8. Get Model (Will be empty or partial if unsat)
(get-model)