; Define a general domain for all objects
(declare-sort Thing 0)

; Constants (the bear, mouse, tiger, squirrel)
(declare-const bear Thing)
(declare-const mouse Thing)
(declare-const tiger Thing)
(declare-const squirrel Thing)

; Predicates
(declare-fun sees (Thing Thing) Bool)
(declare-fun visits (Thing Thing) Bool)
(declare-fun eats (Thing Thing) Bool)
(declare-fun big (Thing) Bool)
(declare-fun round (Thing) Bool)
(declare-fun cold (Thing) Bool)
(declare-fun green (Thing) Bool)
(declare-fun rough (Thing) Bool)

; Knowledge base (given facts)
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

; Rules
; If something eats the squirrel then the squirrel is not green
(assert (forall ((x Thing))
  (=> (eats x squirrel) (not (green squirrel)))))

; If something sees the bear and the bear sees the mouse then it visits the tiger
(assert (forall ((x Thing))
  (=> (and (sees x bear) (sees bear mouse)) (visits x tiger))))

; If something sees the squirrel then it is not rough
(assert (forall ((x Thing))
  (=> (sees x squirrel) (not (rough x)))))

; If something is round and big then it sees the bear
(assert (forall ((x Thing))
  (=> (and (round x) (big x)) (sees x bear))))

; If something visits the tiger then it sees the squirrel
(assert (forall ((x Thing))
  (=> (visits x tiger) (sees x squirrel))))

; If something visits the squirrel and it visits the tiger then the squirrel eats the mouse
(assert (=> (exists ((x Thing))
           (and (visits x squirrel) (visits x tiger)))
           (eats squirrel mouse)))

; If something visits the bear and it eats the mouse then the mouse sees the bear
(assert (forall ((x Thing))
  (=> (and (visits x bear) (eats x mouse))
      (sees mouse bear))))

; If something eats the mouse and the mouse is not round then it is not cold
(assert (forall ((x Thing))
  (=> (and (eats x mouse) (not (round mouse)))
      (not (cold x)))))

; Test question: "The mouse does not visit the tiger."
(assert (not (visits mouse tiger)))

; Check satisfiability of the scenario
(check-sat)