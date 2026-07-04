;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun redFruit      (Entity) Bool)   ; x is a red fruit
(declare-fun apple         (Entity) Bool)   ; x is an apple
(declare-fun fruit         (Entity) Bool)   ; x is a fruit
(declare-fun growsInBenYard(Entity) Bool)   ; x grows in Ben's yard
(declare-fun containsVitC  (Entity) Bool)   ; x contains some Vitamin C
(declare-fun healthy       (Entity) Bool)   ; x is healthy
(declare-fun onWarningList (Entity) Bool)   ; x is on a warning list

;--- Constant ---------------------------------------------------------
(declare-const cherries Entity)

;--- Premises ----------------------------------------------------------

; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Entity))
  (=> (and (redFruit x) (growsInBenYard x))
      (containsVitC x))))

; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Entity))
  (=> (and (apple x) (growsInBenYard x))
      (redFruit x))))

; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((x Entity))
  (=> (and (fruit x) (growsInBenYard x) (containsVitC x))
      (healthy x))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Entity))
  (=> (and (fruit x) (growsInBenYard x) (healthy x))
      (not (onWarningList x)))))

; 5. The cherries grow in Ben's yard.
(assert (growsInBenYard cherries))

; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (apple cherries)) (not (healthy cherries)))
            (redFruit cherries)))

;--- Statement to verify -----------------------------------------------
; The cherries are apples.
(assert (apple cherries))

;--- Check consistency -------------------------------------------------
(check-sat)
(get-model)