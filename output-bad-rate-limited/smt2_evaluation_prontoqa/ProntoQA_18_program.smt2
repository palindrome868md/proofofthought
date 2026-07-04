; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun dumpus (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun aggressive (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun brown (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun temperate (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun metallic (Person) Bool)
(declare-fun jompus (Person) Bool
)
(declare-fun tumpus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun fruity (Person) Bool)
(declare-fun impus (Person) Bool)
(declare-fun sour (Person) Bool)
(declare-fun opaque (Person) Bool)
(declare-fun bright (Person) Bool)

; Constants
(declare-const sam Person)

; Knowledge base (universal rules)
; 1) Each dumpus is bright
(assert (forall ((x Person)) (=> (dumpus x) (bright x))))
; 2) Each dumpus is a rompus
(assert (forall ((x Person)) (=> (dumpus x) (rompus x))))
; 3) Every rompus is aggressive
(assert (forall ((x Person)) (=> (rompus x) (aggressive x))))
; 4) Every rompus is a yumpus
(assert (forall ((x Person)) (=> (rompus x) (yumpus x))))
; 5) Yumpuses are brown
(assert (forall ((x Person)) (=> (yumpus x) (brown x))))
; 6) Yumpuses are vumpuses
(assert (forall ((x Person)) (=> (yumpus x) (vumpus x))))
; 7) Every impus is fruity
(assert (forall ((x Person)) (=> (impus x) (fruity x))))
; 8) Every vumpus is sour
(assert (forall ((x Person)) (=> (vumpus x) (sour x))))
; 9) Every vumpus is a numpus
(assert (forall ((x Person)) (=> (vumpus x) (numpus x))))
; 10) Every numpus is not temperate
(assert (forall ((x Person)) (=> (numpus x) (not (temperate x)))))
; 11) Every numpus is a zumpus
(assert (forall ((x Person)) (=> (numpus x) (zumpus x))))
; 12) Zumpuses are metallic
(assert (forall ((x Person)) (=> (zumpus x) (metallic x))))
; 13) Zumpuses are jompuses
(assert (forall ((x Person)) (=> (zumpus x) (jompus x))))
; 14) Each jompus is not fruity
(assert (forall ((x Person)) (=> (jompus x) (not (fruity x)))))
; 15) Jompuses are tumpuses
(assert (forall ((x Person)) (=> (jompus x) (tumpus x))))
; 16) Tumpuses are opaque
(assert (forall ((x Person)) (=> (tumpus x) (opaque x))))
; 17) Every tumpus is a wumpus
(assert (forall ((x Person)) (=> (tumpus x) (wumpus x))))
; 18) Sam is a yumpus
(assert (yumpus sam))

; Test: Is Sam fruity?
(assert (fruity sam))

; Check satisfiability
(check-sat)