; -------------------------------------------------
; 1. Declare the uninterpreted sort for all objects
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare the predicates (boolean‑valued functions)
; -------------------------------------------------
(declare-fun likes (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun chases (Entity Entity) Bool)

; -------------------------------------------------
; 3. Declare the individual constants
; -------------------------------------------------
(declare-const bald_eagle Entity)
(declare-const bear Entity)
(declare-const mouse Entity)
(declare-const squirrel Entity)

; -------------------------------------------------
; 4. Knowledge base (facts)
; -------------------------------------------------
(assert (likes bald_eagle mouse))          ; The bald eagle likes the mouse
(assert (likes bear squirrel))             ; The bear likes the squirrel
(assert (round mouse))                     ; The mouse is round
(assert (eats squirrel mouse))             ; The squirrel eats the mouse

; -------------------------------------------------
; 5. General rule
; -------------------------------------------------
; If something eats the mouse then the mouse chases the squirrel
(assert (forall ((x Entity))
  (=> (eats x mouse)
      (chases mouse squirrel))))

; -------------------------------------------------
; 6. Query: "The bald eagle likes the mouse."
; -------------------------------------------------
(assert (likes bald_eagle mouse))

; -------------------------------------------------
; 7. Check the consistency of the whole set
; -------------------------------------------------
(check-sat)
(get-model)