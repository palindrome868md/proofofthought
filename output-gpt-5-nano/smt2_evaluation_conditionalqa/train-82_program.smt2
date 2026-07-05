; Sorts
(declare-sort Person 0)

; Predicates / relations
(declare-fun has-lpa (Person Person) Bool)      ; donor -> attorney
(declare-fun is-deceased (Person) Bool)        ; is the donor deceased?
(declare-fun lpa-active (Person Person) Bool)  ; is the LPA currently active?

; Constants representing the scenario
(declare-const grandfather Person)
(declare-const me Person)

; Knowledge base (the LPA ends at death)
(assert (has-lpa grandfather me))
(assert (is-deceased grandfather))

; Rule: An LPA ends when the donor dies
(assert
  (forall ((d Person) (a Person))
    (=> (and (has-lpa d a) (is-deceased d))
        (not (lpa-active d a)))))

; Test scenario: Would the LPA still be valid after the grandfather dies?
; (We test the negation of the desired fact to align with "would/could be true" style.)
(assert (lpa-active grandfather me))

; Verification
(check-sat)
(get-model)