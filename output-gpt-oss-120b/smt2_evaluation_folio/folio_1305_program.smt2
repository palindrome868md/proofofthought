; ------------------------------------------------------------
; Sort declaration
(declare-sort Animal 0)

; ------------------------------------------------------------
; Predicate (function) declarations
(declare-fun Bird (Animal) Bool)
(declare-fun Penguin (Animal) Bool)
(declare-fun Ectothermic (Animal) Bool)
(declare-fun Endothermic (Animal) Bool)
(declare-fun ProducesHeat (Animal) Bool)
(declare-fun Cat (Animal) Bool)

; ------------------------------------------------------------
; Constant (individual) declarations
(declare-const Ron Animal)
(declare-const Henry Animal)

; ------------------------------------------------------------
; Knowledge base (premises)

; 1. No birds are ectothermic.
(assert (forall ((x Animal))
        (=> (Bird x) (not (Ectothermic x)))))

; 2. All penguins are birds.
(assert (forall ((x Animal))
        (=> (Penguin x) (Bird x))))

; 3. Every animal is ectothermic or endothermic.
(assert (forall ((x Animal))
        (or (Ectothermic x) (Endothermic x))))

; 4. All endothermic animals produce heat within the body.
(assert (forall ((x Animal))
        (=> (Endothermic x) (ProducesHeat x))))

; 5. Ron and Henry are animals (implicitly true by using the sort).

; 6. Ron is not a bird and does not produce heat.
(assert (not (Bird Ron)))
(assert (not (ProducesHeat Ron)))

; 7. Henry is not a cat and does not produce heat.
(assert (not (Cat Henry)))
(assert (not (ProducesHeat Henry)))

; ------------------------------------------------------------
; Negation of the statement to be tested:
; "Henry is a penguin OR Henry is endothermic"
; Negated: Henry is NOT a penguin AND Henry is NOT endothermic
(assert (and (not (Penguin Henry))
             (not (Endothermic Henry))))

; ------------------------------------------------------------
; Check whether the premises together with the negated statement
; are satisfiable.
(check-sat)
(get-model)