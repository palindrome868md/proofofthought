; Define the sort for Fruits
(declare-sort Fruit 0)

; Define predicates for properties of fruits
(declare-fun is-red (Fruit) Bool)
(declare-fun in-yard (Fruit) Bool)
(declare-fun has-vitc (Fruit) Bool)
(declare-fun is-healthy (Fruit) Bool)
(declare-fun on-warning (Fruit) Bool)
(declare-fun is-apple (Fruit) Bool)

; Declare the constant for cherries
(declare-const cherries Fruit)

; Premise 1: All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((f Fruit))
  (=> (and (is-red f) (in-yard f))
      (has-vitc f))))

; Premise 2: All apples that grow in Ben's yard are red fruits.
(assert (forall ((f Fruit))
  (=> (and (is-apple f) (in-yard f))
      (is-red f))))

; Premise 3: All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((f Fruit))
  (=> (and (in-yard f) (has-vitc f))
      (is-healthy f))))

; Premise 4: No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((f Fruit))
  (=> (and (in-yard f) (is-healthy f))
      (not (on-warning f)))))

; Premise 5: The cherries grow in Ben's yard.
(assert (in-yard cherries))

; Premise 6: If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (is-apple cherries)) (not (is-healthy cherries)))
            (is-red cherries)))

; Statement to Verify: The cherries are either on a warning list or are red.
; We assert the statement to check if it is consistent (sat) or contradictory (unsat).
; According to instructions: sat = True, unsat = False.
(assert (or (on-warning cherries) (is-red cherries)))

; Check satisfiability
(check-sat)
(get-model)