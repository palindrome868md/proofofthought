; Sorts
(declare-sort Person 0)

; Constants
(declare-const wren Person)

; Predicates (relationships and properties)
(declare-fun is-jompus (Person) Bool)
(declare-fun is-wumpus (Person) Bool)
(declare-fun is-zumpus (Person) Bool)
(declare-fun is-temperate (Person) Bool)
(declare-fun is-tumpus (Person) Bool)
(declare-fun is-brown (Person) Bool)
(declare-fun is-yumpus (Person) Bool)
(declare-fun is-wooden (Person) Bool)
(declare-fun is-dumpus (Person) Bool)
(declare-fun is-numpus (Person) Bool)
(declare-fun is-dull (Person) Bool)
(declare-fun is-vumpus (Person) Bool)
(declare-fun is-angry (Person) Bool)
(declare-fun is-small (Person) Bool)

; Rules (translations of the statements)
; 1. Each jompus is not small
(assert (forall ((p Person)) (=> (is-jompus p) (not (is-small p)))))

; 2. Each wumpus is angry
(assert (forall ((p Person)) (=> (is-wumpus p) (is-angry p))))

; 3. Each jompus is a zumpus
(assert (forall ((p Person)) (=> (is-jompus p) (is-zumpus p))))

; 4. Zumpuses are temperate
(assert (forall ((p Person)) (=> (is-zumpus p) (is-temperate p))))

; 5. Zumpuses are tumpuses
(assert (forall ((p Person)) (=> (is-zumpus p) (is-tumpus p))))

; 6. Tumpuses are brown
(assert (forall ((p Person)) (=> (is-tumpus p) (is-brown p))))

; 7. Tumpuses are yumpuses
(assert (forall ((p Person)) (=> (is-tumpus p) (is-yumpus p))))

; 8. Yumpuses are wooden
(assert (forall ((p Person)) (=> (is-yumpus p) (is-wooden p))))

; 9. Yumpuses are dumpuses
(assert (forall ((p Person)) (=> (is-yumpus p) (is-dumpus p))))

; 10. Each dumpus is not angry
(assert (forall ((p Person)) (=> (is-dumpus p) (not (is-angry p)))))

; 11. Every dumpus is a numpus
(assert (forall ((p Person)) (=> (is-dumpus p) (is-numpus p))))

; 12. Numpuses are not dull
(assert (forall ((p Person)) (=> (is-numpus p) (not (is-dull p)))))

; 13. Every numpus is a vumpus
(assert (forall ((p Person)) (=> (is-numpus p) (is-vumpus p))))

; 14. Wren is a jompus
(assert (is-jompus wren))

; (Optional: ensure jompus implies not small already captured above)

; 15. Test: Wren is not angry (the statement to verify)
(assert (not (is-angry wren)))

; Check satisfiability and provide a model if SAT
(check-sat)
(get-model)