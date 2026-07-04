; Reasoning Steps:
; 1. Define Sort 'Animal' to represent all entities (bald-eagle, cow, rabbit, tiger).
; 2. Define Unary Predicates for properties: is-red, is-green, is-kind.
; 3. Define Binary Predicates for relations: likes, visits, sees.
; 4. Declare Constants for each specific entity.
; 5. Assert Facts (1-12) directly from the problem description.
; 6. Assert Rules (13-20) as implications or universal quantifications.
; 7. The Question is "The cow does not visit the bald eagle."
; 8. To verify this statement, we assert it: (not (visits cow bald-eagle)).
; 9. Note that Fact 5 states "(visits cow bald-eagle)".
; 10. Asserting the negation of a known fact creates a contradiction.
; 11. Expected Result: unsat (indicating the statement is False).

(declare-sort Animal 0)

; Declare Constants
(declare-const bald-eagle Animal)
(declare-const cow Animal)
(declare-const rabbit Animal)
(declare-const tiger Animal)

; Declare Functions (Predicates)
(declare-fun is-red (Animal) Bool)
(declare-fun is-green (Animal) Bool)
(declare-fun is-kind (Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)

; --- Knowledge Base: Facts ---
; 1. The bald eagle is red.
(assert (is-red bald-eagle))
; 2. The cow is green.
(assert (is-green cow))
; 3. The cow likes the bald eagle.
(assert (likes cow bald-eagle))
; 4. The cow likes the rabbit.
(assert (likes cow rabbit))
; 5. The cow visits the bald eagle.
(assert (visits cow bald-eagle))
; 6. The cow visits the rabbit.
(assert (visits cow rabbit))
; 7. The rabbit likes the cow.
(assert (likes rabbit cow))
; 8. The rabbit sees the tiger.
(assert (sees rabbit tiger))
; 9. The rabbit visits the tiger.
(assert (visits rabbit tiger))
; 10. The tiger is red.
(assert (is-red tiger))
; 11. The tiger visits the cow.
(assert (visits tiger cow))
; 12. The tiger visits the rabbit.
(assert (visits tiger rabbit))

; --- Knowledge Base: Rules ---
; 13. If something visits the rabbit then it is red.
(assert (forall ((x Animal)) (=> (visits x rabbit) (is-red x))))
; 14. If something sees the bald eagle and the bald eagle visits the cow then it sees the cow.
(assert (forall ((x Animal)) (=> (and (sees x bald-eagle) (visits bald-eagle cow)) (sees x cow))))
; 15. If something is red then it is kind.
(assert (forall ((x Animal)) (=> (is-red x) (is-kind x))))
; 16. If the cow sees the tiger and the tiger sees the rabbit then the cow is green.
(assert (=> (and (sees cow tiger) (sees tiger rabbit)) (is-green cow)))
; 17. If something is kind then it sees the bald eagle.
(assert (forall ((x Animal)) (=> (is-kind x) (sees x bald-eagle))))
; 18. If the rabbit is green then the rabbit is red.
(assert (=> (is-green rabbit) (is-red rabbit)))
; 19. If something is red then it sees the rabbit.
(assert (forall ((x Animal)) (=> (is-red x) (sees x rabbit))))
; 20. If something likes the cow and it likes the bald eagle then the cow sees the rabbit.
(assert (forall ((x Animal)) (=> (and (likes x cow) (likes x bald-eagle)) (sees cow rabbit))))

; --- Verification ---
; Question: The cow does not visit the bald eagle.
; We assert the statement to check consistency with the Knowledge Base.
(assert (not (visits cow bald-eagle)))

; Check Satisfiability
(check-sat)
(get-model)