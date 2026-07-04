; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (predicates)
(declare-fun is-bird (Animal) Bool)
(declare-fun is-penguin (Animal) Bool)
(declare-fun is-ectothermic (Animal) Bool)
(declare-fun is-endothermic (Animal) Bool)
(declare-fun produces-heat (Animal) Bool)
(declare-fun is-cat (Animal) Bool)

; 3. Declare constants
(declare-const ron Animal)
(declare-const henry Animal)

; 4. Assert knowledge base (premises)

; Premise 1: No birds are ectothermic.
(assert (forall ((x Animal)) (=> (is-bird x) (not (is-ectothermic x)))))

; Premise 2: All penguins are birds.
(assert (forall ((x Animal)) (=> (is-penguin x) (is-bird x))))

; Premise 3: An animal is ectothermic or endothermic.
(assert (forall ((x Animal)) (or (is-ectothermic x) (is-endothermic x))))

; Premise 4: All endothermic animals produce heat within the body.
(assert (forall ((x Animal)) (=> (is-endothermic x) (produces-heat x))))

; Premise 5: Ron and Henry are both animals.
; (Handled by declaring ron and henry as sort Animal)

; Premise 6: Ron is not a bird and does not produce heat with the body.
(assert (not (is-bird ron)))
(assert (not (produces-heat ron)))

; Premise 7: Henry is not a cat and does not produce heat with the body.
(assert (not (is-cat henry)))
(assert (not (produces-heat henry)))

; 5. Assert the statement to verify
; Statement: Ron is either both a penguin and endothermic, or he is neither.
; Logic: (is-penguin ron AND is-endothermic ron) OR (NOT is-penguin ron AND NOT is-endothermic ron)
(assert (or 
          (and (is-penguin ron) (is-endothermic ron)) 
          (and (not (is-penguin ron)) (not (is-endothermic ron)))
        ))

; 6. Check satisfiability
; sat = Statement is True (consistent with premises)
; unsat = Statement is False (contradicts premises)
(check-sat)
(get-model)