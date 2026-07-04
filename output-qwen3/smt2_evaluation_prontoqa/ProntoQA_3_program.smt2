; Reasoning Steps:
; 1. Fact: Wren is a Tumpus.
; 2. Rule: Each tumpus is a wumpus. -> Wren is a Wumpus.
; 3. Rule: Each wumpus is a rompus. -> Wren is a Rompus.
; 4. Rule: Rompuses are impuses. -> Wren is an Impus.
; 5. Rule: Each impus is a dumpus. -> Wren is a Dumpus.
; 6. Rule: Every dumpus is not metallic. -> Wren is Not Metallic.
; 7. Question: Is the statement "Wren is not metallic" true?
; 8. Verification: Assert (not (is-metallic Wren)). 
;    If (check-sat) returns 'sat', the statement is consistent/true.
;    If (check-sat) returns 'unsat', the statement contradicts the KB/false.

; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-floral (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-small (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-metallic (Entity) Bool)
(declare-fun is-happy (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-bitter (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)

; 3. Declare constants
(declare-const Wren Entity)

; 4. Assert knowledge base (facts and rules)
; Vumpuses are floral
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-floral x))))
; Vumpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-tumpus x))))
; Tumpuses are brown
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-brown x))))
; Each tumpus is a wumpus
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-wumpus x))))
; Wumpuses are small
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-small x))))
; Each wumpus is a rompus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-rompus x))))
; Each zumpus is metallic
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-metallic x))))
; Every rompus is happy
(assert (forall ((x Entity)) (=> (is-rompus x) (is-happy x))))
; Rompuses are impuses
(assert (forall ((x Entity)) (=> (is-rompus x) (is-impus x))))
; Each impus is amenable
(assert (forall ((x Entity)) (=> (is-impus x) (is-amenable x))))
; Each impus is a dumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-dumpus x))))
; Every dumpus is not metallic
(assert (forall ((x Entity)) (=> (is-dumpus x) (not (is-metallic x)))))
; Dumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-numpus x))))
; Each numpus is bitter
(assert (forall ((x Entity)) (=> (is-numpus x) (is-bitter x))))
; Each numpus is a jompus
(assert (forall ((x Entity)) (=> (is-numpus x) (is-jompus x))))
; Every jompus is cold
(assert (forall ((x Entity)) (=> (is-jompus x) (is-cold x))))
; Each jompus is a yumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-yumpus x))))

; Fact: Wren is a tumpus
(assert (is-tumpus Wren))

; 5. Verification
; Statement to test: Wren is not metallic.
(assert (not (is-metallic Wren)))

; Check satisfiability
(check-sat)
(get-model)