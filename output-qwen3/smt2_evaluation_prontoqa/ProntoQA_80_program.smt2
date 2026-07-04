; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for properties)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-large (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-cold (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-luminous (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-happy (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-sour (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-bright (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)

; 3. Declare constants
(declare-const sally Thing)

; 4. Assert knowledge base (facts and rules)

; Fact: Sally is a numpus
(assert (is-numpus sally))

; Rule: Each numpus is large
(assert (forall ((x Thing)) (=> (is-numpus x) (is-large x))))

; Rule: Numpuses are impuses
(assert (forall ((x Thing)) (=> (is-numpus x) (is-impus x))))

; Rule: Impuses are not cold
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-cold x)))))

; Rule: Impuses are dumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-dumpus x))))

; Rule: Every dumpus is not floral
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (is-floral x)))))

; Rule: Dumpuses are vumpuses
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-vumpus x))))

; Rule: Every vumpus is not luminous
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-luminous x)))))

; Rule: Every vumpus is a yumpus
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-yumpus x))))

; Rule: Each rompus is not blue
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-blue x)))))

; Rule: Yumpuses are blue
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-blue x))))

; Rule: Yumpuses are tumpuses
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-tumpus x))))

; Rule: Every tumpus is happy
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-happy x))))

; Rule: Each tumpus is a zumpus
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-zumpus x))))

; Rule: Zumpuses are sour
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-sour x))))

; Rule: Each zumpus is a wumpus
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-wumpus x))))

; Rule: Wumpuses are bright
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-bright x))))

; Rule: Each wumpus is a jompus
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-jompus x))))

; 5. Verification
; Question: Is Sally blue?
; We assert the statement to check if it is consistent (sat) with the KB.
(assert (is-blue sally))

(check-sat)
(get-model)