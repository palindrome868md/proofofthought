; Declare sorts
(declare-sort Animal 0)

; Declare predicates
(declare-fun Bird (Animal) Bool)
(declare-fun Ectothermic (Animal) Bool)
(declare-fun Endothermic (Animal) Bool)
(declare-fun Penguin (Animal) Bool)
(declare-fun ProducesHeat (Animal) Bool)
(declare-fun Cat (Animal) Bool)

; Declare individuals
(declare-const Ron Animal)
(declare-const Henry Animal)

; 1) No birds are ectothermic.
(assert (forall ((a Animal)) (=> (Bird a) (not (Ectothermic a)))))

; 2) All penguins are birds.
(assert (forall ((a Animal)) (=> (Penguin a) (Bird a))))

; 3) An animal is ectothermic or endothermic.
(assert (forall ((a Animal)) (=> (true) (or (Ectothermic a) (Endothermic a)))))

; 4) All endothermic animals produce heat within the body.
(assert (forall ((a Animal)) (=> (Endothermic a) (ProducesHeat a))))

; Facts about Ron and Henry
(assert (not (Bird Ron)))
(assert (not (ProducesHeat Ron)))
(assert (not (Cat Henry)))
(assert (not (ProducesHeat Henry)))

; Question: "Either Henry is a penguin or Henry is endothermic."
(assert (or (Penguin Henry) (Endothermic Henry)))

; Check satisfiability to answer the question
(check-sat)
(get-model)