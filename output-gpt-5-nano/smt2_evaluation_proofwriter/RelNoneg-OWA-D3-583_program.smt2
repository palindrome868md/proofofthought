; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun red (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)

; Constants
(declare-const bald-eagle Entity)
(declare-const cow Entity)
(declare-const rabbit Entity)
(declare-const tiger Entity)

; Knowledge base: facts
(assert red bald-eagle)
(assert green cow)
(assert likes cow bald-eagle)
(assert likes cow rabbit)
(assert visits cow bald-eagle)
(assert visits cow rabbit)
(assert likes rabbit cow)
(assert sees rabbit tiger)
(assert visits rabbit tiger)
(assert red tiger)
(assert visits tiger cow)
(assert visits tiger rabbit)

; Rules
; 1) If something visits the rabbit then it is red.
(assert (forall ((x Entity))
  (=> (visits x rabbit)
      (red x))))

; 2) If something sees the bald eagle and the bald eagle visits the cow then it sees the cow.
(assert (forall ((x Entity))
  (=> (and (sees x bald-eagle) (visits bald-eagle cow))
      (sees x cow))))

; 3) If something is red then it is kind.
(assert (forall ((x Entity))
  (=> (red x)
      (kind x))))

; 4) If something is kind then it sees the bald eagle.
(assert (forall ((x Entity))
  (=> (kind x)
      (sees x bald-eagle))))

; 5) If the cow sees the tiger and the tiger sees the rabbit then the cow is green.
(assert (and (=> (and (sees cow tiger) (sees tiger rabbit)) (green cow))))

; 6) If something is red then it sees the rabbit.
(assert (forall ((x Entity))
  (=> (red x)
      (sees x rabbit))))

; 7) If the rabbit is green then the rabbit is red.
(assert (=> (green rabbit) (red rabbit)))

; 8) If something likes the cow and it likes the bald eagle then the cow sees the rabbit.
(assert (forall ((x Entity))
  (=> (and (likes x cow) (likes x bald-eagle))
      (sees cow rabbit))))

; Test scenario: The cow does not visit the bald eagle.
(assert (not (visits cow bald-eagle)))

; Check satisfiability
(check-sat)