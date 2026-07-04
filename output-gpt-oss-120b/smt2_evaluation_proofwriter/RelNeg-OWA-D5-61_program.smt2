;--- Sorts -------------------------------------------------
(declare-sort Entity 0)

;--- Predicates --------------------------------------------
(declare-fun sees (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)

(declare-fun cold (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun big (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun rough (Entity) Bool)

;--- Constants --------------------------------------------
(declare-const bear Entity)
(declare-const mouse Entity)
(declare-const squirrel Entity)
(declare-const tiger Entity)

;--- Facts -------------------------------------------------
(assert (sees bear mouse))
(assert (not (sees bear tiger)))
(assert (visits bear squirrel))
(assert (visits bear tiger))

(assert (not (eats mouse tiger)))
(assert (cold mouse))
(assert (green mouse))
(assert (visits mouse squirrel))

(assert (cold squirrel))
(assert (visits squirrel bear))
(assert (visits squirrel mouse))

(assert (eats tiger mouse))
(assert (big tiger))
(assert (sees tiger bear))
(assert (sees tiger mouse))
(assert (not (visits tiger mouse)))

;--- Rules ------------------------------------------------
; 1. If something eats the squirrel then the squirrel is not green.
(assert
  (forall ((x Entity))
    (=> (eats x squirrel)
        (not (green squirrel)))))

; 2. If something sees the bear and the bear sees the mouse then it visits the tiger.
(assert
  (forall ((x Entity))
    (=> (and (sees x bear) (sees bear mouse))
        (visits x tiger))))

; 3. If something sees the squirrel then it is not rough.
(assert
  (forall ((x Entity))
    (=> (sees x squirrel)
        (not (rough x)))))

; 4. If something is round and big then it sees the bear.
(assert
  (forall ((x Entity))
    (=> (and (round x) (big x))
        (sees x bear))))

; 5. If something visits the tiger then it sees the squirrel.
(assert
  (forall ((x Entity))
    (=> (visits x tiger)
        (sees x squirrel))))

; 6. If something visits the squirrel and it visits the tiger then the squirrel eats the mouse.
(assert
  (forall ((x Entity))
    (=> (and (visits x squirrel) (visits x tiger))
        (eats squirrel mouse))))

; 7. If something visits the bear and it eats the mouse then the mouse sees the bear.
(assert
  (forall ((x Entity))
    (=> (and (visits x bear) (eats x mouse))
        (sees mouse bear))))

; 8. If something eats the mouse and the mouse is not round then it is not cold.
(assert
  (forall ((x Entity))
    (=> (and (eats x mouse) (not (round mouse)))
        (not (cold x)))))

;--- Verification -----------------------------------------
; Test the claim: "The mouse does not visit the tiger."
; We assert the opposite (that it does visit) and check satisfiability.
(assert (visits mouse tiger))

(check-sat)
(get-model)