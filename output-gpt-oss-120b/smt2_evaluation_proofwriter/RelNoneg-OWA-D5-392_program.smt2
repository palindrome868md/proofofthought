;--- Sorts -------------------------------------------------
(declare-sort Entity 0)

;--- Predicates -------------------------------------------
(declare-fun likes   (Entity Entity) Bool)
(declare-fun chases  (Entity Entity) Bool)
(declare-fun sees    (Entity Entity) Bool)
(declare-fun big     (Entity)       Bool)
(declare-fun rough   (Entity)       Bool)
(declare-fun young   (Entity)       Bool)

;--- Constants (the individuals mentioned) ---------------
(declare-const bald_eagle Entity)
(declare-const mouse      Entity)
(declare-const rabbit     Entity)
(declare-const tiger      Entity)

;--- Facts -------------------------------------------------
(assert (likes bald_eagle mouse))
(assert (likes mouse bald_eagle))
(assert (likes rabbit mouse))
(assert (chases tiger mouse))
(assert (chases tiger rabbit))
(assert (big tiger))
(assert (sees tiger bald_eagle))

;--- Rules ------------------------------------------------
; 1. (rabbit likes tiger ∧ tiger sees bald_eagle) → rabbit rough
(assert (forall ((x Entity) (y Entity) (z Entity))
  (=> (and (likes rabbit tiger)
           (sees tiger bald_eagle))
      (rough rabbit))))

; 2. (someone sees rabbit) → rabbit likes tiger
(assert (forall ((x Entity))
  (=> (sees x rabbit)
      (likes rabbit tiger))))

; 3. (someone likes bald_eagle ∧ bald_eagle likes rabbit) → rabbit big
(assert (forall ((x Entity))
  (=> (and (likes x bald_eagle)
           (likes bald_eagle rabbit))
      (big rabbit))))

; 4. (someone likes bald_eagle) → bald_eagle rough
(assert (forall ((x Entity))
  (=> (likes x bald_eagle)
      (rough bald_eagle))))

; 5. (mouse chases rabbit) → rabbit chases tiger
(assert (=> (chases mouse rabbit)
            (chases rabbit tiger)))

; 6. (rabbit sees bald_eagle) → bald_eagle chases rabbit
(assert (=> (sees rabbit bald_eagle)
            (chases bald_eagle rabbit)))

; 7. (young ∧ chase mouse) → see mouse
(assert (forall ((x Entity))
  (=> (and (young x) (chases x mouse))
      (sees x mouse))))

; 8. (likes mouse ∧ rough) → see rabbit
(assert (forall ((x Entity))
  (=> (and (likes x mouse) (rough x))
      (sees x rabbit))))

;--- Query: "The rabbit does not like the mouse." ----------
; Negate the desired predicate and test consistency
(assert (not (likes rabbit mouse)))

;--- Check -------------------------------------------------
(check-sat)
(get-model)