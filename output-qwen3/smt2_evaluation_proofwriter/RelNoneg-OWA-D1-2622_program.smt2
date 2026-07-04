; Reasoning Steps:
; 1. Define Sort: Animal (for cat, dog, rabbit, lion)
; 2. Define Functions: predicates for properties and relations (eats, chases, sees, etc.)
; 3. Define Constants: cat, dog, rabbit, lion
; 4. Assert Knowledge Base (Facts):
;    - Explicitly assert "The rabbit eats the cat" as given in the text.
;    - Assert all other provided facts (nice, round, sees, chases, etc.).
; 5. Assert Knowledge Base (Rules):
;    - Translate conditional statements into forall implications.
; 6. Verification Strategy:
;    - Question: "The rabbit does not eat the cat."
;    - To test this, we assert (not (eats rabbit cat)).
;    - Since the KB contains (eats rabbit cat), this creates a direct contradiction.
;    - Expected Result: unsat (The statement is False).

; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants
(declare-const cat Animal)
(declare-const dog Animal)
(declare-const rabbit Animal)
(declare-const lion Animal)

; 3. Declare Functions
(declare-fun is-nice (Animal) Bool)
(declare-fun is-round (Animal) Bool)
(declare-fun is-kind (Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (is-nice cat))
(assert (sees cat dog))
(assert (chases dog rabbit))
(assert (eats dog rabbit))
(assert (is-round dog))
(assert (sees dog lion))
(assert (sees dog rabbit))
(assert (chases lion cat))
(assert (chases lion dog))
(assert (eats lion cat))
(assert (eats lion rabbit))
(assert (chases rabbit cat))
(assert (eats rabbit cat))
(assert (eats rabbit dog))
(assert (sees rabbit cat))

; 5. Assert Knowledge Base (Rules)
; Rule: If something eats the lion then the lion chases the rabbit.
(assert (forall ((x Animal))
  (=> (eats x lion) (chases lion rabbit))))

; Rule: If something chases the dog and it eats the cat then it eats the dog.
(assert (forall ((x Animal))
  (=> (and (chases x dog) (eats x cat)) (eats x dog))))

; Rule: If something is kind then it is round.
(assert (forall ((x Animal))
  (=> (is-kind x) (is-round x))))

; 6. Verification
; Question: The rabbit does not eat the cat.
; We assert the negation of the fact to test consistency.
(assert (not (eats rabbit cat)))

; 7. Check Satisfiability
(check-sat)
(get-model)