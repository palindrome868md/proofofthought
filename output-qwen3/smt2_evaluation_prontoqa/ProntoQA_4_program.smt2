; SMT-LIB 2.0 Program to verify: "Alex is not small"
; Expected Result: unsat (meaning the statement is False)

; 1. Declare Sorts
(declare-sort Creature 0)

; 2. Declare Functions (Predicates)
(declare-fun is-rompus (Creature) Bool)
(declare-fun is-spicy (Creature) Bool)
(declare-fun is-impus (Creature) Bool)
(declare-fun is-yumpus (Creature) Bool)
(declare-fun is-small (Creature) Bool)
(declare-fun is-orange (Creature) Bool)
(declare-fun is-zumpus (Creature) Bool)
(declare-fun is-hot (Creature) Bool)
(declare-fun is-numpus (Creature) Bool)
(declare-fun is-metallic (Creature) Bool)
(declare-fun is-wumpus (Creature) Bool)
(declare-fun is-kind (Creature) Bool)
(declare-fun is-dumpus (Creature) Bool)
(declare-fun is-bright (Creature) Bool)
(declare-fun is-jompus (Creature) Bool)
(declare-fun is-vumpus (Creature) Bool)
(declare-fun is-shy (Creature) Bool)
(declare-fun is-tumpus (Creature) Bool)

; 3. Declare Constants
(declare-const Alex Creature)

; 4. Assert Knowledge Base (Rules)
; Rompuses are spicy
(assert (forall ((x Creature)) (=> (is-rompus x) (is-spicy x))))
; Every rompus is an impus
(assert (forall ((x Creature)) (=> (is-rompus x) (is-impus x))))
; Yumpuses are not small
(assert (forall ((x Creature)) (=> (is-yumpus x) (not (is-small x)))))
; Impuses are orange
(assert (forall ((x Creature)) (=> (is-impus x) (is-orange x))))
; Impuses are zumpuses
(assert (forall ((x Creature)) (=> (is-impus x) (is-zumpus x))))
; Zumpuses are not hot
(assert (forall ((x Creature)) (=> (is-zumpus x) (not (is-hot x)))))
; Zumpuses are numpuses
(assert (forall ((x Creature)) (=> (is-zumpus x) (is-numpus x))))
; Numpuses are metallic
(assert (forall ((x Creature)) (=> (is-numpus x) (is-metallic x))))
; Numpuses are wumpuses
(assert (forall ((x Creature)) (=> (is-numpus x) (is-wumpus x))))
; Every wumpus is not kind
(assert (forall ((x Creature)) (=> (is-wumpus x) (not (is-kind x)))))
; Each wumpus is a dumpus
(assert (forall ((x Creature)) (=> (is-wumpus x) (is-dumpus x))))
; Each dumpus is not bright
(assert (forall ((x Creature)) (=> (is-dumpus x) (not (is-bright x)))))
; Every dumpus is a jompus
(assert (forall ((x Creature)) (=> (is-dumpus x) (is-jompus x))))
; Jompuses are small
(assert (forall ((x Creature)) (=> (is-jompus x) (is-small x))))
; Jompuses are vumpuses
(assert (forall ((x Creature)) (=> (is-jompus x) (is-vumpus x))))
; Each vumpus is not shy
(assert (forall ((x Creature)) (=> (is-vumpus x) (not (is-shy x)))))
; Every vumpus is a tumpus
(assert (forall ((x Creature)) (=> (is-vumpus x) (is-tumpus x))))

; 5. Assert Facts
; Alex is a zumpus
(assert (is-zumpus Alex))

; 6. Verification
; Test Statement: "Alex is not small"
; We assert the statement directly. If unsat, the statement is False.
(assert (not (is-small Alex)))

; 7. Check Satisfiability
(check-sat)
(get-model)