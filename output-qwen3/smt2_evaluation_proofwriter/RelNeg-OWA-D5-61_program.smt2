; Declare sorts
(declare-sort Animal 0)

; Declare predicates/functions
(declare-fun sees (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-green (Animal) Bool)
(declare-fun is-big (Animal) Bool)
(declare-fun is-round (Animal) Bool)
(declare-fun is-rough (Animal) Bool)

; Declare constants
(declare-const bear Animal)
(declare-const mouse Animal)
(declare-const tiger Animal)
(declare-const squirrel Animal)

; === FACTS ===
(assert (sees bear mouse))
(assert (not (sees bear tiger)))
(assert (visits bear squirrel))
(assert (visits bear tiger))
(assert (not (eats mouse tiger)))
(assert (is-cold mouse))
(assert (is-green mouse))
(assert (visits mouse squirrel))
(assert (is-cold squirrel))
(assert (visits squirrel bear))
(assert (visits squirrel mouse))
(assert (eats tiger mouse))
(assert (is-big tiger))
(assert (sees tiger bear))
(assert (sees tiger mouse))
(assert (not (visits tiger mouse)))

; === RULES ===
; Rule 1: If something eats the squirrel then the squirrel is not green
(assert (forall ((x Animal))
  (=> (eats x squirrel) (not (is-green squirrel)))))

; Rule 2: If something sees the bear and the bear sees the mouse then it visits the tiger
(assert (forall ((x Animal))
  (=> (and (sees x bear) (sees bear mouse)) (visits x tiger))))

; Rule 3: If something sees the squirrel then it is not rough
(assert (forall ((x Animal))
  (=> (sees x squirrel) (not (is-rough x)))))

; Rule 4: If something is round and big then it sees the bear
(assert (forall ((x Animal))
  (=> (and (is-round x) (is-big x)) (sees x bear))))

; Rule 5: If something visits the tiger then it sees the squirrel
(assert (forall ((x Animal))
  (=> (visits x tiger) (sees x squirrel))))

; Rule 6: If something visits the squirrel and it visits the tiger then the squirrel eats the mouse
(assert (forall ((x Animal))
  (=> (and (visits x squirrel) (visits x tiger)) (eats squirrel mouse))))

; Rule 7: If something visits the bear and it eats the mouse then the mouse sees the bear
(assert (forall ((x Animal))
  (=> (and (visits x bear) (eats x mouse)) (sees mouse bear))))

; Rule 8: If something eats the mouse and the mouse is not round then it is not cold
(assert (forall ((x Animal))
  (=> (and (eats x mouse) (not (is-round mouse))) (not (is-cold x)))))

; === QUESTION: The mouse does not visit the tiger ===
; Test if this statement is consistent with the knowledge base
(assert (not (visits mouse tiger)))

; Check satisfiability
(check-sat)
(get-model)