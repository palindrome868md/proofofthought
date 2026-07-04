; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates for categories)
(declare-fun is-tumpus (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)

; 3. Declare functions (predicates for properties)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-amenable (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-dull (Entity) Bool)
(declare-fun is-large (Entity) Bool)
(declare-fun is-floral (Entity) Bool)

; 4. Declare constants
(declare-const wren Entity)

; 5. Assert knowledge base (facts)
; Wren is an impus
(assert (is-impus wren))

; 6. Assert knowledge base (rules)
; Tumpuses are transparent
(assert (forall ((x Entity)) (=> (is-tumpus x) (is-transparent x))))

; Each impus is cold
(assert (forall ((x Entity)) (=> (is-impus x) (is-cold x))))

; Impuses are yumpuses
(assert (forall ((x Entity)) (=> (is-impus x) (is-yumpus x))))

; Every yumpus is sour
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-sour x))))

; Yumpuses are zumpuses
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-zumpus x))))

; Zumpuses are not amenable
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-amenable x)))))

; Every zumpus is a numpus
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-numpus x))))

; Numpuses are wooden
(assert (forall ((x Entity)) (=> (is-numpus x) (is-wooden x))))

; Numpuses are rompuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-rompus x))))

; Each rompus is not transparent
(assert (forall ((x Entity)) (=> (is-rompus x) (not (is-transparent x)))))

; Every rompus is a dumpus
(assert (forall ((x Entity)) (=> (is-rompus x) (is-dumpus x))))

; Dumpuses are dull
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-dull x))))

; Each dumpus is a vumpus
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-vumpus x))))

; Vumpuses are large
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-large x))))

; Each vumpus is a wumpus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-wumpus x))))

; Every wumpus is floral
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-floral x))))

; Each wumpus is a jompus
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-jompus x))))

; 7. Verification
; Question: Is the following statement true or false? Wren is transparent.
; We assert the statement to check for consistency.
; If unsat, the statement is False. If sat, the statement is True.
(assert (is-transparent wren))

(check-sat)
(get-model)