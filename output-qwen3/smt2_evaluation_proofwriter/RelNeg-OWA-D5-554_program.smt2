; Declare sorts
(declare-sort Animal 0)

; Declare functions
(declare-fun chases (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun is-rough (Animal) Bool)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-round (Animal) Bool)
(declare-fun is-big (Animal) Bool)

; Declare constants
(declare-const bald-eagle Animal)
(declare-const cow Animal)
(declare-const lion Animal)
(declare-const bear Animal)

; Facts from the problem
(assert (chases bald-eagle cow))
(assert (likes bald-eagle lion))
(assert (chases bear lion))
(assert (not (eats bear bald-eagle)))
(assert (eats bear lion))
(assert (chases cow bald-eagle))
(assert (chases cow lion))
(assert (likes cow bald-eagle))
(assert (is-rough lion))
(assert (likes lion bald-eagle))

; Rules from the problem
; If something is rough then it eats the cow
(assert (forall ((x Animal))
  (=> (is-rough x) (eats x cow))))

; If something likes the cow then it eats the cow
(assert (forall ((x Animal))
  (=> (likes x cow) (eats x cow))))

; If something likes the cow then it likes the lion
(assert (forall ((x Animal))
  (=> (likes x cow) (likes x lion))))

; If something is cold then it likes the lion
(assert (forall ((x Animal))
  (=> (is-cold x) (likes x lion))))

; If the bear is cold and the bear eats the lion then the bear chases the cow
(assert (=> (and (is-cold bear) (eats bear lion))
  (chases bear cow)))

; If something is round and not big then it does not eat the bald eagle
(assert (forall ((x Animal))
  (=> (and (is-round x) (not (is-big x)))
  (not (eats x bald-eagle)))))

; If the bald eagle likes the bear and the bear chases the bald eagle then the bald eagle chases the bear
(assert (=> (and (likes bald-eagle bear) (chases bear bald-eagle))
  (chases bald-eagle bear)))

; If something is rough and it chases the cow then the cow is rough
(assert (forall ((x Animal))
  (=> (and (is-rough x) (chases x cow))
  (is-rough cow))))

; If something eats the cow then it chases the cow
(assert (forall ((x Animal))
  (=> (eats x cow) (chases x cow))))

; Test: Does the lion chase the cow?
; We assert this and check if it's satisfiable with the knowledge base
(assert (chases lion cow))

; Check satisfiability
(check-sat)
(get-model)