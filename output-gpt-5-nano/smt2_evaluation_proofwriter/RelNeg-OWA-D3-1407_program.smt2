; Declare sorts
(declare-sort Obj 0)

; Declare constants
(declare-const cat Obj)
(declare-const tiger Obj)
(declare-const mouse Obj)
(declare-const squirrel Obj)

; Declare predicates
(declare-fun eats (Obj Obj) Bool)
(declare-fun cold (Obj) Bool)
(declare-fun round (Obj) Bool)
(declare-fun nice (Obj) Bool)
(declare-fun rough (Obj) Bool)
(declare-fun visits (Obj Obj) Bool)
(declare-fun likes (Obj Obj) Bool)
(declare-fun red (Obj) Bool)

; Knowledge base (facts)
(assert (eats cat tiger))
(assert (cold cat))
(assert (round cat))
(assert (nice mouse))
(assert (not (rough mouse)))
(assert (likes mouse cat))
(assert (likes mouse squirrel))
(assert (not (visits mouse cat)))
(assert (eats squirrel mouse))
(assert (nice squirrel))
(assert (rough squirrel))
(assert (visits squirrel tiger))
(assert (eats tiger squirrel))
(assert (nice tiger))
(assert (likes tiger cat))
(assert (likes tiger squirrel))

; Rules
; 1. If someone likes the mouse and the mouse is not round then the mouse is cold.
(assert (forall ((p Obj)) (=> (and (likes p mouse) (not (round mouse))) (cold mouse))))
; 2. All rough people are not cold.
(assert (forall ((p Obj)) (=> (rough p) (not (cold p)))))
; 3. If the mouse visits the tiger and the mouse is not cold then the tiger is cold.
(assert (=> (and (visits mouse tiger) (not (cold mouse))) (cold tiger)))
; 4. If someone eats the tiger and the tiger is cold then the tiger does not eat the cat.
(assert (forall ((p Obj)) (=> (and (eats p tiger) (cold tiger)) (not (eats tiger cat)))))
; 5. If someone is red and they visit the tiger then the tiger does not eat the cat.
(assert (forall ((p Obj)) (=> (and (red p) (visits p tiger)) (not (eats tiger cat)))))
; 6. If the squirrel eats the tiger and the squirrel visits the cat then the tiger visits the cat.
(assert (=> (and (eats squirrel tiger) (visits squirrel cat)) ( visits tiger cat)))
; 7. If the squirrel is not cold then the squirrel visits the cat.
(assert (=> (not (cold squirrel)) (visits squirrel cat)))
; 8. If someone visits the cat then the cat visits the squirrel.
(assert (forall ((p Obj)) (=> (visits p cat) (visits cat squirrel))))

; Test: The squirrel is cold.
(assert (cold squirrel))

; Check satisfiability and get a model
(check-sat)
(get-model)