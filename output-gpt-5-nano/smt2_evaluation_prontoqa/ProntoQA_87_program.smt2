; Define a single domain of discourse
(declare-sort Creature 0)

; Predicates (properties)
(declare-fun Numpus (Creature) Bool)
(declare-fun Dumpus (Creature) Bool)
(declare-fun Fruity (Creature) Bool)
(declare-fun Orange (Creature) Bool)
(declare-fun Yumpus (Creature) Bool)
(declare-fun Nervous (Creature) Bool)
(declare-fun Vumpus (Creature) Bool)
(declare-fun Impus (Creature) Bool)
(declare-fun Sour (Creature) Bool)
(declare-fun Hot (Creature) Bool)
(declare-fun Tumpus (Creature) Bool)
(declare-fun Small (Creature) Bool)
(declare-fun Rompus (Creature) Bool)
(declare-fun Mean (Creature) Bool)
(declare-fun Zumpus (Creature) Bool)
(declare-fun Jompus (Creature) Bool)

; Constant for Alex
(declare-const alex Creature)

; Knowledge base (facts and universal rules)

; 1) If something is a numpus, then it is a dumpus
(assert (forall ((x Creature)) (=> (Numpus x) (Dumpus x))))
; 2) Numpuses are not fruity
(assert (forall ((x Creature)) (=> (Numpus x) (not (Fruity x)))))
; 3) Each dumpus is not orange
(assert (forall ((x Creature)) (=> (Dumpus x) (not (Orange x)))))
; 4) Dumpuses are yumpuses
(assert (forall ((x Creature)) (=> (Dumpus x) (Yumpus x))))
; 5) Yumpuses are nervous
(assert (forall ((x Creature)) (=> (Yumpus x) (Nervous x))))
; 6) Yumpuses are vumpuses
(assert (forall ((x Creature)) (=> (Yumpus x) (Vumpus x))))
; 7) Every impus is sour
(assert (forall ((x Creature)) (=> (Impus x) (Sour x))))
; 8) Every vumpus is hot
(assert (forall ((x Creature)) (=> (Vumpus x) (Hot x))))
; 9) Vumpuses are tumpuses
(assert (forall ((x Creature)) (=> (Vumpus x) (Tumpus x))))
; 10) Each tumpus is small
(assert (forall ((x Creature)) (=> (Tumpus x) (Small x))))
; 11) Tumpuses are rompuses
(assert (forall ((x Creature)) (=> (Tumpus x) (Rompus x))))
; 12) Every rompus is mean
(assert (forall ((x Creature)) (=> (Rompus x) (Mean x))))
; 13) Rompuses are zumpuses
(assert (forall ((x Creature)) (=> (Rompus x) (Zumpus x))))
; 14) Each zumpus is not sour
(assert (forall ((x Creature)) (=> (Zumpus x) (not (Sour x)))))
; 15) Zumpuses are jompuses
(assert (forall ((x Creature)) (=> (Zumpus x) (Jompus x))))

; 16) Alex is a yumpus
(assert (Yumpus alex))

; Test: Is "Alex not sour" true?
; We assert the query and check satisfiability
(assert (not (Sour alex)))

(check-sat)
(get-model)