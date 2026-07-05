; Declare sorts
(declare-sort Person 0)

; Declare binary predicates
(declare-fun chases (Person Person) Bool)
(declare-fun sees (Person Person) Bool)
(declare-fun needs (Person Person) Bool)

; Declare unary predicates
(declare-fun young (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun green (Person) Bool)

; Declare constants (the individuals)
(declare-const bald_eagle Person)
(declare-const cow Person)
(declare-const tiger Person)

; Initial facts
(assert (chases bald_eagle tiger))
(assert (needs bald_eagle tiger))
(assert (sees bald_eagle cow))
(assert (sees bald_eagle tiger))
(assert (chases cow tiger))
(assert (kind cow))
(assert (red cow))
(assert (sees cow bald_eagle))
(assert (sees cow tiger))
(assert (chases tiger bald_eagle))
(assert (chases tiger cow))
(assert (blue tiger))
(assert (kind tiger))
(assert (red tiger))
(assert (needs tiger bald_eagle))

; Rules

; 1. Young & kind -> green
(assert (forall ((p Person))
  (=> (and (young p) (kind p))
      (green p))))

; 2. If someone needs the tiger and the tiger needs the cow, then the cow is young
(assert (forall ((p Person))
  (=> (and (needs p tiger) (needs tiger cow))
      (young cow))))

; 3. If someone chases the tiger and they chase the bald eagle, then the bald eagle sees the tiger
(assert (forall ((p Person))
  (=> (and (chases p tiger) (chases p bald_eagle))
      (sees bald_eagle tiger))))

; 4. If someone sees the tiger, then the tiger needs the cow
(assert (forall ((p Person))
  (=> (sees p tiger)
      (needs tiger cow))))

; 5. If someone needs the bald eagle and the bald eagle chases the tiger, then the bald eagle sees the cow
(assert (forall ((p Person))
  (=> (and (needs p bald_eagle) (chases bald_eagle tiger))
      (sees bald_eagle cow))))

; 6. If someone is red and they need the tiger, then they are blue
(assert (forall ((p Person))
  (=> (and (red p) (needs p tiger))
      (blue p))))

; Test: The cow is not young
(assert (not (young cow)))

; Check satisfiability
(check-sat)