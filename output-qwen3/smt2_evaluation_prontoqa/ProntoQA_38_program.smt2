(declare-sort Entity 0)

; Declare predicates for each property mentioned in the problem
(declare-fun is-vumpus (Entity) Bool)
(declare-fun is-wooden (Entity) Bool)
(declare-fun is-jompus (Entity) Bool)
(declare-fun is-earthy (Entity) Bool)
(declare-fun is-wumpus (Entity) Bool)
(declare-fun is-transparent (Entity) Bool)
(declare-fun is-yumpus (Entity) Bool)
(declare-fun is-bright (Entity) Bool)
(declare-fun is-impus (Entity) Bool)
(declare-fun is-rompus (Entity) Bool)
(declare-fun is-happy (Entity) Bool)
(declare-fun is-dumpus (Entity) Bool)
(declare-fun is-brown (Entity) Bool)
(declare-fun is-zumpus (Entity) Bool)
(declare-fun is-sour (Entity) Bool)
(declare-fun is-numpus (Entity) Bool)
(declare-fun is-angry (Entity) Bool)
(declare-fun is-tumpus (Entity) Bool)

; Declare constant for the specific entity Polly
(declare-const Polly Entity)

; Knowledge Base Assertions

; Vumpuses are wooden
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-wooden x))))

; Every vumpus is a jompus
(assert (forall ((x Entity)) (=> (is-vumpus x) (is-jompus x))))

; Jompuses are earthy
(assert (forall ((x Entity)) (=> (is-jompus x) (is-earthy x))))

; Each jompus is a wumpus
(assert (forall ((x Entity)) (=> (is-jompus x) (is-wumpus x))))

; Wumpuses are not transparent
(assert (forall ((x Entity)) (=> (is-wumpus x) (not (is-transparent x)))))

; Wumpuses are yumpuses
(assert (forall ((x Entity)) (=> (is-wumpus x) (is-yumpus x))))

; Yumpuses are not bright
(assert (forall ((x Entity)) (=> (is-yumpus x) (not (is-bright x)))))

; Each yumpus is an impus
(assert (forall ((x Entity)) (=> (is-yumpus x) (is-impus x))))

; Every rompus is happy
(assert (forall ((x Entity)) (=> (is-rompus x) (is-happy x))))

; Impuses are not happy
(assert (forall ((x Entity)) (=> (is-impus x) (not (is-happy x)))))

; Each impus is a dumpus
(assert (forall ((x Entity)) (=> (is-impus x) (is-dumpus x))))

; Dumpuses are brown
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-brown x))))

; Dumpuses are zumpuses
(assert (forall ((x Entity)) (=> (is-dumpus x) (is-zumpus x))))

; Zumpuses are not sour
(assert (forall ((x Entity)) (=> (is-zumpus x) (not (is-sour x)))))

; Zumpuses are numpuses
(assert (forall ((x Entity)) (=> (is-zumpus x) (is-numpus x))))

; Every numpus is not angry
(assert (forall ((x Entity)) (=> (is-numpus x) (not (is-angry x)))))

; Numpuses are tumpuses
(assert (forall ((x Entity)) (=> (is-numpus x) (is-tumpus x))))

; Fact: Polly is a vumpus
(assert (is-vumpus Polly))

; Verification: Is the statement "Polly is not happy" true?
; We assert the statement directly. 
; If sat, the statement is True (consistent/entailed).
; If unsat, the statement is False (contradicts KB).
(assert (not (is-happy Polly)))

(check-sat)
(get-model)