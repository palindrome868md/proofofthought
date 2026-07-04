; Declare the uninterpreted sort for people
(declare-sort Person 0)

; Predicates
(declare-fun alive (Person) Bool)          ; true while the person is alive
(declare-fun power_valid (Person) Bool)    ; true while the donor's LPA is still valid

; Constant representing the grandfather (the donor)
(declare-const grandfather Person)

; Knowledge base ---------------------------------------------------------

; Fact: the grandfather is dead (he has only a few days left)
(assert (not (alive grandfather)))

; Legal rule (from the document):
; "The lasting power of attorney (LPA) ends when the donor dies."
; For any person p, if p is not alive then their LPA is not valid.
(assert (forall ((p Person))
  (=> (not (alive p))
      (not (power_valid p)))))

; -----------------------------------------------------------------------

; Test the question: "Will a power of attorney still be valid after my grandfather dies?"
; We assert the opposite of the legal rule to see if it leads to a contradiction.
(assert (power_valid grandfather))

; Check the consistency of the knowledge base with the test assertion.
(check-sat)
(get-model)