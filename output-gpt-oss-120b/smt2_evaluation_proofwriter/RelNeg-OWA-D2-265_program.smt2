;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations -------------------------------------------
(declare-fun nice  (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun kind  (Entity) Bool)
(declare-fun big   (Entity) Bool)

;--- Constant for the dog ---------------------------------------------
(declare-const dog Entity)

;--- Knowledge base ----------------------------------------------------
; Fact: the dog is nice
(assert (nice dog))

; Rule: round ∧ ¬nice → green
(assert (forall ((x Entity))
  (=> (and (round x) (not (nice x))) (green x))))

; Rule: kind ∧ big → green   (explicit)
(assert (forall ((x Entity))
  (=> (and (kind x) (big x)) (green x))))

; Rule: all big & kind things are green   (duplicate of above, kept for completeness)
(assert (forall ((x Entity))
  (=> (and (big x) (kind x)) (green x))))

; Rule: green → kind
(assert (forall ((x Entity))
  (=> (green x) (kind x))))

; Rule: green ∧ kind → big
(assert (forall ((x Entity))
  (=> (and (green x) (kind x)) (big x))))

; Rule: if the dog is green then the dog is kind
(assert (=> (green dog) (kind dog)))

; Rule: if the dog is nice then the dog is green
(assert (=> (nice dog) (green dog)))

; Rule: nice ∧ kind → round
(assert (forall ((x Entity))
  (=> (and (nice x) (kind x)) (round x))))

;--- Query: is the dog kind? -----------------------------------------
(assert (kind dog))

;--- Check the model ---------------------------------------------------
(check-sat)
(get-model)