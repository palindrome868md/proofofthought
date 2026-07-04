; Reasoning Steps:
; 1. Wren is a tumpus (Given Fact).
; 2. Every tumpus is a wumpus (Rule). -> Wren is a wumpus.
; 3. Each wumpus is an impus (Rule). -> Wren is an impus.
; 4. Every impus is a vumpus (Rule). -> Wren is a vumpus.
; 5. Each vumpus is a numpus (Rule). -> Wren is a numpus.
; 6. Every numpus is wooden (Rule). -> Wren is wooden.
; Conclusion: The statement "Wren is wooden" logically follows from the premises.
; Verification Strategy: Assert the Knowledge Base, then assert (is-wooden Wren).
; If (check-sat) returns 'sat', the statement is True (consistent/necessary).
; If (check-sat) returns 'unsat', the statement is False (contradiction).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-shy (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)
(declare-fun is-wooden (Thing) Bool)
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-opaque (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-floral (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-bitter (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-small (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-orange (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-amenable (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)

; 3. Declare constants
(declare-const Wren Thing)

; 4. Assert knowledge base (facts)
(assert (is-tumpus Wren))

; 5. Assert knowledge base (rules)
; Every dumpus is not shy
(assert (forall ((x Thing))
  (=> (is-dumpus x) (not (is-shy x)))))

; Each dumpus is a tumpus
(assert (forall ((x Thing))
  (=> (is-dumpus x) (is-tumpus x))))

; Rompuses are not wooden
(assert (forall ((x Thing))
  (=> (is-rompus x) (not (is-wooden x)))))

; Tumpuses are opaque
(assert (forall ((x Thing))
  (=> (is-tumpus x) (is-opaque x))))

; Every tumpus is a wumpus
(assert (forall ((x Thing))
  (=> (is-tumpus x) (is-wumpus x))))

; Wumpuses are not floral
(assert (forall ((x Thing))
  (=> (is-wumpus x) (not (is-floral x)))))

; Each wumpus is an impus
(assert (forall ((x Thing))
  (=> (is-wumpus x) (is-impus x))))

; Impuses are bitter
(assert (forall ((x Thing))
  (=> (is-impus x) (is-bitter x))))

; Every impus is a vumpus
(assert (forall ((x Thing))
  (=> (is-impus x) (is-vumpus x))))

; Vumpuses are small
(assert (forall ((x Thing))
  (=> (is-vumpus x) (is-small x))))

; Each vumpus is a numpus
(assert (forall ((x Thing))
  (=> (is-vumpus x) (is-numpus x))))

; Every numpus is wooden
(assert (forall ((x Thing))
  (=> (is-numpus x) (is-wooden x))))

; Each numpus is a yumpus
(assert (forall ((x Thing))
  (=> (is-numpus x) (is-yumpus x))))

; Each yumpus is orange
(assert (forall ((x Thing))
  (=> (is-yumpus x) (is-orange x))))

; Each yumpus is a jompus
(assert (forall ((x Thing))
  (=> (is-yumpus x) (is-jompus x))))

; Each jompus is amenable
(assert (forall ((x Thing))
  (=> (is-jompus x) (is-amenable x))))

; Every jompus is a zumpus
(assert (forall ((x Thing))
  (=> (is-jompus x) (is-zumpus x))))

; 6. Verification: Is Wren wooden?
; Assert the statement to test
(assert (is-wooden Wren))

; 7. Check satisfiability
(check-sat)
(get-model)