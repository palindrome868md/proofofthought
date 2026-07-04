; 1. Declare sorts
(declare-sort Object 0)

; 2. Declare functions (Predicates)
(declare-fun is-tumpus (Object) Bool)
(declare-fun is-sour (Object) Bool)
(declare-fun is-vumpus (Object) Bool)
(declare-fun is-bright (Object) Bool)
(declare-fun is-numpus (Object) Bool)
(declare-fun is-rompus (Object) Bool)
(declare-fun is-brown (Object) Bool)
(declare-fun is-liquid (Object) Bool)
(declare-fun is-impus (Object) Bool)
(declare-fun is-small (Object) Bool)
(declare-fun is-jompus (Object) Bool)
(declare-fun is-yumpus (Object) Bool)

; 3. Declare constants
(declare-const max Object)

; 4. Assert knowledge base (facts)
; Tumpuses are sour
(assert (forall ((x Object)) (=> (is-tumpus x) (is-sour x))))
; Each tumpus is a vumpus
(assert (forall ((x Object)) (=> (is-tumpus x) (is-vumpus x))))
; Vumpuses are bright
(assert (forall ((x Object)) (=> (is-vumpus x) (is-bright x))))
; Each vumpus is a numpus
(assert (forall ((x Object)) (=> (is-vumpus x) (is-numpus x))))
; Each rompus is not brown
(assert (forall ((x Object)) (=> (is-rompus x) (not (is-brown x)))))
; Each numpus is liquid
(assert (forall ((x Object)) (=> (is-numpus x) (is-liquid x))))
; Numpuses are impuses
(assert (forall ((x Object)) (=> (is-numpus x) (is-impus x))))
; Impuses are not small
(assert (forall ((x Object)) (=> (is-impus x) (not (is-small x)))))
; Impuses are jompuses
(assert (forall ((x Object)) (=> (is-impus x) (is-jompus x))))
; Jompuses are brown
(assert (forall ((x Object)) (=> (is-jompus x) (is-brown x))))
; Jompuses are yumpuses
(assert (forall ((x Object)) (=> (is-jompus x) (is-yumpus x))))

; Fact: Max is a tumpus
(assert (is-tumpus max))

; 5. Test Scenario: Max is not brown
; We assert the statement we want to verify. 
; If this leads to 'unsat', the statement is False.
; If this leads to 'sat', the statement is Possible (True in some model).
(assert (not (is-brown max)))

; 6. Check satisfiability
(check-sat)
(get-model)