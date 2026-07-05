; Declare sorts
(declare-sort Person 0)

; Declare predicates (uninterpreted)
(declare-fun Rompus (Person) Bool)
(declare-fun Amenable (Person) Bool)
(declare-fun Numpus (Person) Bool)
(declare-fun Brown (Person) Bool)
(declare-fun Zumpus (Person) Bool)
(declare-fun Bright (Person) Bool)
(declare-fun Vumpus (Person) Bool)
(declare-fun Dumpus (Person) Bool)
(declare-fun Sweet (Person) Bool)
(declare-fun Yumpus (Person) Bool)
(declare-fun Nervous (Person) Bool)
(declare-fun Jompus (Person) Bool)
(declare-fun Impuse (Person) Bool)
(declare-fun Tumpus (Person) Bool)
(declare-fun Transparent (Person) Bool)
(declare-fun Wumpus (Person) Bool)
(declare-fun Liquid (Person) Bool)
(declare-fun Small (Person) Bool)

; Declare constants / individuals
(declare-const max Person)

; Knowledge base (facts and universal rules)
; Max is a rompus
(assert (Rompus max))

; 1. Rompuses are amenable
(assert (forall ((x Person)) (=> (Rompus x) (Amenable x))))

; 2. Rompuses are numpuses
(assert (forall ((x Person)) (=> (Rompus x) (Numpus x))))

; 3. Numpuses are brown
(assert (forall ((x Person)) (=> (Numpus x) (Brown x))))

; 4. Numpuses are zumpuses
(assert (forall ((x Person)) (=> (Numpus x) (Zumpus x))))

; 5. Every zumpus is bright
(assert (forall ((x Person)) (=> (Zumpus x) (Bright x))))

; 6. Every zumpus is a dumpus
(assert (forall ((x Person)) (=> (Zumpus x) (Dumpus x))))

; 7. Every dumpus is sweet
(assert (forall ((x Person)) (=> (Dumpus x) (Sweet x))))

; 8. Dumpuses are yumpuses
(assert (forall ((x Person)) (=> (Dumpus x) (Yumpus x))))

; 9. Every yumpus is not nervous
(assert (forall ((x Person)) (=> (Yumpus x) (not (Nervous x)))))

; 10. Yumpuses are jompuses
(assert (forall ((x Person)) (=> (Yumpus x) (Jompus x))))

; 11. Jompuses are not liquid
(assert (forall ((x Person)) (=> (Jompus x) (not (Liquid x)))))

; 12. Jompuses are impuses
(assert (forall ((x Person)) (=> (Jompus x) (Impuse x))))

; 13. Impuses are not small
(assert (forall ((x Person)) (=> (Impuse x) (not (Small x)))))

; 14. Each impus is a tumpus
(assert (forall ((x Person)) (=> (Impuse x) (Tumpus x))))

; 15. Tumpuses are not transparent
(assert (forall ((x Person)) (=> (Tumpus x) (not (Transparent x)))))

; 16. Tumpuses are wumpuses
(assert (forall ((x Person)) (=> (Tumpus x) (Wumpus x))))

; Test: Is "Max not nervous" true?
; Assert the scenario to test the statement (the query is: Max is not Nervous)
(assert (not Nervous max))

; Check satisfiability
(check-sat)
(get-model)