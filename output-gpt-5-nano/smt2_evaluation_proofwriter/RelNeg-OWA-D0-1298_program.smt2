; Declare sorts
(declare-sort Entity 0)

; Declare predicates
(declare-fun chases (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun big (Entity) Bool)
(declare-fun likes (Entity Entity) Bool)
(declare-fun kind (Entity) Bool)

; Declare constants
(declare-const bald-eagle Entity)
(declare-const bear Entity)
(declare-const mouse Entity)

; Knowledge base
(assert (chases bald-eagle mouse))                             ; The bald eagle chases the mouse
(assert (rough bear))                                          ; The bear is rough
(assert (visits mouse bear))                                   ; The mouse visits the bear
(assert (forall ((p Entity)) (=> (red p) (not (rough p)))))    ; Red things are not rough
(assert (forall ((p Entity)) (=> (and (rough p) (red p)) (not (blue p))))) ; Rough & red -> not blue
(assert (forall ((p Entity)) (=> (chases p mouse) (chases mouse bear)))) ; If something chases the mouse then the mouse chases the bear
(assert (forall ((p Entity)) (=> (and (chases p mouse) (big mouse)) (visits p bear)))) ; If something chases the mouse and the mouse is big then it visits the bear
(assert (forall ((p Entity)) (=> (and (likes bear mouse) (not (red bear))) (chases mouse bald-eagle)))) ; If bear likes mouse and bear not red then mouse chases bald-eagle
(assert (forall ((p Entity)) (=> (chases p bear) (kind p)))) ; If something chases the bear then it is kind

; Test: Is the bear rough?
(assert (rough bear))

; Check satisfiability and get a model
(check-sat)
(get-model)