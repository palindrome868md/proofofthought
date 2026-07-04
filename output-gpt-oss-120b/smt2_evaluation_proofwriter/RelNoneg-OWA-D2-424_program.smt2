; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Entity 0)

; Unary predicates
(declare-fun rough (Entity) Bool)
(declare-fun blue  (Entity) Bool)
(declare-fun cold  (Entity) Bool)

; Binary predicates
(declare-fun chases (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)

; Constants for the two individuals
(declare-const bald_eagle Entity)
(declare-const cow        Entity)

; -------------------------------------------------
;  Facts
; -------------------------------------------------
(assert (rough bald_eagle))          ; The bald eagle is rough.
(assert (chases cow bald_eagle))     ; The cow chases the bald eagle.

; -------------------------------------------------
;  Rules (encoded as universal implications)
; -------------------------------------------------
; 1. If something likes the bald eagle and the bald eagle eats the cow,
;    then the bald eagle chases the cow.
(assert (forall ((x Entity))
  (=> (and (likes x bald_eagle) (eats bald_eagle cow))
      (chases bald_eagle cow))))

; 2. If something eats the bald eagle and the bald eagle eats the cow,
;    then the bald eagle chases the cow.
(assert (forall ((x Entity))
  (=> (and (eats x bald_eagle) (eats bald_eagle cow))
      (chases bald_eagle cow))))

; 3. If something likes the cow and it is blue then it chases the bald eagle.
(assert (forall ((x Entity))
  (=> (and (likes x cow) (blue x))
      (chases x bald_eagle))))

; 4. If something eats the cow then it likes the bald eagle.
(assert (forall ((x Entity))
  (=> (eats x cow)
      (likes x bald_eagle))))

; 5. If something is cold then it chases the bald eagle.
(assert (forall ((x Entity))
  (=> (cold x)
      (chases x bald_eagle))))

; 6. If something chases the bald eagle then the bald eagle eats the cow.
(assert (forall ((x Entity))
  (=> (chases x bald_eagle)
      (eats bald_eagle cow))))

; -------------------------------------------------
;  Query:  "The bald eagle does not like the bald eagle."
; -------------------------------------------------
; We assert the negation of the statement we want to test.
; If the knowledge base forces (likes bald_eagle bald_eagle) to be true,
; then this assertion will make the whole set unsatisfiable.
(assert (not (likes bald_eagle bald_eagle)))

; -------------------------------------------------
;  Check the result
; -------------------------------------------------
(check-sat)   ; Expected: unsat (the statement is false)
(get-model)   ; Optional: show a model for the satisfiable case (won't be returned for unsat)