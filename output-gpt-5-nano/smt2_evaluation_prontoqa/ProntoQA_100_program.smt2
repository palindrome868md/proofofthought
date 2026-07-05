; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const alex Person)

; Predicates (uninterpreted)
(declare-fun Vumpus (Person) Bool)
(declare-fun Tumpus (Person) Bool)
(declare-fun Dumpus (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Jompus (Person) Bool)
(declare-fun Wumpus (Person) Bool)
(declare-fun Rompus (Person) Bool)
(declare-fun Yumpus (Person) Bool)
(declare-fun Zumpus (Person) Bool)
(declare-fun Impuse (Person) Bool)
(declare-fun Sour (Person) Bool)
(declare-fun Bright (Person) Bool)
(declare-fun Large (Person) Bool)
(declare-fun Angry (Person) Bool)
(declare-fun Metallic (Person) Bool)
(declare-fun Blue (Person) Bool)
(declare-fun Shy (Person) Bool)
(declare-fun Opaque (Person) Bool)

; Knowledge base (facts and universal rules)

; Vumpuses have properties
(assert (forall ((x Person)) (=> (Vumpus x) (Sour x))))
(assert (forall ((x Person)) (=> (Vumpus x) (Tumpus x))))

; Tumpuses properties
(assert (forall ((x Person)) (=> (Tumpus x) (Bright x))))
; Each tumpus is a dumpus
(assert (forall ((x Person)) (=> (Tumpus x) (Dumpus x))))

; Dumpuses properties
(assert (forall ((x Person)) (=> (Dumpus x) (not (Large x)))))
; Dumpuses are numpuses
(assert (forall ((x Person)) (=> (Dumpus x) (Numpus x))))

; Numpuses properties
(assert (forall ((x Person)) (=> (Numpus x) (Metallic x))))
; Each numpus is a jompus
(assert (forall ((x Person)) (=> (Numpus x) (Jompus x))))

; Jompuses properties
(assert (forall ((x Person)) (=> (Jompus x) (not (Angry x)))))
; Jompuses are wumpuses
(assert (forall ((x Person)) (=> (Jompus x) (Wumpus x))))

; Wumpuses properties
(assert (forall ((x Person)) (=> (Wumpus x) (not (Shy x)))))
; Wumpuses are rompuses
(assert (forall ((x Person)) (=> (Wumpus x) (Rompus x))))

; Rompuses properties
(assert (forall ((x Person)) (=> (Rompus x) (not (Opaque x)))))
; Rompuses are yumpuses
(assert (forall ((x Person)) (=> (Rompus x) (Yumpus x))))

; Zumpuses constraint
(assert (forall ((x Person)) (=> (Zumpus x) (not (Blue x)))))

; Yumpuses properties
(assert (forall ((x Person)) (=> (Yumpus x) (Blue x))))
(assert (forall ((x Person)) (=> (Yumpus x) (Impuse x))))

; Alex is a numpus (provided fact)
(assert (Numpus alex))

; Test: Is Alex blue?
; We test the negation to see if it leads to contradiction
(assert (not (Blue alex)))

; Check satisfiability
(check-sat)
(get-model)