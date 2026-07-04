; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions
(declare-fun chases (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun is-kind (Animal) Bool)
(declare-fun is-red (Animal) Bool)
(declare-fun is-rough (Animal) Bool)

; 3. Declare constants
(declare-const cat Animal)
(declare-const mouse Animal)
(declare-const rabbit Animal)

; 4. Assert knowledge base (facts)
; Cat facts
(assert (chases cat rabbit))
(assert (is-kind cat))
(assert (is-red cat))
(assert (is-rough cat))
(assert (visits cat mouse))

; Mouse facts
(assert (chases mouse cat))
(assert (chases mouse rabbit))
(assert (eats mouse rabbit))
(assert (is-red mouse))
(assert (is-rough mouse))
(assert (visits mouse cat))
(assert (visits mouse rabbit))

; Rabbit facts
(assert (chases rabbit mouse))
(assert (eats rabbit cat))
(assert (eats rabbit mouse))
(assert (is-red rabbit))

; Rules
; Rule 1: If something visits the rabbit and it visits the cat then the rabbit chases the cat.
(assert (forall ((x Animal))
  (=> (and (visits x rabbit) (visits x cat))
      (chases rabbit cat))))

; Rule 2: If something chases the cat then it visits the mouse.
(assert (forall ((x Animal))
  (=> (chases x cat)
      (visits x mouse))))

; 5. Verification: The rabbit chases the cat.
; We assert the statement in question to check if it is consistent with the knowledge base.
; Based on Rule 1 and the facts that Mouse visits Rabbit and Mouse visits Cat, 
; this statement should be satisfiable (True).
(assert (chases rabbit cat))

(check-sat)
(get-model)