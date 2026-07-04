; ==============================================================
; Declarations
; ==============================================================

(declare-sort Entity 0)

(declare-fun sees   (Entity Entity) Bool)   ; sees(x,y)
(declare-fun eats   (Entity Entity) Bool)   ; eats(x,y)
(declare-fun red    (Entity)       Bool)    ; red(x)
(declare-fun rough  (Entity)       Bool)    ; rough(x)
(declare-fun blue   (Entity)       Bool)    ; blue(x)
(declare-fun visits (Entity Entity) Bool)   ; visits(x,y)

; Constants for the individuals mentioned in the problem
(declare-const bald_eagle Entity)
(declare-const cat        Entity)
(declare-const mouse      Entity)
(declare-const rabbit     Entity)

; ==============================================================
; Knowledge Base (facts)
; ==============================================================

; The bald eagle sees the cat.
(assert (sees bald_eagle cat))

; The cat sees the bald eagle.
(assert (sees cat bald_eagle))

; The mouse does not eat the cat.
(assert (not (eats mouse cat)))

; The rabbit does not see the mouse.
(assert (not (sees rabbit mouse)))

; ==============================================================
; Rules (implications)
; ==============================================================

; If someone is red then they do not eat the bald eagle.
(assert (forall ((x Entity))
  (=> (red x) (not (eats x bald_eagle)))))

; If someone sees the bald eagle and the bald eagle does not see the rabbit
; then they eat the cat.
(assert (forall ((x Entity))
  (=> (and (sees x bald_eagle) (not (sees bald_eagle rabbit)))
      (eats x cat))))

; If the mouse is not rough then the mouse does not eat the cat.
(assert (=> (not (rough mouse))
            (not (eats mouse cat))))

; If someone eats the bald eagle and they do not see the bald eagle
; then they do not visit the rabbit.
(assert (forall ((x Entity))
  (=> (and (eats x bald_eagle) (not (sees x bald_eagle)))
      (not (visits x rabbit)))))

; If someone sees the cat then the cat is rough.
(assert (forall ((x Entity))
  (=> (sees x cat) (rough cat))))

; If someone sees the mouse then they are not blue.
(assert (forall ((x Entity))
  (=> (sees x mouse) (not (blue x)))))

; ==============================================================
; Query: Is the cat rough?
; ==============================================================

(assert (rough cat))

; ==============================================================
; Solve
; ==============================================================

(check-sat)
(get-model)