; SMT-LIB 2.0 Program for Theorem Proving
; Problem: Animal Reasoning Task
; Question: The cat visits the squirrel.

; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (predicates)
(declare-fun eats (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun is_red (Animal) Bool)
(declare-fun is_green (Animal) Bool)
(declare-fun is_nice (Animal) Bool)

; 3. Declare constants
(declare-const bear Animal)
(declare-const cat Animal)
(declare-const rabbit Animal)
(declare-const squirrel Animal)

; 4. Assert knowledge base (facts)
(assert (eats bear cat))
(assert (sees bear cat))
(assert (eats cat bear))
(assert (is_red cat))
(assert (sees cat rabbit))
(assert (eats rabbit squirrel))
(assert (sees rabbit squirrel))
(assert (eats squirrel bear))
(assert (eats squirrel cat))
(assert (visits squirrel rabbit))

; 5. Assert knowledge base (rules)
; Rule 1: If something sees the cat then the cat visits the squirrel.
(assert (forall ((x Animal)) (=> (sees x cat) (visits cat squirrel))))

; Rule 2: If something eats the squirrel and the squirrel is green then the squirrel does not visit the cat.
(assert (forall ((x Animal)) (=> (and (eats x squirrel) (is_green squirrel)) (not (visits squirrel cat)))))

; Rule 3: If something is nice and it eats the squirrel then the squirrel visits the cat.
(assert (forall ((x Animal)) (=> (and (is_nice x) (eats x squirrel)) (visits squirrel cat))))

; Rule 4: If something is red and it visits the squirrel then it eats the cat.
(assert (forall ((x Animal)) (=> (and (is_red x) (visits x squirrel)) (eats x cat))))

; Rule 5: If the rabbit is not green and the rabbit does not see the bear then the rabbit visits the squirrel.
(assert (=> (and (not (is_green rabbit)) (not (sees rabbit bear))) (visits rabbit squirrel)))

; Rule 6: If something visits the bear then the bear eats the rabbit.
(assert (forall ((x Animal)) (=> (visits x bear) (eats bear rabbit))))

; Rule 7: If the squirrel does not eat the rabbit then the rabbit visits the cat.
(assert (=> (not (eats squirrel rabbit)) (visits rabbit cat)))

; Rule 8: If something visits the cat and it sees the squirrel then the cat does not eat the bear.
(assert (forall ((x Animal)) (=> (and (visits x cat) (sees x squirrel)) (not (eats cat bear)))))

; 6. Verification: The cat visits the squirrel.
; We assert the statement to check if it is consistent (sat) or contradictory (unsat) with the KB.
(assert (visits cat squirrel))

; 7. Check satisfiability
(check-sat)
(get-model)