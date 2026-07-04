; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-shy (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-orange (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-impus (Entity) Bool)

; 3. Declare constants
(declare-const sam Entity)

; 4. Assert knowledge base (facts and rules)
; Each jompus is not amenable.
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-amenable x)))))
; Wumpuses are not fruity.
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-fruity x)))))
; Every jompus is a vumpus.
(assert (forall ((x Entity)) (=> (is-jompus x) (is-vumpus x))))
; Every vumpus is not shy.
(assert (forall ((x Entity)) (=> (is-vumpus x) (not (is-shy x)))))
; Every vumpus is a rompus.
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-rompus x))))
; Rompuses are not bitter.
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-bitter x)))))
; Rompuses are dumpuses.
(assert (forall ((x Entity)) (=> (is-rompus x) (is-dumpus x))))
; Dumpuses are opaque.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-opaque x))))
; Every dumpus is a yumpus.
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-yumpus x))))
; Every yumpus is orange.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-orange x))))
; Yumpuses are zumpuses.
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-zumpus x))))
; Zumpuses are fruity.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-fruity x))))
; Each zumpus is a numpus.
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-numpus x))))
; Numpuses are metallic.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-metallic x))))
; Every numpus is a tumpus.
(assert (forall ((x Entity)) (=> (is-numpus x) (is-tumpus x))))
; Each tumpus is large.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-large x))))
; Each tumpus is an impus.
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-impus x))))

; Fact: Sam is a vumpus.
(assert (is-vumpus sam))

; 5. Verification: Test the statement "Sam is not fruity"
; If this leads to unsat, the statement is False (contradicts KB).
; If this leads to sat, the statement is True (consistent with KB).
(assert (not (is-fruity sam)))

; 6. Check satisfiability
(check-sat)
(get-model)