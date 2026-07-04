; Reasoning Summary:
; 1. Alex is a zumpus (Given).
; 2. Zumpus -> Tumpus -> Wumpus -> Impus -> Dumpus (Chain of implications).
; 3. Dumpus -> Not Hot (Given rule).
; 4. Therefore, Alex is Not Hot.
; 5. Testing "Alex is hot" against the Knowledge Base should result in UNSAT (False).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (Predicates)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-kind (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-hot (Thing) Bool)
(declare-fun is-brown (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)

; 3. Declare constants
(declare-const Alex Thing)

; 4. Assert knowledge base (facts and rules)
; Every jompus is sour
(assert (forall ((x Thing)) (=> (is-jompus x) (is-sour x))))
; Each jompus is a rompus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-rompus x))))
; Rompuses are not kind
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-kind x)))))
; Every rompus is a zumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-zumpus x))))
; Every zumpus is feisty
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-feisty x))))
; Zumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-tumpus x))))
; Tumpuses are small
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-small x))))
; Tumpuses are wumpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-wumpus x))))
; Wumpuses are opaque
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-opaque x))))
; Wumpuses are impuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-impus x))))
; Every yumpus is hot
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-hot x))))
; Impuses are brown
(assert (forall ((x Thing)) (=> (is-impus x) (is-brown x))))
; Impuses are dumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-dumpus x))))
; Dumpuses are not hot
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-hot x)))))
; Every dumpus is a vumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-vumpus x))))
; Each vumpus is dull
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-dull x))))
; Vumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-numpus x))))

; Fact: Alex is a zumpus
(assert (is-zumpus Alex))

; 5. Verification: Test the statement "Alex is hot"
; If this leads to unsat, the statement is False.
(assert (is-hot Alex))

; Check satisfiability
(check-sat)
(get-model)