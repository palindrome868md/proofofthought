; ---------- Sort ----------
(declare-sort Entity 0)

; ---------- Predicates ----------
(declare-fun chases (Entity Entity) Bool)
(declare-fun kind   (Entity) Bool)
(declare-fun red    (Entity) Bool)
(declare-fun rough  (Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)

; ---------- Constants ----------
(declare-const cat    Entity)
(declare-const mouse  Entity)
(declare-const rabbit Entity)

; ---------- Facts ----------
(assert (chases cat rabbit))
(assert (kind   cat))
(assert (red    cat))
(assert (rough  cat))
(assert (visits cat mouse))

(assert (chases mouse cat))
(assert (chases mouse rabbit))
(assert (eats   mouse rabbit))
(assert (red    mouse))
(assert (rough  mouse))
(assert (visits mouse cat))
(assert (visits mouse rabbit))

(assert (chases rabbit mouse))
(assert (eats   rabbit cat))
(assert (eats   rabbit mouse))
(assert (red    rabbit))

; ---------- Rules ----------
; Rule 1: If something visits the rabbit and it visits the cat then the rabbit chases the cat.
(assert (forall ((x Entity))
  (=> (and (visits x rabbit) (visits x cat))
      (chases rabbit cat))))

; Rule 2: If something chases the cat then it visits the mouse.
(assert (forall ((x Entity))
  (=> (chases x cat)
      (visits x mouse))))

; ---------- Query ----------
; Is it the case that the rabbit chases the cat?
(assert (chases rabbit cat))

; ---------- Solve ----------
(check-sat)
(get-model)