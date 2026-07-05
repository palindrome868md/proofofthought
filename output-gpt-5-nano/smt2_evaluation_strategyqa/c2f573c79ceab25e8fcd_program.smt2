; Sorts
(declare-sort Organism 0)

; Predicates
(declare-fun is-animal (Organism) Bool)
(declare-fun is-plant  (Organism) Bool)
(declare-fun has-worm  (Organism) Bool)

; Constants
(declare-const strawberry Organism)
(declare-const dog        Organism)

; Knowledge base
; 1) Dog is an animal
(assert (is-animal dog))

; 2) Strawberry is a plant
(assert (is-plant strawberry))

; 3) A plant cannot have worms
; (Concrete rule for the strawberry instance to ensure the test)
(assert (=> (is-plant strawberry) (not (has-worm strawberry))))

; 4) Dogs can have worms (example fact)
(assert (has-worm dog))

; Test: Can a strawberry get worms?
; If strawberry had worms, it would contradict the plant-worm rule above.
(assert (has-worm strawberry))

; Verification: check satisfiability
(check-sat)
(get-model)