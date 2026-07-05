; Sorts
(declare-sort Thing 0)

; Predicates
(declare-fun nice (Thing) Bool)
(declare-fun round (Thing) Bool)
(declare-fun green (Thing) Bool)
(declare-fun kind (Thing) Bool)
(declare-fun big (Thing) Bool)

; Constants
(declare-const dog Thing)

; Knowledge base
(assert (nice dog))

; If something is round and not nice then it is green
(assert (forall ((x Thing))
  (=> (and (round x) (not (nice x)))
      (green x))))

; If something is kind and big then it is green
(assert (forall ((x Thing))
  (=> (and (kind x) (big x))
      (green x))))

; All big, kind things are green
(assert (forall ((x Thing))
  (=> (and (big x) (kind x))
      (green x))))

; All green things are kind
(assert (forall ((x Thing))
  (=> (green x)
      (kind x))))

; If something is green and kind then it is big
(assert (forall ((x Thing))
  (=> (and (green x) (kind x))
      (big x))))

; If the dog is green then the dog is kind
(assert (=> (green dog) (kind dog)))

; If the dog is nice then the dog is green
(assert (=> (nice dog) (green dog)))

; All nice, kind things are round
(assert (forall ((x Thing))
  (=> (and (nice x) (kind x))
      (round x))))

; Test: The dog is kind
(assert (kind dog))

; Check satisfiability and model
(check-sat)
(get-model)