; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (predicates)
(declare-fun is-reptile (Animal) Bool)
(declare-fun is-snake (Animal) Bool)
(declare-fun has-fur (Animal) Bool)

; 3. Declare constants
; We introduce a witness constant to test the existential claim "Some snake..."
(declare-const witness-snake Animal)

; 4. Assert knowledge base (premises)
; Premise 1: No reptile has fur
(assert (forall ((x Animal))
  (=> (is-reptile x) (not (has-fur x)))))

; Premise 2: All snakes are reptiles
(assert (forall ((x Animal))
  (=> (is-snake x) (is-reptile x))))

; 5. Assert the statement to be verified
; Statement: Some snake has fur
; We assert that our witness is a snake AND has fur
(assert (is-snake witness-snake))
(assert (has-fur witness-snake))

; 6. Check satisfiability
; Expected result: unsat (The statement contradicts the premises, so it is False)
(check-sat)
(get-model)