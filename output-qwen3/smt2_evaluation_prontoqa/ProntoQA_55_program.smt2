; Reasoning Steps:
; 1. Analyze the logical chain provided in the text.
;    - Rex is a dumpus.
;    - Dumpuses are numpuses.
;    - Numpuses are wumpuses.
;    - Wumpuses are vumpuses.
;    - Vumpuses are jompuses.
;    - Jompuses are mean.
; 2. Deduce the property for Rex.
;    - Since Rex is a dumpus, he follows the chain to become a jompus.
;    - Since he is a jompus, he is mean.
; 3. Formulate the verification.
;    - The question asks: "Is the following statement true or false? Rex is mean."
;    - To verify "True", we assert the Knowledge Base (KB) and the statement (is-mean rex).
;    - If (check-sat) returns "sat", the statement is consistent/True given the KB.
;    - If (check-sat) returns "unsat", the statement contradicts the KB (False).
; 4. Expected Result: sat (True).

; Declare Sorts
(declare-sort Thing 0)

; Declare Predicates (Categories)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)

; Declare Predicates (Properties)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-hot (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)
(declare-fun is-mean (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)

; Declare Constants
(declare-const rex Thing)

; Assert Knowledge Base (Rules)
; Dumpuses are dull
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-dull x))))
; Dumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-numpus x))))
; Numpuses are blue
(assert (forall ((x Thing)) (=> (is-numpus x) (is-blue x))))
; Numpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-wumpus x))))
; Wumpuses are hot
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-hot x))))
; Wumpuses are vumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-vumpus x))))
; Vumpuses are luminous
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-luminous x))))
; Each vumpus is a jompus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-jompus x))))
; Jompuses are mean
(assert (forall ((x Thing)) (=> (is-jompus x) (is-mean x))))
; Jompuses are impuses
(assert (forall ((x Thing)) (=> (is-jompus x) (is-impus x))))
; Every impus is not small
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-small x)))))
; Every impus is a rompus
(assert (forall ((x Thing)) (=> (is-impus x) (is-rompus x))))
; Rompuses are not feisty
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-feisty x)))))
; Yumpuses are not mean
(assert (forall ((x Thing)) (=> (is-yumpus x) (not (is-mean x)))))
; Every rompus is a zumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-zumpus x))))

; Assert Facts
; Rex is a dumpus
(assert (is-dumpus rex))

; Verification Query
; Test: Is Rex mean?
(assert (is-mean rex))

; Check Satisfiability
(check-sat)
(get-model)