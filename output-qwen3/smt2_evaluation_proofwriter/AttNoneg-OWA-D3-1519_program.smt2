; Declare sort
(declare-sort Thing 0)

; Declare predicates
(declare-fun is-round (Thing) Bool)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-white (Thing) Bool)
(declare-fun is-young (Thing) Bool)
(declare-fun is-green (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-big (Thing) Bool)

; Declare constants
(declare-const bob Thing)
(declare-const charlie Thing)

; Knowledge base - Direct facts
(assert (is-round bob))
(assert (is-smart bob))
(assert (is-white bob))
(assert (is-young bob))
(assert (is-green charlie))
(assert (is-smart charlie))
(assert (is-white charlie))

; Knowledge base - Rules
; Red things are big
(assert (forall ((x Thing))
  (=> (is-red x) (is-big x))))

; If Bob is red then Bob is white
(assert (=> (is-red bob) (is-white bob)))

; Young, red things are white
(assert (forall ((x Thing))
  (=> (and (is-young x) (is-red x))
      (is-white x))))

; All white things are green
(assert (forall ((x Thing))
  (=> (is-white x) (is-green x))))

; If Bob is green then Bob is red
(assert (=> (is-green bob) (is-red bob)))

; All smart things are green
(assert (forall ((x Thing))
  (=> (is-smart x) (is-green x))))

; Test: Bob is smart (verify this statement)
(assert (is-smart bob))

; Check satisfiability
(check-sat)
(get-model)