; Declares sorts
(declare-sort Animal 0)
(declare-sort Person 0)

; Declare predicates/functions
(declare-fun is-child (Person) Bool)
(declare-fun dangerous-to-children (Animal) Bool)
(declare-fun good-pet-for (Person Animal) Bool)

; Constants
(declare-const kid Person)
(declare-const northern_fur_seal Animal)

; Knowledge base
(assert (is-child kid))
(assert (dangerous-to-children northern_fur_seal))

; Rule: If a child and an animal are dangerous to children, then that animal is not a good pet for that child
(assert (forall ((p Person) (a Animal))
  (=> (and (is-child p) (dangerous-to-children a))
      (not (good-pet-for p a)))))

; Test: Would kid consider northern_fur_seal to be a good pet?
(assert (good-pet-for kid northern_fur_seal))

; Check satisfiability
(check-sat)
(get-model)