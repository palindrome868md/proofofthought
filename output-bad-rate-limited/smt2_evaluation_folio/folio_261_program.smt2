; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun is-legislator (Person) Bool)
(declare-fun found-guilty (Person) Bool)
(declare-fun suspended (Person) Bool)

; Constants
(declare-const tiffany-alston Person)

; Knowledge base
(assert (is-legislator tiffany-alston))
(assert (found-guilty tiffany-alston))

; Rule: If a legislator is found guilty, they are suspended
(assert (forall ((p Person))
  (=> (and (is-legislator p) (found-guilty p))
      (suspended p))))

; Test: Was Tiffany suspended?
(assert (suspended tiffany-alston))

(check-sat)
(get-model)