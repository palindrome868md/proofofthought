;--- Sort declaration -------------------------------------------------
(declare-sort Obj 0)

;--- Predicate (boolean function) declarations -------------------------
(declare-fun red (Obj) Bool)
(declare-fun apple (Obj) Bool)
(declare-fun fruit (Obj) Bool)
(declare-fun growsInBen (Obj) Bool)
(declare-fun containsVitC (Obj) Bool)
(declare-fun healthy (Obj) Bool)
(declare-fun warning (Obj) Bool)

;--- Constant for the cherries -----------------------------------------
(declare-const cherry Obj)

;--- Premises ----------------------------------------------------------

; 1. All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Obj))
  (=> (and (red x) (growsInBen x))
      (containsVitC x))))

; 2. All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Obj))
  (=> (and (apple x) (growsInBen x))
      (red x))))

; 3. All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((x Obj))
  (=> (and (fruit x) (growsInBen x) (containsVitC x))
      (healthy x))))

; 4. No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Obj))
  (=> (and (fruit x) (growsInBen x) (healthy x))
      (not (warning x)))))

; 5. The cherries grow in Ben's yard.
(assert (growsInBen cherry))

; 5b. (World‑knowledge) Cherries are fruits.
(assert (fruit cherry))

; 6. If the cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (apple cherry)) (not (healthy cherry)))
            (red cherry)))

;--- Negation of the statement to be tested ---------------------------
; Statement: (warning(cherry) ∨ red(cherry)) → (¬healthy(cherry) ∧ ¬containsVitC(cherry))
; Negation: (warning(cherry) ∨ red(cherry)) ∧ (healthy(cherry) ∨ containsVitC(cherry))
(assert (and (or (warning cherry) (red cherry))
             (or (healthy cherry) (containsVitC cherry))))

;--- Check satisfiability ---------------------------------------------
(check-sat)
(get-model)