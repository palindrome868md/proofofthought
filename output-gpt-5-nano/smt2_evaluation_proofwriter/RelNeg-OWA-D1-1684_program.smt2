; Declare sorts
(declare-sort Animal 0)

; Declare predicates
(declare-fun eats (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun red (Animal) Bool)
(declare-fun round (Animal) Bool)
(declare-fun kind (Animal) Bool)
(declare-fun visit (Animal Animal) Bool)

; Declare constants (the entities)
(declare-const cow Animal)
(declare-const dog Animal)
(declare-const rabbit Animal)
(declare-const mouse Animal)

; Knowledge base (facts)
(assert (chases cow rabbit))
(assert (eats cow dog))
(assert (red cow))
(assert (round cow))
(assert (chases dog cow))
(assert (chases dog rabbit))
(assert (eats dog mouse))
(assert (kind dog))
(assert (eats mouse cow))
(assert (not (chases rabbit cow)))
(assert (eats rabbit cow))
(assert (kind rabbit))

; Rules
; If someone chases the cow then the cow eats the mouse.
(assert (forall ((p Animal)) (=> (chases p cow) (eats cow mouse))))
; If the dog does not visit the cow then the dog is not round.
(assert (=> (not (visit dog cow)) (not (round dog))))
; If someone chases the cow then they chase the rabbit.
(assert (forall ((p Animal)) (=> (chases p cow) (chases p rabbit))))

; Test scenario: The cow eats the dog.
(assert (eats cow dog))

; Check satisfiability
(check-sat)
(get-model)