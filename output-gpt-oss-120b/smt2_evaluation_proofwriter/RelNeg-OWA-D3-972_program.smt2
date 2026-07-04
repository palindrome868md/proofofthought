;--- Declare an uninterpreted sort for all individuals
(declare-sort Animal 0)

;--- Predicates (functions returning Bool)
(declare-fun kind (Animal) Bool)
(declare-fun blue (Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun rough (Animal) Bool)
(declare-fun cold (Animal) Bool)
(declare-fun likes (Animal Animal) Bool)

;--- Constants for the named individuals
(declare-const bald_eagle Animal)
(declare-const cow Animal)
(declare-const lion Animal)
(declare-const mouse Animal)

;--- Given facts
(assert (kind bald_eagle))               ; The bald eagle is kind.
(assert (blue cow))                      ; The cow is blue.
(assert (chases lion mouse))             ; The lion chases the mouse.
(assert (chases mouse lion))             ; The mouse chases the lion.

;--- Rules
; If someone chases the mouse then the mouse is not rough.
(assert (forall ((x Animal))
  (=> (chases x mouse) (not (rough mouse)))))

; If someone sees the mouse then they chase the cow.
(assert (forall ((x Animal))
  (=> (sees x mouse) (chases x cow))))

; If someone is kind then they are cold.
(assert (forall ((x Animal))
  (=> (kind x) (cold x))))

; If someone chases the lion and they do not see the mouse then they are not kind.
(assert (forall ((x Animal))
  (=> (and (chases x lion) (not (sees x mouse))) (not (kind x)))))

; If someone is cold then they like the lion.
(assert (forall ((x Animal))
  (=> (cold x) (likes x lion))))

; If someone likes the lion then the lion chases the cow.
(assert (forall ((x Animal))
  (=> (likes x lion) (chases lion cow))))

;--- Test the statement: "The bald eagle does not like the lion."
(assert (not (likes bald_eagle lion)))

;--- Check consistency of the KB together with the test assertion
(check-sat)
(get-model)