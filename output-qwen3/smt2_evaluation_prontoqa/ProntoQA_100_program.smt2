; Reasoning Steps:
; 1. Goal: Determine if "Alex is blue" is True or False.
; 2. Logic Chain:
;    - Alex is a Numpus (Given)
;    - Numpus -> Jompus (Rule: Each numpus is a jompus)
;    - Jompus -> Wumpus (Rule: Jompuses are wumpuses)
;    - Wumpus -> Rompus (Rule: Wumpuses are rompuses)
;    - Rompus -> Yumpus (Rule: Rompuses are yumpuses)
;    - Yumpus -> Blue (Rule: Yumpuses are blue)
; 3. Conclusion: Alex must be Blue.
; 4. Verification: Assert (is-blue alex). Expected result: sat (True).

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-angry (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-shy (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)

; 3. Declare constants
(declare-const alex Entity)

; 4. Assert knowledge base (facts and rules)

; Vumpuses are sour
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-sour x))))
; Vumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-tumpus x))))
; Tumpuses are bright
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-bright x))))
; Each tumpus is a dumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-dumpus x))))
; Each dumpus is not large
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-large x)))))
; Dumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-numpus x))))
; Numpuses are metallic
(assert (forall ((x Entity)) (=> (is-numpus x) (is-metallic x))))
; Each numpus is a jompus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-jompus x))))
; Every jompus is not angry
(assert (forall ((x Entity)) (=> (is-jompus x) (not (is-angry x)))))
; Jompuses are wumpuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))
; Wumpuses are not shy
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-shy x)))))
; Wumpuses are rompuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-rompus x))))
; Rompuses are not opaque
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-opaque x)))))
; Rompuses are yumpuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-yumpus x))))
; Every zumpus is not blue
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-blue x)))))
; Yumpuses are blue
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-blue x))))
; Yumpuses are impuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-impus x))))

; Fact: Alex is a numpus
(assert (is-numpus alex))

; 5. Check satisfiability
; Test: Is Alex blue?
; We assert the statement. If sat, it is True. If unsat, it is False.
(assert (is-blue alex))

(check-sat)
(get-model)