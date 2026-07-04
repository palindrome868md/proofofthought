; 1. Declare sorts
(declare-sort Item 0)

; 2. Declare functions (Predicates)
(declare-fun is-fruit (Item) Bool)
(declare-fun in-yard (Item) Bool)
(declare-fun is-red (Item) Bool)
(declare-fun has-vit-c (Item) Bool)
(declare-fun is-apple (Item) Bool)
(declare-fun is-healthy (Item) Bool)
(declare-fun on-warning (Item) Bool)

; 3. Declare constants
(declare-const cherries Item)

; 4. Assert knowledge base (facts)

; Premise: The cherries grow in Ben's yard. (Implies they are fruits in this context)
(assert (in-yard cherries))
(assert (is-fruit cherries))

; Premise 1: All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Item))
  (=> (and (is-fruit x) (in-yard x) (is-red x))
      (has-vit-c x))))

; Premise 2: All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Item))
  (=> (and (is-apple x) (in-yard x))
      (and (is-fruit x) (is-red x)))))

; Premise 3: All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((x Item))
  (=> (and (is-fruit x) (in-yard x) (has-vit-c x))
      (is-healthy x))))

; Premise 4: No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Item))
  (=> (and (is-fruit x) (in-yard x) (is-healthy x))
      (not (on-warning x)))))

; Premise 6: If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (is-apple cherries)) (not (is-healthy cherries)))
            (and (is-red cherries) (is-fruit cherries))))

; 5. Assert the statement to verify
; Statement: The cherries either contain some amount of vitamin C or are on a warning list.
(assert (or (has-vit-c cherries) (on-warning cherries)))

; 6. Check satisfiability
(check-sat)
(get-model)