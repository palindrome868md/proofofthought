; Declare sort for entities
(declare-sort Thing 0)

; Declare predicates for categories and properties
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-bright (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-sweet (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-shy (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)

; Declare constant for Sam
(declare-const sam Thing)

; Knowledge Base: Rules
; Tumpuses are bright
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-bright x))))
; Tumpuses are rompuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-rompus x))))
; Rompuses are not earthy
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-earthy x)))))
; Every rompus is a dumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-dumpus x))))
; Every dumpus is sweet
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-sweet x))))
; Each dumpus is a zumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-zumpus x))))
; Each zumpus is luminous
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-luminous x))))
; Zumpuses are impuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-impus x))))
; Every numpus is temperate
(assert (forall ((x Thing)) (=> (is-numpus x) (is-temperate x))))
; Impuses are not temperate
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-temperate x)))))
; Every impus is a wumpus
(assert (forall ((x Thing)) (=> (is-impus x) (is-wumpus x))))
; Every wumpus is red
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-red x))))
; Wumpuses are yumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-yumpus x))))
; Every yumpus is kind
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-kind x))))
; Every yumpus is a jompus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-jompus x))))
; Every jompus is shy
(assert (forall ((x Thing)) (=> (is-jompus x) (is-shy x))))
; Every jompus is a vumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-vumpus x))))

; Knowledge Base: Facts
; Sam is a tumpus
(assert (is-tumpus sam))

; Verification: Test the statement "Sam is not temperate"
; If sat, the statement is True (consistent with KB)
; If unsat, the statement is False (contradicts KB)
(assert (not (is-temperate sam)))

; Check satisfiability
(check-sat)
(get-model)