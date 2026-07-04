; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-fruity (Thing) Bool)

; 3. Declare constants
(declare-const Fae Thing)

; 4. Assert knowledge base (facts and rules)
; Rule: Zumpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-wumpus x))))
; Rule: Wumpuses are yumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-yumpus x))))
; Rule: Every yumpus is a numpus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-numpus x))))
; Rule: Each numpus is a vumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-vumpus x))))
; Rule: Vumpuses are fruity
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-fruity x))))

; Fact: Fae is a zumpus
(assert (is-zumpus Fae))

; 5. Test the statement: "Fae is not fruity"
; We assert the negation of "Fae is fruity" to check if it is consistent with the KB.
(assert (not (is-fruity Fae)))

; 6. Check satisfiability
; Expected: unsat (The statement contradicts the knowledge base, so it is False)
(check-sat)
(get-model)