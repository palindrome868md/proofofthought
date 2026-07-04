; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare constants
(declare-const bald_eagle Entity)
(declare-const cow Entity)

; 3. Declare functions (Predicates and Relations)
(declare-fun is_rough (Entity) Bool)
(declare-fun is_blue (Entity) Bool)
(declare-fun is_cold (Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)

; 4. Assert knowledge base (facts)
(assert (is_rough bald_eagle))
(assert (chases cow bald_eagle))

; Rule 1: If something likes the bald eagle and the bald eagle eats the cow then the bald eagle chases the cow.
(assert (forall ((x Entity))
  (=> (and (likes x bald_eagle) (eats bald_eagle cow))
      (chases bald_eagle cow))))

; Rule 2: If something eats the bald eagle and the bald eagle eats the cow then the bald eagle chases the cow.
(assert (forall ((x Entity))
  (=> (and (eats x bald_eagle) (eats bald_eagle cow))
      (chases bald_eagle cow))))

; Rule 3: If something likes the cow and it is blue then it chases the bald eagle.
(assert (forall ((x Entity))
  (=> (and (likes x cow) (is_blue x))
      (chases x bald_eagle))))

; Rule 4: If something eats the cow then it likes the bald eagle.
(assert (forall ((x Entity))
  (=> (eats x cow)
      (likes x bald_eagle))))

; Rule 5: If something is cold then it chases the bald eagle.
(assert (forall ((x Entity))
  (=> (is_cold x)
      (chases x bald_eagle))))

; Rule 6: If something chases the bald eagle then the bald eagle eats the cow.
(assert (forall ((x Entity))
  (=> (chases x bald_eagle)
      (eats bald_eagle cow))))

; 5. Test Question: The bald eagle does not like the bald eagle.
; We assert the statement to check if it is consistent with the knowledge base.
(assert (not (likes bald_eagle bald_eagle)))

; 6. Check satisfiability
(check-sat)
(get-model)