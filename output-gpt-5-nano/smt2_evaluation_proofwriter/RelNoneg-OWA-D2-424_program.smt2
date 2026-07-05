; Declare sorts
(declare-sort Animal 0)

; Declare constants
(declare-const bald_eagle Animal)
(declare-const cow Animal)

; Predicates
(declare-fun likes (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun blue (Animal) Bool)
(declare-fun cold (Animal) Bool)
(declare-fun rough (Animal) Bool)

; Facts
(assert (rough bald_eagle))
(assert (chases cow bald_eagle))

; Rules
; If something likes the bald eagle and the bald eagle eats the cow then the bald eagle chases the cow.
(assert (forall ((x Animal))
  (=> (and (likes x bald_eagle) (eats bald_eagle cow))
      (chases bald_eagle cow))))

; If something eats the bald eagle and the bald eagle eats the cow then the bald eagle chases the cow.
(assert (forall ((x Animal))
  (=> (and (eats x bald_eagle) (eats bald_eagle cow))
      (chases bald_eagle cow))))

; If something likes the cow and it is blue then it chases the bald eagle.
(assert (forall ((x Animal))
  (=> (and (likes x cow) (blue x))
      (chases x bald_eagle))))

; If something eats the cow then it likes the bald eagle.
(assert (forall ((x Animal))
  (=> (eats x cow)
      (likes x bald_eagle))))

; If something is cold then it chases the bald eagle.
(assert (forall ((x Animal))
  (=> (cold x)
      (chases x bald_eagle))))

; If something chases the bald eagle then the bald eagle eats the cow.
(assert (forall ((x Animal))
  (=> (chases x bald_eagle)
      (eats bald_eagle cow))))

; Question: The bald eagle does not like the bald eagle.
(assert (not (likes bald_eagle bald_eagle)))

; Check satisfiability
(check-sat)
(get-model)