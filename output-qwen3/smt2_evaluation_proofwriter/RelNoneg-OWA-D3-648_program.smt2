; Declare sorts
(declare-sort Entity 0)

; Declare predicates
(declare-fun is-round (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-young (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-person (Entity) Bool)
(declare-fun is-cow (Entity) Bool)

; Declare constant
(declare-const cow Entity)

; Knowledge base
; Fact: The cow exists and is a cow
(assert (is-cow cow))

; Fact 1: The cow is round
(assert (is-round cow))

; Fact 2: All kind people are young
(assert (forall ((x Entity))
  (=> (and (is-person x) (is-kind x))
      (is-young x))))

; Fact 3: If someone is round and red then they are young
(assert (forall ((x Entity))
  (=> (and (is-round x) (is-red x))
      (is-young x))))

; Fact 4: If someone is young then they are round
(assert (forall ((x Entity))
  (=> (is-young x)
      (is-round x))))

; Fact 5: If the cow is round and the cow is young then the cow is kind
(assert (=> (and (is-round cow) (is-young cow))
      (is-kind cow)))

; Fact 6: Round people are red
(assert (forall ((x Entity))
  (=> (and (is-person x) (is-round x))
      (is-red x))))

; Fact 7: All round, kind people are young
(assert (forall ((x Entity))
  (=> (and (is-round x) (is-kind x))
      (is-young x))))

; Test: The cow is round (verify this statement)
(assert (is-round cow))

; Check satisfiability
(check-sat)
(get-model)