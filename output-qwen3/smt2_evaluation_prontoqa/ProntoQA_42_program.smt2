; SMT-LIB 2.0 Program to verify the statement: "Wren is not orange"
; Based on the provided logical rules regarding Tumpuses, Jompuses, etc.

; 1. Declare Sorts
(declare-sort Thing 0)

; 2. Declare Constants
(declare-const wren Thing)

; 3. Declare Functions (Predicates)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-feisty (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-transparent (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-amenable (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-orange (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-earthy (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)

; 4. Assert Knowledge Base (Facts and Rules)

; Tumpuses are dull
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dull x))))

; Tumpuses are jompuses
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-jompus x))))

; Jompuses are not sour
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-sour x)))))

; Each jompus is a vumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-vumpus x))))

; Vumpuses are feisty
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-feisty x))))

; Vumpuses are dumpuses
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-dumpus x))))

; Dumpuses are cold
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-cold x))))

; Each dumpus is a yumpus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-yumpus x))))

; Each yumpus is transparent
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-transparent x))))

; Each yumpus is a numpus
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-numpus x))))

; Numpuses are not amenable
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-amenable x)))))

; Numpuses are zumpuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-zumpus x))))

; Each zumpus is orange
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-orange x))))

; Each zumpus is a rompus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-rompus x))))

; Rompuses are earthy
(assert (forall ((x Thing)) (=> (is-rompus x) (is-earthy x))))

; Each impus is not orange
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-orange x)))))

; Rompuses are wumpuses
(assert (forall ((x Thing)) (=> (is-rompus x) (is-wumpus x))))

; Fact: Wren is a vumpus
(assert (is-vumpus wren))

; 5. Verification
; Question: Is the statement "Wren is not orange" true or false?
; Strategy: Assert the statement "Wren is not orange" and check satisfiability.
; If unsat, the statement contradicts the knowledge base (False).
; If sat, the statement is consistent with the knowledge base (True).
(assert (not (is-orange wren)))

(check-sat)
(get-model)