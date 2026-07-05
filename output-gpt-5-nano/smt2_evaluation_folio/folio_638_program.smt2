; Declared sorts
(declare-sort Person 0)
(declare-sort University 0)
(declare-sort Country 0)

; Constants representing the entities
(declare-const william-dickinson Person)
(declare-const edinburgh University)
(declare-const united-kingdom Country)

; Predicates
(declare-fun attends (Person University) Bool)
(declare-fun located-in (University) Country)

; Knowledge base (premises)
(assert (attends william-dickinson edinburgh))
(assert (= (located-in edinburgh) united-kingdom))

; Query: Does William Dickinson attend a university located in the United Kingdom?
(assert (exists ((u University))
  (and (attends william-dickinson u)
       (= (located-in u) united-kingdom))))

; Check satisfiability and obtain a model
(check-sat)
(get-model)