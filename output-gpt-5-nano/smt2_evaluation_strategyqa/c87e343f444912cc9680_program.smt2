(declare-sort Artifact 0)

(declare-const donatello-crucifix Artifact)

(declare-fun life_size (Artifact) Bool)
(declare-fun identification_year (Artifact) Int)

; Knowledge base: facts about the Donatello crucifix
(assert (life_size donatello-crucifix))
(assert (= (identification_year donatello-crucifix) 2020))

; Test scenario: Was the Donatello crucifix identified in 2020 life size?
(assert (life_size donatello-crucifix))
(assert (= (identification_year donatello-crucifix) 2020))

(check-sat)
(get-model)