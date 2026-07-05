(declare-sort Person 0)

; Predicates (unary properties)
(declare-fun tumpus (Person) Bool)
(declare-fun rompuse (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun luminous (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun transparent (Person) Bool)
(declare-fun zumpus (Person) Bool)
(declare-fun bitter (Person) Bool)
(declare-fun impuse (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun jompus (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun angry (Person) Bool)
(declare-fun bright (Person) Bool)
(declare-fun happy (Person) Bool)
(declare-fun large (Person) Bool)

; Constant/individual
(declare-const stella Person)

; Knowledge Base
; 1. Every tumpus is not angry
(assert (forall ((x Person)) (=> (tumpus x) (not (angry x)))))
; 2. Tumpuses are rompuses
(assert (forall ((x Person)) (=> (tumpus x) (rompuse x))))
; 3. Every numpus is not bright
(assert (forall ((x Person)) (=> (numpus x) (not (bright x)))))
; 4. Rompuses are not luminous
(assert (forall ((x Person)) (=> (rompuse x) (not (luminous x)))))
; 5. Rompuses are yumpuses
(assert (forall ((x Person)) (=> (rompuse x) (yumpus x))))
; 6. Yumpuses are transparent
(assert (forall ((x Person)) (=> (yumpus x) (transparent x))))
; 7. Yumpuses are zumpuses
(assert (forall ((x Person)) (=> (yumpus x) (zumpus x))))
; 8. Each zumpus is not bitter
(assert (forall ((x Person)) (=> (zumpus x) (not (bitter x)))))
; 9. Zumpuses are impuses
(assert (forall ((x Person)) (=> (zumpus x) (impuse x))))
; 10. Impuses are red
(assert (forall ((x Person)) (=> (impuse x) (red x))))
; 11. Each impus is a dumpus
(assert (forall ((x Person)) (=> (impuse x) (dumpus x))))
; 12. Every dumpus is happy
(assert (forall ((x Person)) (=> (dumpus x) (happy x))))
; 13. Each dumpus is a vumpus
(assert (forall ((x Person)) (=> (dumpus x) (vumpus x))))
; 14. Vumpuses are bright
(assert (forall ((x Person)) (=> (vumpus x) (bright x))))
; 15. Every vumpus is a jompus
(assert (forall ((x Person)) (=> (vumpus x) (jompus x))))
; 16. Each jompus is a large
(assert (forall ((x Person)) (=> (jompus x) (large x))))
; 17. Each jompus is a wumpus
(assert (forall ((x Person)) (=> (jompus x) (wumpus x))))
; 18. Stella is a yumpus
(assert (yumpus stella))

; Test: Is Stella bright?
(assert (bright stella))

(check-sat)
(get-model)