; Declare sorts
(declare-sort Entity 0)

; Declare constants (entities)
(declare-const bald_eagle Entity)
(declare-const cow Entity)
(declare-const tiger Entity)
(declare-const cat Entity)

; Declare predicates (binary/unary as needed)
(declare-fun sees (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun needs (Entity Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun nice (Entity) Bool)

; Knowledge base (facts)
(assert (sees bald_eagle cow))
(assert (not (sees bald_eagle tiger)))
(assert (not (visits bald_eagle tiger)))
(assert (not (rough cat)))
(assert (not (visits cow bald_eagle)))

(assert (blue tiger))
(assert (rough tiger))

(assert (needs tiger bald_eagle))
(assert (needs tiger cat))

(assert (sees tiger bald_eagle))
(assert (visits tiger cat))
(assert (visits tiger cow))

; Rules (universal implications)

; If something visits the tiger and the tiger visits the bald eagle then the tiger does not visit the cow.
(assert (forall ((x Entity))
  (=> (and (visits x tiger) (visits tiger bald_eagle))
      (not (visits tiger cow)))))

; If something needs the tiger and the tiger sees the cat then the tiger sees the bald eagle.
(assert (forall ((p Entity))
  (=> (and (needs p tiger) (sees tiger cat))
      (sees tiger bald_eagle))))

; If something is blue then it sees the tiger.
(assert (forall ((p Entity))
  (=> (blue p)
      (sees p tiger))))

; If something needs the cat then it is nice.
(assert (forall ((p Entity))
  (=> (needs p cat)
      (nice p))))

; If something is nice then it needs the cow.
(assert (forall ((p Entity))
  (=> (nice p)
      (needs p cow))))

; If something needs the bald eagle then it visits the bald eagle.
(assert (forall ((p Entity))
  (=> (needs p bald_eagle)
      (visits p bald_eagle))))

; If something needs the cow then the cow needs the cat.
(assert (forall ((p Entity))
  (=> (needs p cow)
      (needs cow cat))))

; Test: does the tiger visit the bald eagle?
(assert (visits tiger bald_eagle))

; Check satisfiability and get a model
(check-sat)
(get-model)