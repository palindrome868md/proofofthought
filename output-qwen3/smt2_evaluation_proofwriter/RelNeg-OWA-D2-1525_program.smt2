; Step-by-Step Reasoning:
; 1. Analyze Premises:
;    - Fact: The squirrel is cold.
;    - Rule: If the squirrel is cold, then the squirrel chases the bear.
;    - Inference: The squirrel chases the bear.
;    - Rule: If something chases the bear, then the bear eats the squirrel.
;    - Inference: The bear eats the squirrel.
;
; 2. Analyze Question:
;    - Statement: "The bear does not eat the squirrel."
;    - This contradicts the derived inference (The bear eats the squirrel).
;    - Expected SMT Result: unsat (The statement is False).
;
; 3. SMT-LIB Encoding:
;    - Define Sort 'Animal'.
;    - Define Constants for bear, dog, lion, squirrel.
;    - Define Predicates for properties and relations.
;    - Assert all facts and rules.
;    - Assert the question statement as a constraint.
;    - Check satisfiability.

; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants
(declare-const bear Animal)
(declare-const dog Animal)
(declare-const lion Animal)
(declare-const squirrel Animal)

; 3. Declare Functions (Predicates)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-blue (Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (is-cold bear))
(assert (not (chases dog lion)))
(assert (not (is-blue lion)))
(assert (likes lion squirrel))
(assert (eats squirrel lion))
(assert (is-cold squirrel))
(assert (not (likes squirrel bear)))

; 5. Assert Knowledge Base (Rules)
; Rule: If the squirrel is cold then the squirrel chases the bear.
(assert (=> (is-cold squirrel) (chases squirrel bear)))

; Rule: If something chases the bear then the bear eats the squirrel.
(assert (forall ((x Animal))
  (=> (chases x bear) (eats bear squirrel))))

; 6. Verify Question
; Question: The bear does not eat the squirrel.
; We assert this statement to test if it is consistent with the Knowledge Base.
(assert (not (eats bear squirrel)))

; 7. Check Satisfiability
(check-sat)
(get-model)