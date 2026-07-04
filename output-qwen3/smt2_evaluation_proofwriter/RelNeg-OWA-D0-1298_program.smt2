; Reasoning Steps:
; 1. Identify Entities: bald-eagle, mouse, bear. Sort: Thing.
; 2. Identify Predicates: chases, is-rough, visits, is-red, is-blue, is-big, likes, is-kind.
; 3. Translate Sentences to Assertions (Knowledge Base):
;    - "The bald eagle chases the mouse" -> (chases bald-eagle mouse)
;    - "The bear is rough" -> (is-rough bear)
;    - "The mouse visits the bear" -> (visits mouse bear)
;    - "Red things are not rough" -> forall x, is-red(x) => not is-rough(x)
;    - "Rough, red things are not blue" -> forall x, (is-rough(x) and is-red(x)) => not is-blue(x)
;    - "If something chases the mouse then the mouse chases the bear" -> forall x, chases(x, mouse) => chases(mouse, bear)
;    - "If something chases the mouse and the mouse is big then it visits the bear" -> forall x, (chases(x, mouse) and is-big(mouse)) => visits(x, bear)
;    - "If the bear likes the mouse and the bear is not red then the mouse chases the bald eagle" -> (likes(bear, mouse) and not is-red(bear)) => chases(mouse, bald-eagle)
;    - "If something chases the bear then it is kind" -> forall x, chases(x, bear) => is-kind(x)
; 4. Verify Question: "The bear is rough."
;    - Assert (is-rough bear) and check satisfiability.
;    - Since (is-rough bear) is explicitly in KB, result should be sat (True).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions
(declare-fun chases (Thing Thing) Bool)
(declare-fun is-rough (Thing) Bool)
(declare-fun visits (Thing Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-big (Thing) Bool)
(declare-fun likes (Thing Thing) Bool)
(declare-fun is-kind (Thing) Bool)

; 3. Declare constants
(declare-const bald-eagle Thing)
(declare-const mouse Thing)
(declare-const bear Thing)

; 4. Assert knowledge base (facts)
; The bald eagle chases the mouse.
(assert (chases bald-eagle mouse))
; The bear is rough.
(assert (is-rough bear))
; The mouse visits the bear.
(assert (visits mouse bear))
; Red things are not rough.
(assert (forall ((x Thing))
  (=> (is-red x) (not (is-rough x)))))
; Rough, red things are not blue.
(assert (forall ((x Thing))
  (=> (and (is-rough x) (is-red x)) (not (is-blue x)))))
; If something chases the mouse then the mouse chases the bear.
(assert (forall ((x Thing))
  (=> (chases x mouse) (chases mouse bear))))
; If something chases the mouse and the mouse is big then it visits the bear.
(assert (forall ((x Thing))
  (=> (and (chases x mouse) (is-big mouse)) (visits x bear))))
; If the bear likes the mouse and the bear is not red then the mouse chases the bald eagle.
(assert (=> (and (likes bear mouse) (not (is-red bear))) (chases mouse bald-eagle)))
; If something chases the bear then it is kind.
(assert (forall ((x Thing))
  (=> (chases x bear) (is-kind x))))

; 5. Check satisfiability for the question: "The bear is rough."
; Assert the scenario being tested
(assert (is-rough bear))

; Check satisfiability
(check-sat)
(get-model)