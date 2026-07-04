; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)

(declare-fun is-amenable (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-nervous (Entity) Bool)
(declare-fun is-sweet (Entity) Bool)
(declare-fun is-liquid (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)

; 3. Declare constants
(declare-const max Entity)

; 4. Assert knowledge base (facts)
; Rompuses are amenable
(assert (forall ((x Entity)) (=> (is-rompus x) (is-amenable x))))
; Rompuses are numpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-numpus x))))
; Numpuses are brown
(assert (forall ((x Entity)) (=> (is-numpus x) (is-brown x))))
; Numpuses are zumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-zumpus x))))
; Every zumpus is bright
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-bright x))))
; Vumpuses are nervous
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-nervous x))))
; Every zumpus is a dumpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-dumpus x))))
; Every dumpus is sweet
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-sweet x))))
; Dumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-yumpus x))))
; Every yumpus is not nervous
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-nervous x)))))
; Yumpuses are jompuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-jompus x))))
; Jompuses are not liquid
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-liquid x)))))
; Jompuses are impuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-impus x))))
; Impuses are not small
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-small x)))))
; Each impus is a tumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-tumpus x))))
; Tumpuses are not transparent
(assert (forall ((x Entity)) (=> (is-tumpus x) (not (is-transparent x)))))
; Tumpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-wumpus x))))
; Max is a rompus
(assert (is-rompus max))

; 5. Check satisfiability
; Question: Is the following statement true or false? Max is not nervous.
; We assert the statement "Max is not nervous" to verify if it is consistent with the KB.
; If sat, the statement is True. If unsat, the statement is False.
(assert (not (is-nervous max)))

(check-sat)
(get-model)