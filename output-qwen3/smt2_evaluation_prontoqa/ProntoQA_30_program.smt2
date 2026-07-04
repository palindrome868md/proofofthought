; Reasoning Steps:
; 1. We are given that "Fae is a vumpus".
; 2. Rule: "Every vumpus is a tumpus". So, Fae is a tumpus.
; 3. Rule: "Tumpuses are numpuses". So, Fae is a numpus.
; 4. Rule: "Every numpus is a dumpus". So, Fae is a dumpus.
; 5. Rule: "Each dumpus is a wumpus". So, Fae is a wumpus.
; 6. Rule: "Wumpuses are temperate". So, Fae is temperate.
; 7. Question: "Is Fae temperate?"
; 8. Based on the chain of implications, Fae must be temperate.
; 9. Verification Strategy: Assert the knowledge base, assert (is-temperate Fae), and check satisfiability.
; 10. Expected Result: sat (True).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-bright (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-mean (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-shy (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-fruity (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-metallic (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)

; 3. Declare constants
(declare-const Fae Thing)

; 4. Assert knowledge base (facts)

; Impuses are bright
(assert (forall ((x Thing)) (=> (is-impus x) (is-bright x))))

; Every impus is a jompus
(assert (forall ((x Thing)) (=> (is-impus x) (is-jompus x))))

; Jompuses are mean
(assert (forall ((x Thing)) (=> (is-jompus x) (is-mean x))))

; Every zumpus is not temperate
(assert (forall ((x Thing)) (=> (is-zumpus x) (not (is-temperate x)))))

; Each jompus is a vumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-vumpus x))))

; Vumpuses are transparent
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-transparent x))))

; Every vumpus is a tumpus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-tumpus x))))

; Every tumpus is shy
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-shy x))))

; Tumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-numpus x))))

; Each numpus is not blue
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-blue x)))))

; Every numpus is a dumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-dumpus x))))

; Dumpuses are not fruity
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-fruity x)))))

; Each dumpus is a wumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-wumpus x))))

; Wumpuses are temperate
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-temperate x))))

; Wumpuses are rompuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-rompus x))))

; Rompuses are metallic
(assert (forall ((x Thing)) (=> (is-rompus x) (is-metallic x))))

; Rompuses are yumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-yumpus x))))

; Fae is a vumpus
(assert (is-vumpus Fae))

; 5. Check satisfiability
; Test: Is Fae temperate?
(assert (is-temperate Fae))

(check-sat)
(get-model)