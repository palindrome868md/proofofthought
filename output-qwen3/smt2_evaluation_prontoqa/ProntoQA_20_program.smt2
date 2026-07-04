; Declare Sort
(declare-sort Thing 0)

; Declare Predicates (Functions returning Bool)
(declare-fun is_yumpus (Thing) Bool)
(declare-fun is_dumpus (Thing) Bool)
(declare-fun is_opaque (Thing) Bool)
(declare-fun is_jompus (Thing) Bool)
(declare-fun is_shy (Thing) Bool)
(declare-fun is_numpus (Thing) Bool)
(declare-fun is_sour (Thing) Bool)
(declare-fun is_tumpus (Thing) Bool)
(declare-fun is_brown (Thing) Bool)
(declare-fun is_vumpus (Thing) Bool)
(declare-fun is_dull (Thing) Bool)
(declare-fun is_wumpus (Thing) Bool)
(declare-fun is_rompus (Thing) Bool)
(declare-fun is_luminous (Thing) Bool)
(declare-fun is_impus (Thing) Bool)
(declare-fun is_small (Thing) Bool)

; Declare Constant
(declare-const Stella Thing)

; Knowledge Base
; 1. Each yumpus is not small.
(assert (forall ((x Thing)) (=> (is_yumpus x) (not (is_small x)))))
; 2. Each yumpus is a dumpus.
(assert (forall ((x Thing)) (=> (is_yumpus x) (is_dumpus x))))
; 3. Each dumpus is opaque.
(assert (forall ((x Thing)) (=> (is_dumpus x) (is_opaque x))))
; 4. Every dumpus is a jompus.
(assert (forall ((x Thing)) (=> (is_dumpus x) (is_jompus x))))
; 5. Each jompus is shy.
(assert (forall ((x Thing)) (=> (is_jompus x) (is_shy x))))
; 6. Each numpus is sour.
(assert (forall ((x Thing)) (=> (is_numpus x) (is_sour x))))
; 7. Every jompus is a tumpus.
(assert (forall ((x Thing)) (=> (is_jompus x) (is_tumpus x))))
; 8. Each tumpus is brown.
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_brown x))))
; 9. Each tumpus is a vumpus.
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_vumpus x))))
; 10. Vumpuses are dull.
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_dull x))))
; 11. Vumpuses are wumpuses.
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_wumpus x))))
; 12. Every wumpus is not sour.
(assert (forall ((x Thing)) (=> (is_wumpus x) (not (is_sour x)))))
; 13. Wumpuses are rompuses.
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_rompus x))))
; 14. Each rompus is not luminous.
(assert (forall ((x Thing)) (=> (is_rompus x) (not (is_luminous x)))))
; 15. Rompuses are impuses.
(assert (forall ((x Thing)) (=> (is_rompus x) (is_impus x))))
; 16. Stella is a dumpus.
(assert (is_dumpus Stella))

; Verification: Is Stella sour?
; We assert the statement to test its consistency with the Knowledge Base.
; If unsat, the statement is False. If sat, the statement is True/Possible.
(assert (is_sour Stella))

; Check Satisfiability
(check-sat)
(get-model)