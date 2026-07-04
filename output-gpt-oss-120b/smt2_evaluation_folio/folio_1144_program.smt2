;--- Declarations -------------------------------------------------
(declare-sort Entity 0)

(declare-fun Red (Entity) Bool)
(declare-fun Apple (Entity) Bool)
(declare-fun Fruit (Entity) Bool)
(declare-fun GrowsInBen (Entity) Bool)
(declare-fun ContainsVitC (Entity) Bool)
(declare-fun Healthy (Entity) Bool)
(declare-fun OnWarningList (Entity) Bool)

(declare-const cherry Entity)

;--- Premises ------------------------------------------------------
; 5. The cherries grow in Ben's yard.
(assert (GrowsInBen cherry))

; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Entity))
  (=> (and (Red x) (Fruit x) (GrowsInBen x))
      (ContainsVitC x))))

; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Entity))
  (=> (and (Apple x) (GrowsInBen x))
      (Red x))))

; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((x Entity))
  (=> (and (Fruit x) (GrowsInBen x) (ContainsVitC x))
      (Healthy x))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Entity))
  (=> (and (Fruit x) (GrowsInBen x) (Healthy x))
      (not (OnWarningList x)))))

; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (Apple cherry)) (not (Healthy cherry)))
            (Red cherry)))

;--- Test the negation of the target statement --------------------
; Negation: cherry is NOT on a warning list AND NOT red.
(assert (and (not (OnWarningList cherry))
             (not (Red cherry))))

;--- Query ---------------------------------------------------------
(check-sat)      ; Expect SAT → the negation is possible
(get-model)