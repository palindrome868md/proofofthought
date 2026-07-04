; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants (Specific Animals)
(declare-const bear Animal)
(declare-const dog Animal)
(declare-const mouse Animal)
(declare-const squirrel Animal)

; 3. Declare Functions (Predicates and Relations)
; Properties
(declare-fun is-cold (Animal) Bool)
(declare-fun is-blue (Animal) Bool)
(declare-fun is-rough (Animal) Bool)
; Relations
(declare-fun likes (Animal Animal) Bool)
(declare-fun needs (Animal Animal) Bool)
(declare-fun chases (Animal Animal) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (is-cold bear))
(assert (not (likes dog bear)))
(assert (likes dog squirrel))
(assert (is-blue mouse))
(assert (is-rough mouse))
(assert (likes mouse dog))
(assert (not (needs mouse bear)))
(assert (is-cold squirrel))
(assert (likes squirrel dog))
(assert (likes squirrel mouse))

; 5. Assert Knowledge Base (Rules)
; Rule 1: If someone likes the bear and they like the dog then they like the squirrel.
(assert (forall ((x Animal))
  (=> (and (likes x bear) (likes x dog))
      (likes x squirrel))))

; Rule 2: If someone is blue then they chase the bear.
(assert (forall ((x Animal))
  (=> (is-blue x)
      (chases x bear))))

; Rule 3: If someone needs the squirrel and the squirrel is cold then they chase the bear.
(assert (forall ((x Animal))
  (=> (and (needs x squirrel) (is-cold squirrel))
      (chases x bear))))

; Rule 4: If the dog does not need the bear then the dog does not chase the squirrel.
(assert (=> (not (needs dog bear))
            (not (chases dog squirrel))))

; Rule 5: If someone likes the mouse and the mouse needs the dog then they chase the dog.
(assert (forall ((x Animal))
  (=> (and (likes x mouse) (needs mouse dog))
      (chases x dog))))

; Rule 6: If someone chases the dog then the dog needs the squirrel.
(assert (forall ((x Animal))
  (=> (chases x dog)
      (needs dog squirrel))))

; Rule 7: If someone chases the bear and they do not need the bear then they need the dog.
(assert (forall ((x Animal))
  (=> (and (chases x bear) (not (needs x bear)))
      (needs x dog))))

; Rule 8: If someone likes the mouse and they are cold then they need the squirrel.
(assert (forall ((x Animal))
  (=> (and (likes x mouse) (is-cold x))
      (needs x squirrel))))

; 6. Verification: Test the statement "The mouse is not rough."
; We assert the statement to check if it is consistent with the KB.
(assert (not (is-rough mouse)))

; 7. Check Satisfiability
(check-sat)
(get-model)