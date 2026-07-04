; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare constants
(declare-const bald-eagle Entity)
(declare-const tiger Entity)
(declare-const cow Entity)

; 3. Declare functions
(declare-fun chases (Entity Entity) Bool)
(declare-fun needs (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-young (Entity) Bool)
(declare-fun is-green (Entity) Bool)
(declare-fun is-person (Entity) Bool)

; 4. Assert knowledge base (facts)
(assert (chases bald-eagle tiger))
(assert (needs bald-eagle tiger))
(assert (sees bald-eagle cow))
(assert (sees bald-eagle tiger))
(assert (chases cow tiger))
(assert (is-kind cow))
(assert (is-red cow))
(assert (sees cow bald-eagle))
(assert (sees cow tiger))
(assert (chases tiger bald-eagle))
(assert (chases tiger cow))
(assert (is-blue tiger))
(assert (is-kind tiger))
(assert (is-red tiger))
(assert (needs tiger bald-eagle))

; 5. Assert rules
; Rule: Young, kind people are green.
(assert (forall ((x Entity))
  (=> (and (is-young x) (is-kind x) (is-person x))
      (is-green x))))

; Rule: If someone needs the tiger and the tiger needs the cow then the cow is young.
(assert (forall ((x Entity))
  (=> (and (needs x tiger) (needs tiger cow))
      (is-young cow))))

; Rule: If someone sees the tiger then the tiger needs the cow.
(assert (forall ((x Entity))
  (=> (sees x tiger)
      (needs tiger cow))))

; Rule: If someone chases the tiger and they chase the bald eagle then the bald eagle sees the tiger.
(assert (forall ((x Entity))
  (=> (and (chases x tiger) (chases x bald-eagle))
      (sees bald-eagle tiger))))

; Rule: If someone needs the bald eagle and the bald eagle chases the tiger then the bald eagle sees the cow.
(assert (forall ((x Entity))
  (=> (and (needs x bald-eagle) (chases bald-eagle tiger))
      (sees bald-eagle cow))))

; Rule: If someone is red and they need the tiger then they are blue.
(assert (forall ((x Entity))
  (=> (and (is-red x) (needs x tiger))
      (is-blue x))))

; 6. Verification: The cow is not young.
; We assert the statement to check if it is consistent with the knowledge base.
(assert (not (is-young cow)))

; 7. Check satisfiability
(check-sat)
(get-model)