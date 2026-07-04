; Reasoning Steps:
; 1. Analyze the hierarchy and properties provided in the text.
; 2. Chain of inheritance for Rex:
;    - Rex is a jompus (Fact).
;    - Jompuses are numpuses (Rule). -> Rex is a numpus.
;    - Numpuses are wumpuses (Rule). -> Rex is a wumpus.
;    - Wumpuses are rompuses (Rule). -> Rex is a rompus.
;    - Rompuses are tumpuses (Rule). -> Rex is a tumpus.
;    - Tumpuses are spicy (Rule). -> Rex is spicy.
; 3. The statement to verify is "Rex is not spicy".
; 4. Since the knowledge base implies "Rex is spicy", asserting "Rex is not spicy" creates a contradiction.
; 5. Expected SMT result: unsat (indicating the statement is False).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates for properties)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-temperate (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-dull (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-spicy (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-amenable (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-red (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-shy (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)

; 3. Declare constants
(declare-const Rex Thing)

; 4. Assert knowledge base (Rules)
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-floral x))))
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-vumpus x))))
(assert (forall ((x Thing)) (=> (is-vumpus x) (not (is-temperate x)))))
(assert (forall ((x Thing)) (=> (is-vumpus x) (is-jompus x))))
(assert (forall ((x Thing)) (=> (is-jompus x) (not (is-dull x)))))
(assert (forall ((x Thing)) (=> (is-impus x) (not (is-spicy x)))))
(assert (forall ((x Thing)) (=> (is-jompus x) (is-numpus x))))
(assert (forall ((x Thing)) (=> (is-numpus x) (not (is-opaque x)))))
(assert (forall ((x Thing)) (=> (is-numpus x) (is-wumpus x))))
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-amenable x))))
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-rompus x))))
(assert (forall ((x Thing)) (=> (is-rompus x) (not (is-red x)))))
(assert (forall ((x Thing)) (=> (is-rompus x) (is-tumpus x))))
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-spicy x))))
(assert (forall ((x Thing)) (=> (is-tumpus x) (is-dumpus x))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-shy x))))
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-zumpus x))))

; Assert Facts
(assert (is-jompus Rex))

; 5. Test the statement: "Rex is not spicy"
(assert (not (is-spicy Rex)))

; 6. Check satisfiability
(check-sat)
(get-model)