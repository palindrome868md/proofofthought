; Sorts
(declare-sort Bear 0)

; Predicates
(declare-fun in_zoos (Bear) Bool)
(declare-fun is_wild (Bear) Bool)

; Constants
(declare-const bear-a Bear)

; Knowledge base
(assert (in_zoos bear-a))

; All bears in zoos are not wild
(assert (forall ((b Bear))
  (=> (in_zoos b) (not (is_wild b)))))

; Test: Not all bears are wild
(assert (not (forall ((b Bear)) (is_wild b))))

(check-sat)
(get-model)