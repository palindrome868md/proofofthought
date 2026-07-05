; Declare sorts
(declare-sort Animal 0)

; Declare constants
(declare-const bald_eagle Animal)
(declare-const cat Animal)
(declare-const lion Animal)
(declare-const rabbit Animal)

; Declare predicates
(declare-fun eats (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun big (Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun red (Animal) Bool)
(declare-fun cold (Animal) Bool)
(declare-fun round (Animal) Bool)

; Knowledge base (given facts)
(assert (eats bald_eagle cat))
(assert (eats bald_eagle lion))
(assert (not (chases cat rabbit)))
(assert (not (big cat)))
(assert (not (likes cat lion)))
(assert (cold lion))
(assert (round lion))
(assert (chases rabbit lion))
(assert (not (eats rabbit bald_eagle)))
(assert (eats rabbit lion))
(assert (red rabbit))
(assert (likes rabbit bald_eagle))

; Rules
; 1) If someone is cold then they do not chase the bald eagle
(assert (forall ((x Animal))
  (=> (cold x) (not (chases x bald_eagle)))))

; 2) If the lion chases the cat and the cat eats the rabbit then the cat is not red
(assert (=> (and (chases lion cat) (eats cat rabbit)) (not (red cat))))

; 3) If someone is round and they do not chase the bald eagle then they do not like the lion
(assert (forall ((x Animal))
  (=> (and (round x) (not (chases x bald_eagle)))
      (not (likes x lion)))))

; Test: The lion chases the bald_eagle
(assert (chases lion bald_eagle))

; Check satisfiability (directly answers the question)
(check-sat)