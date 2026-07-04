; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun chases (Entity Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun sees (Entity Entity) Bool)

; 3. Declare constants
(declare-const bald_eagle Entity)
(declare-const dog Entity)
(declare-const tiger Entity)

; 4. Assert knowledge base (facts)
(assert (chases bald_eagle dog))
(assert (chases bald_eagle tiger))
(assert (chases dog bald_eagle))
(assert (blue dog))
(assert (cold dog))
(assert (red dog))
(assert (round dog))
(assert (young dog))
(assert (chases tiger dog))
(assert (round tiger))
(assert (likes tiger bald_eagle))
(assert (sees tiger bald_eagle))

; 5. Assert rules
; If someone chases the bald eagle and they chase the tiger then they see the bald eagle.
(assert (forall ((x Entity))
  (=> (and (chases x bald_eagle) (chases x tiger))
      (sees x bald_eagle))))

; If the bald eagle sees the tiger and the tiger is young then the bald eagle chases the tiger.
(assert (=> (and (sees bald_eagle tiger) (young tiger))
    (chases bald_eagle tiger)))

; If the tiger likes the dog and the dog is cold then the dog sees the bald eagle.
(assert (=> (and (likes tiger dog) (cold dog))
    (sees dog bald_eagle)))

; If the dog is red and the dog sees the bald eagle then the bald eagle does not like the tiger.
(assert (=> (and (red dog) (sees dog bald_eagle))
    (not (likes bald_eagle tiger))))

; If someone is blue then they chase the tiger.
(assert (forall ((x Entity))
  (=> (blue x) (chases x tiger))))

; If the dog chases the tiger and the dog sees the tiger then the tiger does not like the bald eagle.
(assert (=> (and (chases dog tiger) (sees dog tiger))
    (not (likes tiger bald_eagle))))

; If someone chases the bald eagle and they do not like the tiger then the tiger is red.
(assert (forall ((x Entity))
  (=> (and (chases x bald_eagle) (not (likes x tiger)))
      (red tiger))))

; If someone is round and they do not see the bald eagle then the bald eagle sees the dog.
(assert (forall ((x Entity))
  (=> (and (round x) (not (sees x bald_eagle)))
      (sees bald_eagle dog))))

; 6. Verification: The bald eagle chases the dog.
(assert (chases bald_eagle dog))

; 7. Check satisfiability
(check-sat)
(get-model)