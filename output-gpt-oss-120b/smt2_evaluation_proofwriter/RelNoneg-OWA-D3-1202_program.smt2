;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicates ----------------------------------------------------
(declare-fun eats   (Entity Entity) Bool)
(declare-fun sees   (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)

(declare-fun cold   (Entity) Bool)
(declare-fun kind   (Entity) Bool)
(declare-fun rough  (Entity) Bool)
(declare-fun young  (Entity) Bool)
(declare-fun big    (Entity) Bool)

;--- Constants -----------------------------------------------------
(declare-const bald_eagle Entity)
(declare-const mouse      Entity)
(declare-const rabbit     Entity)

;--- Facts ---------------------------------------------------------
(assert (eats   bald_eagle mouse))
(assert (sees   bald_eagle mouse))
(assert (sees   bald_eagle rabbit))
(assert (visits bald_eagle mouse))

(assert (eats   mouse bald_eagle))
(assert (eats   mouse rabbit))
(assert (sees   mouse bald_eagle))
(assert (visits mouse rabbit))

(assert (eats   rabbit bald_eagle))
(assert (cold   rabbit))
(assert (kind   rabbit))
(assert (rough  rabbit))
(assert (young  rabbit))
(assert (sees   rabbit bald_eagle))
(assert (sees   rabbit mouse))
(assert (visits rabbit bald_eagle))

;--- Rules ---------------------------------------------------------
; If something visits the rabbit then it is young.
(assert (forall ((x Entity))
  (=> (visits x rabbit) (young x))))

; If something sees the mouse then the mouse visits the bald eagle.
(assert (forall ((x Entity))
  (=> (sees x mouse) (visits mouse bald_eagle))))

; Big things are cold.
(assert (forall ((x Entity))
  (=> (big x) (cold x))))

; If something sees the rabbit then it visits the rabbit.
(assert (forall ((x Entity))
  (=> (sees x rabbit) (visits x rabbit))))

; Young things are cold.
(assert (forall ((x Entity))
  (=> (young x) (cold x))))

; If something sees the mouse and it visits the mouse then the mouse eats the rabbit.
(assert (forall ((x Entity))
  (=> (and (sees x mouse) (visits x mouse)) (eats mouse rabbit))))

; If something sees the mouse then the mouse is big.
(assert (forall ((x Entity))
  (=> (sees x mouse) (big mouse))))

; If something visits the mouse and the mouse is rough then it eats the mouse.
(assert (forall ((x Entity))
  (=> (and (visits x mouse) (rough mouse)) (eats x mouse))))

;--- Query ---------------------------------------------------------
; The mouse does NOT eat the bald eagle.
(assert (not (eats mouse bald_eagle)))

;--- Check ----------------------------------------------------------
(check-sat)
(get-model)