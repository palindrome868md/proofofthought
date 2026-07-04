(set-logic ALL)

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions
(declare-fun eats (Entity Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-round (Entity) Bool)
(declare-fun is-nice (Entity) Bool)
(declare-fun is-rough (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun is-red (Entity) Bool)

; 3. Declare constants
(declare-const cat Entity)
(declare-const tiger Entity)
(declare-const mouse Entity)
(declare-const squirrel Entity)

; 4. Assert knowledge base (facts)
(assert (eats cat tiger))
(assert (is-cold cat))
(assert (is-round cat))
(assert (is-nice mouse))
(assert (not (is-rough mouse)))
(assert (likes mouse cat))
(assert (likes mouse squirrel))
(assert (not (visits mouse cat)))
(assert (eats squirrel mouse))
(assert (is-nice squirrel))
(assert (is-rough squirrel))
(assert (visits squirrel tiger))
(assert (eats tiger squirrel))
(assert (is-nice tiger))
(assert (likes tiger cat))
(assert (likes tiger squirrel))

; Rules
; If someone likes the mouse and the mouse is not round then the mouse is cold.
(assert (=> (and (exists ((x Entity)) (likes x mouse)) (not (is-round mouse))) (is-cold mouse)))

; All rough people are not cold.
(assert (forall ((x Entity)) (=> (is-rough x) (not (is-cold x)))))

; If the mouse visits the tiger and the mouse is not cold then the tiger is cold.
(assert (=> (and (visits mouse tiger) (not (is-cold mouse))) (is-cold tiger)))

; If someone eats the tiger and the tiger is cold then the tiger does not eat the cat.
(assert (=> (and (exists ((x Entity)) (eats x tiger)) (is-cold tiger)) (not (eats tiger cat))))

; If someone is red and they visit the tiger then the tiger does not eat the cat.
(assert (forall ((x Entity)) (=> (and (is-red x) (visits x tiger)) (not (eats tiger cat)))))

; If the squirrel eats the tiger and the squirrel visits the cat then the tiger visits the cat.
(assert (=> (and (eats squirrel tiger) (visits squirrel cat)) (visits tiger cat)))

; If the squirrel is not cold then the squirrel visits the cat.
(assert (=> (not (is-cold squirrel)) (visits squirrel cat)))

; If someone visits the cat then the cat visits the squirrel.
(assert (forall ((x Entity)) (=> (visits x cat) (visits cat squirrel))))

; 5. Verification
; Question: The squirrel is cold.
; We assert the statement to check if it is consistent with the knowledge base.
; Given "The squirrel is rough" and "All rough people are not cold", 
; asserting "The squirrel is cold" should lead to a contradiction (unsat).
(assert (is-cold squirrel))

(check-sat)
(get-model)