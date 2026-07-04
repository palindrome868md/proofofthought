; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (predicates and relations)
(declare-fun eats (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun is-big (Animal) Bool)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-round (Animal) Bool)
(declare-fun is-red (Animal) Bool)

; 3. Declare constants (specific animals)
(declare-const bald-eagle Animal)
(declare-const cat Animal)
(declare-const lion Animal)
(declare-const rabbit Animal)

; 4. Assert knowledge base (facts)
(assert (eats bald-eagle cat))
(assert (eats bald-eagle lion))
(assert (not (chases cat rabbit)))
(assert (not (is-big cat)))
(assert (not (likes cat lion)))
(assert (is-cold lion))
(assert (is-round lion))
(assert (chases rabbit lion))
(assert (not (eats rabbit bald-eagle)))
(assert (eats rabbit lion))
(assert (is-red rabbit))
(assert (likes rabbit bald-eagle))

; Assert Rules
; Rule 1: If someone is cold then they do not chase the bald eagle.
(assert (forall ((x Animal)) (=> (is-cold x) (not (chases x bald-eagle)))))

; Rule 2: If the lion chases the cat and the cat eats the rabbit then the cat is not red.
(assert (=> (and (chases lion cat) (eats cat rabbit)) (not (is-red cat))))

; Rule 3: If someone is round and they do not chase the bald eagle then they do not like the lion.
(assert (forall ((x Animal)) (=> (and (is-round x) (not (chases x bald-eagle))) (not (likes x lion)))))

; 5. Verification: Test the question "The lion chases the bald eagle."
; We assert the statement and check for satisfiability.
; If unsat, the statement contradicts the knowledge base (is False).
; If sat, the statement is consistent (is True/Possible).
(assert (chases lion bald-eagle))

; 6. Check satisfiability
(check-sat)
(get-model)