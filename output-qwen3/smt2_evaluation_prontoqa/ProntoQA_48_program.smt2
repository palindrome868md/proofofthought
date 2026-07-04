; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun tumpus (Thing) Bool)
(declare-fun fruity (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun nervous (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun large (Thing) Bool)
(declare-fun rompus (Thing) Bool)
(declare-fun red (Thing) Bool)
(declare-fun vumpus (Thing) Bool)
(declare-fun temperate (Thing) Bool)
(declare-fun jompus (Thing) Bool)
(declare-fun spicy (Thing) Bool)
(declare-fun impus (Thing) Bool)
(declare-fun metallic (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun bright (Thing) Bool)
(declare-fun zumpus (Thing) Bool)
(declare-fun dumpus (Thing) Bool)

; 3. Declare constants
(declare-const sam Thing)

; 4. Assert knowledge base (facts and rules)
; Tumpuses are fruity
(assert (forall ((x Thing)) (=> (tumpus x) (fruity x))))
; Yumpuses are nervous
(assert (forall ((x Thing)) (=> (yumpus x) (nervous x))))
; Yumpuses are numpuses
(assert (forall ((x Thing)) (=> (yumpus x) (numpus x))))
; Each numpus is large
(assert (forall ((x Thing)) (=> (numpus x) (large x))))
; Each numpus is a rompus
(assert (forall ((x Thing)) (=> (numpus x) (rompus x))))
; Each rompus is red
(assert (forall ((x Thing)) (=> (rompus x) (red x))))
; Rompuses are vumpuses
(assert (forall ((x Thing)) (=> (rompus x) (vumpus x))))
; Vumpuses are temperate
(assert (forall ((x Thing)) (=> (vumpus x) (temperate x))))
; Each vumpus is a jompus
(assert (forall ((x Thing)) (=> (vumpus x) (jompus x))))
; Every jompus is spicy
(assert (forall ((x Thing)) (=> (jompus x) (spicy x))))
; Each jompus is an impus
(assert (forall ((x Thing)) (=> (jompus x) (impus x))))
; Impuses are not metallic
(assert (forall ((x Thing)) (=> (impus x) (not (metallic x)))))
; Impuses are wumpuses
(assert (forall ((x Thing)) (=> (impus x) (wumpus x))))
; Each wumpus is bright
(assert (forall ((x Thing)) (=> (wumpus x) (bright x))))
; Wumpuses are zumpuses
(assert (forall ((x Thing)) (=> (wumpus x) (zumpus x))))
; Zumpuses are not fruity
(assert (forall ((x Thing)) (=> (zumpus x) (not (fruity x)))))
; Each zumpus is a dumpus
(assert (forall ((x Thing)) (=> (zumpus x) (dumpus x))))

; Fact: Sam is a vumpus
(assert (vumpus sam))

; 5. Test the statement: Sam is not fruity
(assert (not (fruity sam)))

; 6. Check satisfiability
(check-sat)
(get-model)