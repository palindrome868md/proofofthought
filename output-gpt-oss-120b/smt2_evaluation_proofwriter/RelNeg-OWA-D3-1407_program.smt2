;--- Declare an uninterpreted sort for all individuals -----------------
(declare-sort Entity 0)

;--- Predicates ---------------------------------------------------------
(declare-fun eats   (Entity Entity) Bool)   ; eats(x, y)
(declare-fun visits (Entity Entity) Bool)   ; visits(x, y)
(declare-fun likes  (Entity Entity) Bool)   ; likes(x, y)

(declare-fun cold   (Entity)       Bool)    ; cold(x)
(declare-fun round  (Entity)       Bool)    ; round(x)
(declare-fun rough  (Entity)       Bool)    ; rough(x)
(declare-fun nice   (Entity)       Bool)    ; nice(x)
(declare-fun red    (Entity)       Bool)    ; red(x)

;--- Constants -----------------------------------------------------------
(declare-const cat    Entity)
(declare-const mouse  Entity)
(declare-const squirrel Entity)
(declare-const tiger  Entity)

;--- Facts ---------------------------------------------------------------
; The cat eats the tiger. The cat is cold. The cat is round.
(assert (eats cat tiger))
(assert (cold cat))
(assert (round cat))

; The mouse is nice. The mouse is not rough. The mouse likes the cat and the squirrel.
(assert (nice mouse))
(assert (not (rough mouse)))
(assert (likes mouse cat))
(assert (likes mouse squirrel))

; The mouse does not visit the cat.
(assert (not (visits mouse cat)))

; The squirrel eats the mouse. The squirrel is nice and rough. The squirrel visits the tiger.
(assert (eats squirrel mouse))
(assert (nice squirrel))
(assert (rough squirrel))
(assert (visits squirrel tiger))

; The tiger eats the squirrel. The tiger is nice. The tiger likes the cat and the squirrel.
(assert (eats tiger squirrel))
(assert (nice tiger))
(assert (likes tiger cat))
(assert (likes tiger squirrel))

;--- Rules ---------------------------------------------------------------
; 1. If someone likes the mouse and the mouse is not round then the mouse is cold.
(forall ((x Entity))
  (=> (and (likes x mouse) (not (round mouse))) (cold mouse)))

; 2. All rough people are not cold.
(forall ((x Entity))
  (=> (rough x) (not (cold x))))

; 3. If the mouse visits the tiger and the mouse is not cold then the tiger is cold.
(forall ((x Entity))
  (=> (and (visits mouse tiger) (not (cold mouse))) (cold tiger)))

; 4. If someone eats the tiger and the tiger is cold then the tiger does not eat the cat.
(forall ((x Entity))
  (=> (and (eats x tiger) (cold tiger)) (not (eats tiger cat))))

; 5. If someone is red and they visit the tiger then the tiger does not eat the cat.
(forall ((x Entity))
  (=> (and (red x) (visits x tiger)) (not (eats tiger cat))))

; 6. If the squirrel eats the tiger and the squirrel visits the cat then the tiger visits the cat.
(assert
  (=> (and (eats squirrel tiger) (visits squirrel cat))
      (visits tiger cat)))

; 7. If the squirrel is not cold then the squirrel visits the cat.
(assert
  (=> (not (cold squirrel))
      (visits squirrel cat)))

; 8. If someone visits the cat then the cat visits the squirrel.
(forall ((x Entity))
  (=> (visits x cat) (visits cat squirrel)))

;--- Query: is the squirrel cold? ----------------------------------------
(assert (cold squirrel))

(check-sat)
(get-model)