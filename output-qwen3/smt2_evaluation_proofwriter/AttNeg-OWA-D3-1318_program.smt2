; ==============================================================================
; SMT-LIB 2.0 Program for Reasoning Task
; ==============================================================================
; Reasoning Steps:
; 1. Define Sorts: Create a sort 'Thing' to represent all objects (Bob, Harry, etc.).
; 2. Define Predicates: Declare functions for properties (cold, quiet, big, round, etc.).
; 3. Define Constants: Declare specific individuals (bob, charlie, erin, harry).
; 4. Assert Knowledge Base (Facts):
;    - Bob is cold.
;    - Charlie is quiet.
;    - Erin is quiet.
;    - Harry is big.
; 5. Assert Knowledge Base (Rules):
;    - All big, round things are green.
;    - Cold, red things are green.
;    - White, cold things are big.
;    - Cold things are big.
;    - If something is big then it is red.
;    - If something is red and not white then it is not round.
; 6. Verification:
;    - Question: "Harry is not big."
;    - Strategy: Assert the hypothesis (not (big harry)) and check satisfiability.
;    - Expectation: Since (big harry) is a fact, this should be 'unsat' (False).
; ==============================================================================

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
(declare-fun cold (Thing) Bool)
(declare-fun quiet (Thing) Bool)
(declare-fun big (Thing) Bool)
(declare-fun round (Thing) Bool)
(declare-fun green (Thing) Bool)
(declare-fun white (Thing) Bool)
(declare-fun red (Thing) Bool)

; 3. Declare Constants
(declare-const bob Thing)
(declare-const charlie Thing)
(declare-const erin Thing)
(declare-const harry Thing)

; 4. Assert Facts
(assert (cold bob))
(assert (quiet charlie))
(assert (quiet erin))
(assert (big harry))

; 5. Assert Rules
; All big, round things are green.
(assert (forall ((x Thing)) (=> (and (big x) (round x)) (green x))))

; Cold, red things are green.
(assert (forall ((x Thing)) (=> (and (cold x) (red x)) (green x))))

; White, cold things are big.
(assert (forall ((x Thing)) (=> (and (white x) (cold x)) (big x))))

; Cold things are big.
(assert (forall ((x Thing)) (=> (cold x) (big x))))

; If something is big then it is red.
(assert (forall ((x Thing)) (=> (big x) (red x))))

; If something is red and not white then it is not round.
(assert (forall ((x Thing)) (=> (and (red x) (not (white x))) (not (round x)))))

; 6. Verification
; Test the statement: "Harry is not big."
(assert (not (big harry)))

; 7. Check Satisfiability
(check-sat)
(get-model)