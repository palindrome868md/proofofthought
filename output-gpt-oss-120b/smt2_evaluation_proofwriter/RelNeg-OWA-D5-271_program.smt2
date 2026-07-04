;--- 1. Declare the sort -------------------------------------------------
(declare-sort Animal 0)

;--- 2. Declare predicates ------------------------------------------------
; Unary predicates
(declare-fun cold (Animal) Bool)
(declare-fun blue (Animal) Bool)
(declare-fun rough (Animal) Bool)

; Binary predicates
(declare-fun likes (Animal Animal) Bool)
(declare-fun needs (Animal Animal) Bool)
(declare-fun chase (Animal Animal) Bool)

;--- 3. Declare the individuals -------------------------------------------
(declare-const bear Animal)
(declare-const dog Animal)
(declare-const mouse Animal)
(declare-const squirrel Animal)

;--- 4. Explicit facts ----------------------------------------------------
(assert (cold bear))                         ; The bear is cold.
(assert (not (likes dog bear)))              ; The dog does not like the bear.
(assert (likes dog squirrel))                ; The dog likes the squirrel.
(assert (blue mouse))                        ; The mouse is blue.
(assert (rough mouse))                       ; The mouse is rough.
(assert (likes mouse dog))                   ; The mouse likes the dog.
(assert (not (needs mouse bear)))            ; The mouse does not need the bear.
(assert (cold squirrel))                     ; The squirrel is cold.
(assert (likes squirrel dog))                ; The squirrel likes the dog.
(assert (likes squirrel mouse))              ; The squirrel likes the mouse.

;--- 5. General rules -----------------------------------------------------

; If someone likes the bear and they like the dog then they like the squirrel.
(assert (forall ((x Animal))
  (=> (and (likes x bear) (likes x dog))
      (likes x squirrel))))

; If someone is blue then they chase the bear.
(assert (forall ((x Animal))
  (=> (blue x) (chase x bear))))

; If someone needs the squirrel and the squirrel is cold then they chase the bear.
(assert (forall ((x Animal))
  (=> (and (needs x squirrel) (cold squirrel))
      (chase x bear))))

; If the dog does not need the bear then the dog does not chase the squirrel.
(assert (=> (not (needs dog bear))
            (not (chase dog squirrel))))

; If someone likes the mouse and the mouse needs the dog then they chase the dog.
(assert (forall ((x Animal))
  (=> (and (likes x mouse) (needs mouse dog))
      (chase x dog))))

; If someone chases the dog then the dog needs the squirrel.
(assert (forall ((x Animal))
  (=> (chase x dog)
      (needs dog squirrel))))

; If someone chases the bear and they do not need the bear then they need the dog.
(assert (forall ((x Animal))
  (=> (and (chase x bear) (not (needs x bear)))
      (needs x dog))))

; If someone likes the mouse and they are cold then they need the squirrel.
(assert (forall ((x Animal))
  (=> (and (likes x mouse) (cold x))
      (needs x squirrel))))

;--- 6. Query: "The mouse is not rough." -----------------------------------
(assert (not (rough mouse)))   ; test the negation of the known fact

;--- 7. Check the result --------------------------------------------------
(check-sat)   ; expected: unsat (the query is false)
(get-model)   ; optional: show a model if SAT (won't be produced here)