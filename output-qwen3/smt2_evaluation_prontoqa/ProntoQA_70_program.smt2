; Reasoning Steps:
; 1. Rex is a jompus (Given).
; 2. Jompuses are yumpuses -> Rex is a yumpus.
; 3. Yumpuses are impuses -> Rex is an impus.
; 4. Impuses are rompuses -> Rex is a rompus.
; 5. Rompuses are tumpuses -> Rex is a tumpus.
; 6. Tumpuses are transparent -> Rex is transparent.
; 7. Statement to test: "Rex is not transparent".
; 8. Since Rex is transparent, "Rex is not transparent" contradicts the KB.
; 9. Asserting (not (is-transparent Rex)) should result in unsat.
; 10. unsat means the statement is False.

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories and properties)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-small (Entity) Bool)

; 3. Declare constants
(declare-const Rex Entity)

; 4. Assert knowledge base (rules)
; Each jompus is earthy
(assert (forall ((x Entity)) (=> (is-jompus x) (is-earthy x))))
; Jompuses are yumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-yumpus x))))
; Yumpuses are metallic
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-metallic x))))
; Each yumpus is an impus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-impus x))))
; Each dumpus is not transparent
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-transparent x)))))
; Impuses are nervous
(assert (forall ((x Entity)) (=> (is-impus x) (is-nervous x))))
; Impuses are rompuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-rompus x))))
; Every rompus is small
(assert (forall ((x Entity)) (=> (is-rompus x) (is-small x))))
; Rompuses are tumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-tumpus x))))
; Tumpuses are transparent
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-transparent x))))
; Tumpuses are vumpuses
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-vumpus x))))

; Fact: Rex is a jompus
(assert (is-jompus Rex))

; 5. Test the statement: "Rex is not transparent"
; We assert the statement to check if it is consistent with the KB.
; If unsat, the statement is False (contradicts KB).
(assert (not (is-transparent Rex)))

; 6. Check satisfiability
(check-sat)
(get-model)