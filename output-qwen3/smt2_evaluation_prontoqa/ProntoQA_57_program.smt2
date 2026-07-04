; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for properties)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-luminous (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-fruity (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-kind (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-opaque (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)

; 3. Declare constants
(declare-const alex Entity)

; 4. Assert knowledge base (rules)
; Rompuses are luminous
(assert (forall ((x Entity)) (=> (is-rompus x) (is-luminous x))))
; Yumpuses are feisty
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-feisty x))))
; Rompuses are impuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-impus x))))
; Each impus is not sour
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-sour x)))))
; Impuses are wumpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-wumpus x))))
; Wumpuses are not fruity
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-fruity x)))))
; Wumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-numpus x))))
; Every numpus is blue
(assert (forall ((x Entity)) (=> (is-numpus x) (is-blue x))))
; Every numpus is a dumpus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-dumpus x))))
; Every dumpus is not feisty
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-feisty x)))))
; Each dumpus is a tumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-tumpus x))))
; Tumpuses are kind
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-kind x))))
; Every tumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-vumpus x))))
; Each vumpus is opaque
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-opaque x))))
; Vumpuses are zumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-zumpus x))))
; Each zumpus is not large
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-large x)))))
; Zumpuses are jompuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-jompus x))))

; Assert facts
; Alex is a rompus
(assert (is-rompus alex))

; 5. Verification
; Question: Is the statement "Alex is not feisty" true?
; We assert the statement and check satisfiability.
; If sat, the statement is True (consistent with KB).
; If unsat, the statement is False (contradicts KB).
(assert (not (is-feisty alex)))

(check-sat)
(get-model)