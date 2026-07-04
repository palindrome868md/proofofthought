; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants
(declare-const cat Animal)
(declare-const dog Animal)
(declare-const rabbit Animal)
(declare-const tiger Animal)

; 3. Declare Functions (Predicates)
(declare-fun nice (Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun young (Animal) Bool)
(declare-fun blue (Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun red (Animal) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (nice cat))
(assert (chases dog rabbit))
(assert (visits rabbit tiger))
(assert (nice tiger))

; 5. Assert Knowledge Base (Rules)
; If the rabbit is blue and the rabbit visits the tiger then the tiger is young.
(assert (=> (and (blue rabbit) (visits rabbit tiger)) (young tiger)))

; If the rabbit visits the dog and the dog visits the rabbit then the rabbit eats the cat.
(assert (=> (and (visits rabbit dog) (visits dog rabbit)) (eats rabbit cat)))

; If something eats the rabbit and it is red then the rabbit eats the cat.
(assert (forall ((x Animal)) (=> (and (eats x rabbit) (red x)) (eats rabbit cat))))

; If something eats the tiger and it eats the rabbit then it visits the tiger.
(assert (forall ((x Animal)) (=> (and (eats x tiger) (eats x rabbit)) (visits x tiger))))

; All young things are blue.
(assert (forall ((x Animal)) (=> (young x) (blue x))))

; If something chases the rabbit then the rabbit is blue.
(assert (forall ((x Animal)) (=> (chases x rabbit) (blue rabbit))))

; If something is red and it visits the cat then the cat visits the tiger.
(assert (forall ((x Animal)) (=> (and (red x) (visits x cat)) (visits cat tiger))))

; If something eats the tiger and it visits the rabbit then it chases the dog.
(assert (forall ((x Animal)) (=> (and (eats x tiger) (visits x rabbit)) (chases x dog))))

; 6. Verification: The cat is not nice.
; We assert the statement to check if it is consistent with the KB.
; Since KB asserts (nice cat), this should be unsat.
(assert (not (nice cat)))

; 7. Check Satisfiability
(check-sat)
(get-model)