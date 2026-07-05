; Declare sorts
(declare-sort Person 0)

; Declare unary predicates (properties)
(declare-fun zumpus (Person) Bool)
(declare-fun nervous (Person) Bool)
(declare-fun dumpus (Person) Bool)
(declare-fun large (Person) Bool)
(declare-fun rompus (Person) Bool)
(declare-fun brown (Person) Bool)
(declare-fun vumpus (Person) Bool)
(declare-fun transparent (Person) Bool)
(declare-fun numpus (Person) Bool)
(declare-fun bitter (Person) Bool)
(declare-fun wumpus (Person) Bool)
(declare-fun floral (Person) Bool)
(declare-fun yumpus (Person) Bool)
(declare-fun tumpus (Person) Bool)
(declare-fun impus (Person) Bool)

; Declare constants
(declare-const wren Person)

; Knowledge base (facts and rules)

; 1. Zumpuses imply nervous and dumpus
(assert (forall ((x Person)) (=> (zumpus x) (nervous x))))
(assert (forall ((x Person)) (=> (zumpus x) (dumpus x))))

; 2. Every zumpus is a dumpus (explicit already by above, kept for completeness)
(assert (forall ((x Person)) (=> (zumpus x) (dumpus x))))

; 3. Every dumpus is a rompuses
;    (Note: represented as the predicate rompus)
(assert (forall ((x Person)) (=> (dumpus x) (rompus x))))

; 4. Every rompus is a numpus
(assert (forall ((x Person)) (=> (rompus x) (numpus x))))

; 5. Numpuses are not bitter
(assert (forall ((x Person)) (=> (numpus x) (not (bitter x)))))

; 6. Numpuses are wumpuses
(assert (forall ((x Person)) (=> (numpus x) (wumpus x))))

; 7. Every wumpus is floral
(assert (forall ((x Person)) (=> (wumpus x) (floral x))))

; 8. Every wumpus is a yumpus
(assert (forall ((x Person)) (=> (wumpus x) (yumpus x))))

; 9. Every yumpus is not transparent
(assert (forall ((x Person)) (=> (yumpus x) (not (transparent x)))))

; 10. Yumpuses are tumpuses
(assert (forall ((x Person)) (=> (yumpus x) (tumpus x))))

; 11. Tumpuses are not bright
(assert (forall ((x Person)) (=> (tumpus x) (not (bright x)))))

; 12. Every tumpus is an impus
(assert (forall ((x Person)) (=> (tumpus x) (impus x))))

; 13. Dumpuses are rompuses (redundant with 3, kept for clarity)
(assert (forall ((x Person)) (=> (dumpus x) (rompus x))))

; 14. Every rompus is a brown
(assert (forall ((x Person)) (=> (rompus x) (brown x))))

; 15. Vumpuses are transparent
(assert (forall ((x Person)) (=> (vumpus x) (transparent x))))

; Fact: Wren is a dumpus
(assert (dumpus wren))

; Question under test: "Wren is not transparent."
; Test by asserting the statement and evaluating satisfiability
(assert (not (transparent wren)))

; Check satisfiability and provide a model if one exists
(check-sat)
(get-model)