; Sorts
(declare-sort Object 0)

; Constants
(declare-const Charlie Object)

; Predicates
(declare-fun round (Object) Bool)
(declare-fun blue (Object) Bool)
(declare-fun rough (Object) Bool)
(declare-fun green (Object) Bool)
(declare-fun red (Object) Bool)
(declare-fun smart (Object) Bool)

; Knowledge base
(assert (round Charlie))

; All blue, smart things are red
(assert (forall ((x Object))
  (=> (and (blue x) (smart x)) (red x))))

; Blue, rough things are round
(assert (forall ((x Object))
  (=> (and (blue x) (rough x)) (round x))))

; If something is green then it is red
(assert (forall ((x Object))
  (=> (green x) (red x))))

; If Charlie is rough then Charlie is green
(assert (=> (rough Charlie) (green Charlie)))

; All round things are smart
(assert (forall ((x Object))
  (=> (round x) (smart x))))

; All smart, red things are blue
(assert (forall ((x Object))
  (=> (and (smart x) (red x)) (blue x))))

; If something is blue and round then it is smart
(assert (forall ((x Object))
  (=> (and (blue x) (round x)) (smart x))))

; All smart things are rough
(assert (forall ((x Object))
  (=> (smart x) (rough x))))

; Test scenario: Charlie is not green
(assert (not (green Charlie)))

; Check satisfiability
(check-sat)
(get-model)