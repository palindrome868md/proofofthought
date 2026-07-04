; ==============================================================================
; Reasoning Steps:
; ==============================================================================
; 1. Decomposition of the Problem:
;    - Entities: bald-eagle, cow, lion, mouse (Sort: Animal)
;    - Properties: is-kind, is-blue, is-rough, is-cold
;    - Relations: chases, sees, likes
;
; 2. Logical Deduction:
;    - Fact: The bald eagle is kind. (is-kind bald-eagle)
;    - Rule: If someone is kind then they are cold. (is-kind x => is-cold x)
;      -> Deduction: The bald eagle is cold.
;    - Rule: If someone is cold then they like the lion. (is-cold x => likes x lion)
;      -> Deduction: The bald eagle likes the lion.
;
; 3. Verification Strategy:
;    - Question Statement: "The bald eagle does not like the lion."
;    - To test this, we assert the statement: (not (likes bald-eagle lion))
;    - If the Knowledge Base implies (likes bald-eagle lion), then asserting the 
;      negation will lead to a contradiction.
;    - Expected Result: unsat (The statement is False).
;
; ==============================================================================

; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants
(declare-const bald-eagle Animal)
(declare-const cow Animal)
(declare-const lion Animal)
(declare-const mouse Animal)

; 3. Declare Functions (Predicates and Relations)
(declare-fun is-kind (Animal) Bool)
(declare-fun is-blue (Animal) Bool)
(declare-fun is-rough (Animal) Bool)
(declare-fun is-cold (Animal) Bool)
(declare-fun chases (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (is-kind bald-eagle))
(assert (is-blue cow))
(assert (chases lion mouse))
(assert (chases mouse lion))

; 5. Assert Knowledge Base (Rules)

; Rule: If someone chases the mouse then the mouse is not rough.
(assert (forall ((x Animal))
  (=> (chases x mouse) (not (is-rough mouse)))))

; Rule: If someone sees the mouse then they chase the cow.
(assert (forall ((x Animal))
  (=> (sees x mouse) (chases x cow))))

; Rule: If someone is kind then they are cold.
(assert (forall ((x Animal))
  (=> (is-kind x) (is-cold x))))

; Rule: If someone chases the lion and they do not see the mouse then they are not kind.
(assert (forall ((x Animal))
  (=> (and (chases x lion) (not (sees x mouse))) (not (is-kind x)))))

; Rule: If someone is cold then they like the lion.
(assert (forall ((x Animal))
  (=> (is-cold x) (likes x lion))))

; Rule: If someone likes the lion then the lion chases the cow.
(assert (forall ((x Animal))
  (=> (likes x lion) (chases lion cow))))

; 6. Verification
; Question: The bald eagle does not like the lion.
; We assert this scenario to check for satisfiability against the KB.
(assert (not (likes bald-eagle lion)))

; 7. Check Satisfiability
; Expected: unsat (because KB implies bald-eagle likes lion)
(check-sat)
(get-model)