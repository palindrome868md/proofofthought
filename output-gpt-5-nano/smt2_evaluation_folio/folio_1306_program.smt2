; Sorts
(declare-sort Animal 0)

; Predicates
(declare-fun Bird (Animal) Bool)
(declare-fun Penguin (Animal) Bool)
(declare-fun Endothermic (Animal) Bool)
(declare-fun Ectothermic (Animal) Bool)
(declare-fun ProducesHeat (Animal) Bool)
(declare-fun Cat (Animal) Bool)

; Individuals
(declare-const ron Animal)
(declare-const henry Animal)

; Knowledge base / premises

; No birds are ectothermic
(assert (forall ((a Animal)) (=> (Bird a) (not (Ectothermic a)))))

; All penguins are birds
(assert (forall ((a Animal)) (=> (Penguin a) (Bird a))))

; An animal is ectothermic or endothermic
(assert (forall ((a Animal)) (or (Ectothermic a) (Endothermic a))))

; All endothermic animals produce heat within the body
(assert (forall ((a Animal)) (=> (Endothermic a) (ProducesHeat a))))

; Facts: Ron and Henry are animals (via sorts); specific attributes
(assert (not (Bird ron)))
(assert (not (ProducesHeat ron)))
(assert (not (Cat henry)))
(assert (not (ProducesHeat henry)))

; Question: Ron is either both a penguin and endothermic, or he is neither
(assert (or (and (Penguin ron) (Endothermic ron))
            (and (not (Penguin ron)) (not (Endothermic ron)))))

; Check satisfiability for the question
(check-sat)
(get-model)