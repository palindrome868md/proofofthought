; Sorts
(declare-sort Animal 0)

; Constants
(declare-const bear Animal)
(declare-const dog Animal)
(declare-const lion Animal)
(declare-const squirrel Animal)

; Predicates
(declare-fun cold (Animal) Bool)
(declare-fun blue (Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)

; Facts (Knowledge Base)
(assert (cold bear))
(assert (not (chases dog lion)))
(assert (not (blue lion)))
(assert (likes lion squirrel))
(assert (eats squirrel lion))
(assert (cold squirrel))
(assert (not (likes squirrel bear)))

; Rules
; If the squirrel is cold then the squirrel chases the bear
(assert (=> (cold squirrel) (chases squirrel bear)))
; If something chases the bear then the bear eats the squirrel
(assert (forall ((x Animal)) (=> (chases x bear) (eats bear squirrel))))

; Test: "The bear does not eat the squirrel."
(assert (not (eats bear squirrel)))
(check-sat)