; Declare sorts
(declare-sort Fruit 0)

; Declare predicates
(declare-fun red (Fruit) Bool)
(declare-fun grows-ben-yard (Fruit) Bool)
(declare-fun contains-vitamin-c (Fruit) Bool)
(declare-fun healthy (Fruit) Bool)
(declare-fun on-warning-list (Fruit) Bool)
(declare-fun apple (Fruit) Bool)

; Declare constants
(declare-const cherries Fruit)

; Premises (Knowledge Base)

; 1) All red fruits that grow in Ben's yard contain Vitamin C
(assert (forall ((x Fruit))
  (=> (and (red x) (grows-ben-yard x))
      (contains-vitamin-c x))))

; 2) All apples that grow in Ben's yard are red fruits
(assert (forall ((x Fruit))
  (=> (and (apple x) (grows-ben-yard x))
      (red x))))

; 3) All fruits that grow in Ben's yard and contain Vitamin C are healthy
(assert (forall ((x Fruit))
  (=> (and (grows-ben-yard x) (contains-vitamin-c x))
      (healthy x))))

; 4) No fruits that grow in Ben's yard and are healthy are on a warning list
(assert (forall ((x Fruit))
  (=> (and (grows-ben-yard x) (healthy x))
      (not (on-warning-list x)))))

; 5) The cherries grow in Ben's yard
(assert (grows-ben-yard cherries))

; 6) If cherries are not apples and are not healthy, then they are red
(assert (=> (and (not (apple cherries)) (not (healthy cherries)))
            (red cherries)))

; Test scenario: The cherries either contain Vitamin C or are on a warning list
(assert (or (contains-vitamin-c cherries) (on-warning-list cherries)))

; Check satisfiability (one and only one check-sat)
(check-sat)
(get-model)