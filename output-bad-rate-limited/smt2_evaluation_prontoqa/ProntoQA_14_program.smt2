; Question: Is Fae opaque? Given the knowledge base, Fae is not opaque.

; Declare the universal domain
(declare-sort Thing 0)

; Predicates (uninterpreted predicates representing properties)
(declare-fun jompus (Thing) Bool)
(declare-fun zumpus  (Thing) Bool)
(declare-fun numpus (Thing) Bool)
(declare-fun yumpus (Thing) Bool)
(declare-fun wumpus (Thing) Bool)
(declare-fun tumpus (Thing) Bool)
(declare-fun opaque  (Thing) Bool)

; Other predicates can be added if needed (not required for this reasoning)
; (declare-fun hot (Thing) Bool)

; Constant representing the individual Fae
(declare-const fae Thing)

; Knowledge base (the given statements)
(assert (jompus fae))  ; Fae is a jompus

; Every jompus is a zumpus
(assert (forall ((p Thing)) (=> (jompus p) (zumpus p))))
; Every zumpus is a numpus
(assert (forall ((p Thing)) (=> (zumpus p) (numpus p))))
; Every numpus is a yumpus
(assert (forall ((p Thing)) (=> (numpus p) (yumpus p))))
; Every yumpus is a wumpus
(assert (forall ((p Thing)) (=> (yumpus p) (wumpus p))))
; Wumpuses are not opaque
(assert (forall ((p Thing)) (=> (wumpus p) (not (opaque p)))))

; Test scenario: Is Fae opaque?
(assert (opaque fae))

; Check satisfiability to answer the question
(check-sat)