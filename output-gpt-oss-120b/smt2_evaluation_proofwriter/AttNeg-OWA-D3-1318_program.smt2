;--- Sort declaration -------------------------------------------------
(declare-sort Thing 0)

;--- Predicate declarations -------------------------------------------
(declare-fun big   (Thing) Bool)
(declare-fun round (Thing) Bool)
(declare-fun green (Thing) Bool)
(declare-fun cold  (Thing) Bool)
(declare-fun red   (Thing) Bool)
(declare-fun white (Thing) Bool)
(declare-fun quiet (Thing) Bool)

;--- Constant (object) declarations ------------------------------------
(declare-const bob     Thing)
(declare-const charlie Thing)
(declare-const erin    Thing)
(declare-const harry   Thing)

;--- Facts -------------------------------------------------------------
(assert (cold bob))
(assert (quiet charlie))
(assert (quiet erin))
(assert (big harry))

;--- Rules -------------------------------------------------------------
; All big, round things are green.
(assert (forall ((x Thing))
  (=> (and (big x) (round x)) (green x))))

; Cold, red things are green.
(assert (forall ((x Thing))
  (=> (and (cold x) (red x)) (green x))))

; White, cold things are big.
(assert (forall ((x Thing))
  (=> (and (white x) (cold x)) (big x))))

; Cold things are big.
(assert (forall ((x Thing))
  (=> (cold x) (big x))))

; If something is big then it is red.
(assert (forall ((x Thing))
  (=> (big x) (red x))))

; If something is red and not white then it is not round.
(assert (forall ((x Thing))
  (=> (and (red x) (not (white x))) (not (round x)))))

;--- Test the statement: "Harry is not big." ------------------------
(assert (not (big harry)))   ; the claim we are checking

;--- Solving -----------------------------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)