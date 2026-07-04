; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)

(declare-fun is-spicy (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-angry (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)

; 3. Declare constants
(declare-const sally Thing)

; 4. Assert knowledge base (facts and rules)

; Rule: Zumpuses are not spicy
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-spicy x)))))

; Rule: Each yumpus is cold
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-cold x))))

; Rule: Yumpuses are impuses
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-impus x))))

; Rule: Every impus is red
(assert (forall ((x Thing)) (=> (is-impus x) (is-red x))))

; Rule: Impuses are jompuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-jompus x))))

; Rule: Every jompus is not feisty
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-feisty x)))))

; Rule: Every jompus is a rompus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-rompus x))))

; Rule: Rompuses are angry
(assert (forall ((x Thing)) (=> (is-rompus x) (is-angry x))))

; Rule: Each rompus is a wumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-wumpus x))))

; Rule: Each wumpus is spicy
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-spicy x))))

; Rule: Wumpuses are vumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-vumpus x))))

; Rule: Vumpuses are not small
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-small x)))))

; Rule: Vumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-numpus x))))

; Rule: Numpuses are earthy
(assert (forall ((x Thing)) (=> (is-numpus x) (is-earthy x))))

; Rule: Numpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-tumpus x))))

; Rule: Every tumpus is luminous
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-luminous x))))

; Rule: Tumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dumpus x))))

; Fact: Sally is a yumpus
(assert (is-yumpus sally))

; 5. Verification: Test if "Sally is spicy" is true
; Assert the statement in question
(assert (is-spicy sally))

; Check satisfiability
(check-sat)
(get-model)