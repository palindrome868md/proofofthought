; Reasoning Steps:
; 1. Wren is a rompus (Given).
; 2. Rompuses are yumpuses (Rule). -> Wren is a yumpus.
; 3. Yumpuses are jompuses (Rule). -> Wren is a jompus.
; 4. Every jompus is an impus (Rule). -> Wren is an impus.
; 5. Each impus is a numpus (Rule). -> Wren is a numpus.
; 6. Numpuses are earthy (Rule). -> Wren is earthy.
; 7. Question: Is "Wren is not earthy" true?
; 8. Since Wren IS earthy, "Wren is not earthy" is False.
; 9. Verification: Assert (not (is-earthy wren)). Expect unsat.

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)

; 3. Declare constants
(declare-const wren Entity)

; 4. Assert knowledge base
; Fact: Wren is a rompus
(assert (is-rompus wren))

; Rule: Rompuses are bitter
(assert (forall ((x Entity)) (=> (is-rompus x) (is-bitter x))))

; Rule: Rompuses are yumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-yumpus x))))

; Rule: Yumpuses are nervous
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-nervous x))))

; Rule: Yumpuses are jompuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-jompus x))))

; Rule: Jompuses are not blue
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-blue x)))))

; Rule: Dumpuses are not earthy
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-earthy x)))))

; Rule: Every jompus is an impus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-impus x))))

; Rule: Impuses are bright
(assert (forall ((x Entity)) (=> (is-impus x) (is-bright x))))

; Rule: Each impus is a numpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-numpus x))))

; Rule: Numpuses are earthy
(assert (forall ((x Entity)) (=> (is-numpus x) (is-earthy x))))

; Rule: Every numpus is a vumpus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-vumpus x))))

; 5. Test the statement: "Wren is not earthy"
; We assert the statement in question. 
; If this leads to unsat, the statement is False (contradicts KB).
(assert (not (is-earthy wren)))

; 6. Check satisfiability
(check-sat)
(get-model)