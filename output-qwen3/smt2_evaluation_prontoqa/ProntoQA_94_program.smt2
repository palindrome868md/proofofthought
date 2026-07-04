; Reasoning Steps:
; 1. Max is a dumpus.
; 2. Dumpuses are rompuses -> Max is a rompus.
; 3. Rompuses are jompuses -> Max is a jompus.
; 4. Jompuses are wumpuses -> Max is a wumpus.
; 5. Wumpuses are zumpuses -> Max is a zumpus.
; 6. Zumpuses are angry -> Max is angry.
; Conclusion: The statement "Max is angry" is True.
; Verification: Assert (is-angry max) and check for satisfiability (sat).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories and properties)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-angry (Entity) Bool)
(declare-fun is-spicy (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-bright (Entity) Bool)

; 3. Declare constants
(declare-const max Entity)

; 4. Assert knowledge base (facts and rules)
; Dumpuses are wooden
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-wooden x))))
; Dumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-rompus x))))
; Rompuses are small
(assert (forall ((x Entity)) (=> (is-rompus x) (is-small x))))
; Rompuses are jompuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-jompus x))))
; Jompuses are orange
(assert (forall ((x Entity)) (=> (is-jompus x) (is-orange x))))
; Jompuses are wumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))
; Each wumpus is earthy
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-earthy x))))
; Each wumpus is a zumpus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-zumpus x))))
; Zumpuses are angry
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-angry x))))
; Zumpuses are vumpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-vumpus x))))
; Tumpuses are not angry
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-angry x)))))
; Vumpuses are not spicy
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-spicy x)))))
; Each vumpus is a yumpus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-yumpus x))))
; Yumpuses are not hot
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-hot x)))))
; Every yumpus is an impus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-impus x))))
; Each impus is bright
(assert (forall ((x Entity)) (=> (is-impus x) (is-bright x))))
; Impuses are numpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-numpus x))))
; Fact: Max is a dumpus
(assert (is-dumpus max))

; 5. Verification: Test if "Max is angry" is true
; We assert the statement and check satisfiability.
; If sat, the statement is consistent/true given the KB.
; If unsat, the statement contradicts the KB (false).
(assert (is-angry max))

; 6. Check satisfiability
(check-sat)
(get-model)