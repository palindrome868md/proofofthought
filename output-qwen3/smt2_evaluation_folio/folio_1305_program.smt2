; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (predicates)
(declare-fun is-bird (Animal) Bool)
(declare-fun is-penguin (Animal) Bool)
(declare-fun is-cat (Animal) Bool)
(declare-fun is-ectothermic (Animal) Bool)
(declare-fun is-endothermic (Animal) Bool)
(declare-fun produces-heat (Animal) Bool)

; 3. Declare constants
(declare-const ron Animal)
(declare-const henry Animal)

; 4. Assert knowledge base (premises)

; No birds are ectothermic.
(assert (forall ((x Animal))
  (=> (is-bird x) (not (is-ectothermic x)))))

; All penguins are birds.
(assert (forall ((x Animal))
  (=> (is-penguin x) (is-bird x))))

; An animal is ectothermic or endothermic.
(assert (forall ((x Animal))
  (or (is-ectothermic x) (is-endothermic x))))

; All endothermic animals produce heat within the body.
(assert (forall ((x Animal))
  (=> (is-endothermic x) (produces-heat x))))

; Ron and Henry are both animals. (Implicit by sort declaration)

; Ron is not a bird and does not produce heat with the body.
(assert (not (is-bird ron)))
(assert (not (produces-heat ron)))

; Henry is not a cat and does not produce heat with the body.
(assert (not (is-cat henry)))
(assert (not (produces-heat henry)))

; 5. Assert the statement to verify
; Statement: Either Henry is a penguin or Henry is endothermic.
(assert (or (is-penguin henry) (is-endothermic henry)))

; 6. Check satisfiability
; If unsat: The statement contradicts the premises (False).
; If sat: The statement is consistent with the premises (True).
(check-sat)
(get-model)