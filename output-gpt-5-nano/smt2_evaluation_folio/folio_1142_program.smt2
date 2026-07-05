; Sorts
(declare-sort Fruit 0)

; Predicates
(declare-fun is-red (Fruit) Bool)
(declare-fun grows-ben (Fruit) Bool)
(declare-fun has-vitamin-c (Fruit) Bool)
(declare-fun is-apple (Fruit) Bool)
(declare-fun is-healthy (Fruit) Bool)
(declare-fun on-warning (Fruit) Bool)

; Constants
(declare-const cherry Fruit)

; Premises

; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Fruit))
  (=> (and (is-red x) (grows-ben x))
      (has-vitamin-c x))))

; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Fruit))
  (=> (and (is-apple x) (grows-ben x))
      (is-red x))))

; 3. All fruits that grow in Ben's yard and contain Vitamin C are healthy.
(assert (forall ((x Fruit))
  (=> (and (grows-ben x) (has-vitamin-c x))
      (is-healthy x))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Fruit))
  (=> (and (grows-ben x) (is-healthy x))
      (not (on-warning x)))))

; 5. The cherries grow in Ben's yard.
(assert (grows-ben cherry))

; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (is-apple cherry)) (not (is-healthy cherry)))
            (is-red cherry))))

; Test: Are the cherries apples?
(assert (is-apple cherry))

; Check satisfiability and produce a model
(check-sat)
(get-model)