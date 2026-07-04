; -----------------------------------------------------------------------------
; Reasoning Steps:
; 1. Decomposition:
;    - Subject: Food made with black salt.
;    - Property: Smell of sulfur.
;    - Question: Would the food smell of sulfur? (Expected Answer: Yes)
;
; 2. Knowledge Base Formulation:
;    - Sorts: Food, Ingredient, Smell.
;    - Constants: test_food, black_salt, sulfur.
;    - Relations: has_ingredient (Food, Ingredient), smells_like (Food, Smell).
;    - Rule: If a food has black salt as an ingredient, it smells like sulfur.
;    - Fact: The test food is made with black salt.
;
; 3. Verification Strategy:
;    - Assert the Knowledge Base (Rule + Fact).
;    - Assert the Scenario being tested (The food smells like sulfur).
;    - Check Satisfiability.
;    - Since the answer is "Yes", the scenario should be consistent with the KB.
;    - Expected Result: sat.
; -----------------------------------------------------------------------------

; 1. Declare Sorts
(declare-sort Food 0)
(declare-sort Ingredient 0)
(declare-sort Smell 0)

; 2. Declare Functions
(declare-fun has_ingredient (Food Ingredient) Bool)
(declare-fun smells_like (Food Smell) Bool)

; 3. Declare Constants
(declare-const test_food Food)
(declare-const black_salt Ingredient)
(declare-const sulfur Smell)

; 4. Assert Knowledge Base (Facts and Rules)

; Rule: Any food containing black salt smells of sulfur
(assert (forall ((f Food))
  (=> (has_ingredient f black_salt)
      (smells_like f sulfur))))

; Fact: The specific food in question is made with black salt
(assert (has_ingredient test_food black_salt))

; 5. Assert Test Scenario
; Question: Would food made with black salt smell of sulfur?
; We assert that it DOES smell of sulfur to check consistency/entailment.
(assert (smells_like test_food sulfur))

; 6. Check Satisfiability
; Expected: sat (True) - The claim is consistent with the knowledge base.
(check-sat)
(get-model)