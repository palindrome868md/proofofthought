; Reasoning Steps:
; 1. Analyze the given facts and rules to determine properties of Stella.
; 2. Fact: Stella is a wumpus.
; 3. Rule: Every wumpus is a zumpus. -> Stella is a zumpus.
; 4. Rule: Zumpuses are tumpuses. -> Stella is a tumpus.
; 5. Rule: Every tumpus is a vumpus. -> Stella is a vumpus.
; 6. Rule: Every vumpus is a jompus. -> Stella is a jompus.
; 7. Rule: Jompuses are hot. -> Stella is hot.
; 8. Question: Is "Stella is not hot" true?
; 9. Since Stella is hot, "Stella is not hot" contradicts the derived facts.
; 10. Verification Strategy: Assert the Knowledge Base, then assert "Stella is not hot".
; 11. If (check-sat) returns 'unsat', the statement is False. If 'sat', the statement is True.
; 12. Expected Result: unsat (Statement is False).

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
(declare-fun is_rompus (Thing) Bool)
(declare-fun is_amenable (Thing) Bool)
(declare-fun is_impus (Thing) Bool)
(declare-fun is_happy (Thing) Bool)
(declare-fun is_wumpus (Thing) Bool)
(declare-fun is_sour (Thing) Bool)
(declare-fun is_zumpus (Thing) Bool)
(declare-fun is_fruity (Thing) Bool)
(declare-fun is_tumpus (Thing) Bool)
(declare-fun is_large (Thing) Bool)
(declare-fun is_vumpus (Thing) Bool)
(declare-fun is_yumpus (Thing) Bool)
(declare-fun is_hot (Thing) Bool)
(declare-fun is_liquid (Thing) Bool)
(declare-fun is_jompus (Thing) Bool)
(declare-fun is_dumpus (Thing) Bool)

; 3. Declare Constants
(declare-const Stella Thing)

; 4. Assert Knowledge Base (Rules)
; Each rompus is amenable
(assert (forall ((x Thing)) (=> (is_rompus x) (is_amenable x))))
; Each rompus is an impus
(assert (forall ((x Thing)) (=> (is_rompus x) (is_impus x))))
; Impuses are happy
(assert (forall ((x Thing)) (=> (is_impus x) (is_happy x))))
; Every impus is a wumpus
(assert (forall ((x Thing)) (=> (is_impus x) (is_wumpus x))))
; Wumpuses are sour
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_sour x))))
; Each wumpus is a zumpus
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_zumpus x))))
; Zumpuses are fruity
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_fruity x))))
; Zumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_tumpus x))))
; Each tumpus is not large
(assert (forall ((x Thing)) (=> (is_tumpus x) (not (is_large x)))))
; Every tumpus is a vumpus
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_vumpus x))))
; Yumpuses are not hot
(assert (forall ((x Thing)) (=> (is_yumpus x) (not (is_hot x)))))
; Every vumpus is liquid
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_liquid x))))
; Every vumpus is a jompus
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_jompus x))))
; Jompuses are hot
(assert (forall ((x Thing)) (=> (is_jompus x) (is_hot x))))
; Jompuses are dumpuses
(assert (forall ((x Thing)) (=> (is_jompus x) (is_dumpus x))))

; 5. Assert Facts
; Stella is a wumpus
(assert (is_wumpus Stella))

; 6. Verification Assertion
; Test the statement: "Stella is not hot"
(assert (not (is_hot Stella)))

; 7. Check Satisfiability
(check-sat)
(get-model)