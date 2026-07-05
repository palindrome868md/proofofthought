; Sorts
(declare-sort Person 0)

; Constants
(declare-const bear Person)
(declare-const dog Person)
(declare-const mouse Person)
(declare-const squirrel Person)

; Predicates
(declare-fun likes (Person Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun chases (Person Person) Bool)
(declare-fun needs (Person Person) Bool)

; Facts (Knowledge Base)
(assert (cold bear))
(assert (not (likes dog bear)))
(assert (likes dog squirrel))
(assert (blue mouse))
(assert (rough mouse))
(assert (likes mouse dog))
(assert (not (needs mouse bear)))
(assert (cold squirrel))
(assert (likes squirrel dog))
(assert (likes squirrel mouse))

; Rules
; 1) If someone likes the bear and they like the dog then they like the squirrel.
(assert (forall ((p Person))
  (=> (and (likes p bear) (likes p dog))
      (likes p squirrel))))
; 2) If someone is blue then they chase the bear.
(assert (forall ((p Person))
  (=> (blue p)
      (chases p bear))))
; 3) If someone needs the squirrel and the squirrel is cold then they chase the bear.
(assert (forall ((p Person))
  (=> (and (needs p squirrel) (cold squirrel))
      (chases p bear))))
; 4) If the dog does not need the bear then the dog does not chase the squirrel.
(assert (forall ((p Person))
  (=> (not (needs dog bear))
      (not (chases dog squirrel)))))
; 5) If someone likes the mouse and the mouse needs the dog then they chase the dog.
(assert (forall ((p Person))
  (=> (and (likes p mouse) (needs mouse dog))
      (chases p dog))))
; 6) If someone chases the dog then the dog needs the squirrel.
(assert (forall ((p Person))
  (=> (chases p dog)
      (needs dog squirrel))))
; 7) If someone chases the bear and they do not need the bear then they need the dog.
(assert (forall ((p Person))
  (=> (and (chases p bear) (not (needs p bear)))
      (needs p dog))))
; 8) If someone likes the mouse and they are cold then they need the squirrel.
(assert (forall ((p Person))
  (=> (and (likes p mouse) (cold p))
      (needs p squirrel))))

; Test the Question: "The mouse is not rough."
(assert (not (rough mouse)))

; Check satisfiability and obtain a model if any
(check-sat)
(get-model)