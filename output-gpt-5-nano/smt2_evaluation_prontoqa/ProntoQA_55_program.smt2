; Sorts
(declare-sort Entity 0)

; Predicates
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-blue (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-hot (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-luminous (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-mean (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-feisty (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-small (Entity) Bool)

; Constants
(declare-const rex Entity)

; Knowledge base (rules)
(assert (is-dumpus rex))

; Dumpuses are dull
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-dull x))))
; Dumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-numpus x))))
; Numpuses are blue
(assert (forall ((x Entity)) (=> (is-numpus x) (is-blue x))))
; Numpuses are wumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-wumpus x))))
; Wumpuses are hot
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-hot x))))
; Wumpuses are vumpuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-vumpus x))))
; Vumpuses are luminous
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-luminous x))))
; Each vumpus is a jompus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-jompus x))))
; Jompuses are mean
(assert (forall ((x Entity)) (=> (is-jompus x) (is-mean x))))
; Jompuses are impuses
(assert (forall ((x Entity)) (=> (is-jompus x) (is-impus x))))
; Every impus is not small
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-small x)))))
; Every impus is a rompus
(assert (forall ((x Entity)) (=> (is-impus x) (is-rompus x))))
; Rompuses are not feisty
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-feisty x)))))
; Every rompus is a zumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-zumpus x))))
; Yumpuses are not mean
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-mean x)))))

; Test scenario: Is Rex mean?
(assert (is-mean rex))

; Verification: check satisfiability and get a model
(check-sat)
(get-model)