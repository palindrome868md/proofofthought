; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Functions
(declare-fun likes (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun is-round (Animal) Bool)

; 3. Declare Constants
(declare-const bald-eagle Animal)
(declare-const mouse Animal)
(declare-const bear Animal)
(declare-const squirrel Animal)

; 4. Assert Knowledge Base (Facts)
; Fact 1: The bald eagle likes the mouse.
(assert (likes bald-eagle mouse))

; Fact 2: The bear likes the squirrel.
(assert (likes bear squirrel))

; Fact 3: The mouse is round.
(assert (is-round mouse))

; Fact 4: The squirrel eats the mouse.
(assert (eats squirrel mouse))

; Fact 5: If something eats the mouse then the mouse chases the squirrel.
(assert (forall ((x Animal))
  (=> (eats x mouse) (chases mouse squirrel))))

; 5. Verification
; Question: The bald eagle likes the mouse.
; To verify if this is True, we assert the statement and check satisfiability.
; If 'sat', the statement is consistent with the KB (True in this context).
; If 'unsat', the statement contradicts the KB (False).
(assert (likes bald-eagle mouse))

; 6. Check Satisfiability
(check-sat)
(get-model)