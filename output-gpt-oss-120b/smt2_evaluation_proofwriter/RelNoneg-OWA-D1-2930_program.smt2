; -------------------------------------------------
; 1. Declare the uninterpreted sort for all individuals
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare predicates (functions returning Bool)
; -------------------------------------------------
(declare-fun sees   (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)

(declare-fun blue   (Entity) Bool)
(declare-fun young  (Entity) Bool)

; -------------------------------------------------
; 3. Declare the concrete constants mentioned in the story
; -------------------------------------------------
(declare-const bald_eagle Entity)
(declare-const rabbit     Entity)
(declare-const squirrel   Entity)

; -------------------------------------------------
; 4. Assert the factual knowledge base
; -------------------------------------------------
; The bald eagle sees the rabbit.
(assert (sees bald_eagle rabbit))

; The rabbit likes the bald eagle.
(assert (likes rabbit bald_eagle))

; The squirrel is blue.
(assert (blue squirrel))

; -------------------------------------------------
; 5. Encode the general rules (universally quantified)
; -------------------------------------------------
; Rule 1: If something likes the bald eagle then it is blue.
(assert
  (forall ((x Entity))
    (=> (likes x bald_eagle)
        (blue x))))

; Rule 2: If something likes the bald eagle and it sees the bald eagle then the bald eagle is blue.
(assert
  (forall ((x Entity))
    (=> (and (likes x bald_eagle)
             (sees x bald_eagle))
        (blue bald_eagle))))

; Rule 3: If something chases the rabbit then the rabbit is young.
(assert
  (forall ((x Entity))
    (=> (chases x rabbit)
        (young rabbit))))

; -------------------------------------------------
; 6. Query: Is the rabbit blue?
; -------------------------------------------------
(assert (blue rabbit))

; -------------------------------------------------
; 7. Ask Z3 to check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)