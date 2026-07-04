; Sorts
(declare-sort Fruit 0)

; Predicates
(declare-fun red (Fruit) Bool)
(declare-fun apple (Fruit) Bool)
(declare-fun healthy (Fruit) Bool)
(declare-fun vitaminC (Fruit) Bool)
(declare-fun growsBen (Fruit) Bool)
(declare-fun onWarning (Fruit) Bool)

; Constants
(declare-const cherry Fruit)

; Knowledge base (premises)
(assert (forall ((x Fruit))
  (=> (and (red x) (growsBen x))
      (vitaminC x))))
(assert (forall ((x Fruit))
  (=> (and (apple x) (growsBen x))
      (red x))))
(assert (forall ((x Fruit))
  (=> (and (growsBen x) (vitaminC x))
      (healthy x))))
(assert (forall ((x Fruit))
  (=> (and (growsBen x) (healthy x))
      (not (onWarning x)))))
; The cherries grow in Ben's yard
(assert (growsBen cherry))
; If cherries are not apples and are not healthy, then they are red
(assert (=> (and (not (apple cherry)) (not (healthy cherry)))
            (red cherry)))

; Test scenario: "If the cherries are either healthy or are on a warning list, then they are not red."
(assert (=> (or (healthy cherry) (onWarning cherry))
            (not (red cherry))))

; Verification
(check-sat)
(get-model)