; Sort
(declare-sort Thing 0)

; Predicates
(declare-fun dull       (Thing) Bool)
(declare-fun tumpus      (Thing) Bool)
(declare-fun jompus      (Thing) Bool)
(declare-fun vumpus      (Thing) Bool)
(declare-fun sour        (Thing) Bool)
(declare-fun feisty      (Thing) Bool)
(declare-fun dumpus      (Thing) Bool)
(declare-fun yumpus      (Thing) Bool)
(declare-fun transparent  (Thing) Bool)
(declare-fun numpus       (Thing) Bool)
(declare-fun zumpus       (Thing) Bool)
(declare-fun orange       (Thing) Bool)
(declare-fun rompus       (Thing) Bool)
(declare-fun earthy        (Thing) Bool)
(declare-fun impus        (Thing) Bool)
(declare-fun amenable      (Thing) Bool)
(declare-fun wumpus       (Thing) Bool)
(declare-fun cold         (Thing) Bool)

; Constant
(declare-const wren Thing)

; Facts
(assert (vumpus wren))

; Rules (grounded on Wren)
(assert (=> (tumpus wren) (dull wren)))
(assert (=> (tumpus wren) (jompus wren)))
(assert (=> (jompus wren) (not (sour wren))))
(assert (=> (jompus wren) (vumpus wren)))
(assert (=> (vumpus wren) (feisty wren)))
(assert (=> (vumpus wren) (dumpus wren)))
(assert (=> (dumpus wren) (cold wren)))
(assert (=> (dumpus wren) (yumpus wren)))
(assert (=> (yumpus wren) (transparent wren)))
(assert (=> (yumpus wren) (numpus wren)))
(assert (=> (numpus wren) (not amenable wren)))
(assert (=> (numpus wren) (zumpus wren)))
(assert (=> (zumpus wren) (orange wren)))
(assert (=> (zumpus wren) (rompus wren)))
(assert (=> (rompus wren) (earthy wren)))
(assert (=> (rompus wren) (wumpus wren)))
(assert (=> (impus wren) (not (orange wren))))

; Query: Wren is not orange
(assert (not (orange wren)))

(check-sat)
(get-model)