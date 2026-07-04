; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (predicates)
(declare-fun chases (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun is-red (Animal) Bool)
(declare-fun is-round (Animal) Bool)
(declare-fun is-kind (Animal) Bool)
(declare-fun visits (Animal Animal) Bool)

; 3. Declare constants
(declare-const cow Animal)
(declare-const dog Animal)
(declare-const rabbit Animal)
(declare-const mouse Animal)

; 4. Assert knowledge base (facts from text)
(assert (chases cow rabbit))
(assert (eats cow dog))
(assert (is-red cow))
(assert (is-round cow))
(assert (chases dog cow))
(assert (chases dog rabbit))
(assert (eats dog mouse))
(assert (is-kind dog))
(assert (eats mouse cow))
(assert (not (chases rabbit cow)))
(assert (eats rabbit cow))
(assert (is-kind rabbit))

; Assert knowledge base (rules from text)
; Rule: If someone chases the cow then the cow eats the mouse.
(assert (forall ((x Animal)) (=> (chases x cow) (eats cow mouse))))

; Rule: If the dog does not visit the cow then the dog is not round.
(assert (=> (not (visits dog cow)) (not (is-round dog))))

; Rule: If someone chases the cow then they chase the rabbit.
(assert (forall ((x Animal)) (=> (chases x cow) (chases x rabbit))))

; 5. Test: The cow eats the dog.
; Since this is explicitly stated in the facts, asserting it should be satisfiable (True).
(assert (eats cow dog))

; 6. Check satisfiability
(check-sat)
(get-model)