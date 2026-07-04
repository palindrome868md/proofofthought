;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun redFruit        (Entity) Bool)   ; “is a red fruit”
(declare-fun apple          (Entity) Bool)   ; “is an apple”
(declare-fun fruit          (Entity) Bool)   ; “is a fruit”
(declare-fun growsInBenYard (Entity) Bool)   ; “grows in Ben's yard”
(declare-fun containsVitC   (Entity) Bool)   ; “contains some Vitamin C”
(declare-fun healthy        (Entity) Bool)   ; “is healthy”
(declare-fun onWarningList  (Entity) Bool)   ; “is on a warning list”

;--- Constant for the cherries -----------------------------------------
(declare-const cherry Entity)

;--- Knowledge base (the premises) -------------------------------------

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

; 5. The cherries grow in Ben's yard.  (and they are fruits)
(assert (growsInBenYard cherry))
(assert (fruit cherry))

; 6. If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (apple cherry)) (not (healthy cherry)))
            (redFruit cherry)))

;--- Test the statement -----------------------------------------------
; Statement:  containsVitC(cherry) ∨ onWarningList(cherry)
; Negate it:   ¬containsVitC(cherry) ∧ ¬onWarningList(cherry)
(assert (and (not (containsVitC cherry))
             (not (onWarningList cherry))))

;--- Check satisfiability ---------------------------------------------
(check-sat)   ; SAT means the negated statement is consistent ⇒ original statement is NOT entailed (i.e., false)
(get-model)