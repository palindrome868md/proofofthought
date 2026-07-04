; -------------------------------------------------
; Sorts
; -------------------------------------------------
(declare-sort School 0)
(declare-sort Child 0)

; -------------------------------------------------
; Functions / Predicates
; -------------------------------------------------
; The child has a recognized disability
(declare-fun has-disability (Child) Bool)

; The school initially offered the child a place
(declare-fun offered-place (School Child) Bool)

; The school rescinds (withdraws) that offer
(declare-fun rescinds-offer (School Child) Bool)

; -------------------------------------------------
; Constants (the parties in the scenario)
; -------------------------------------------------
(declare-const my-school School)   ; the school in question
(declare-const son Child)          ; the 4‑year‑old child

; -------------------------------------------------
; Knowledge base extracted from the provided document
; -------------------------------------------------
; The child has a severe disability (scoliosis)
(assert (has-disability son))

; The school had already offered the child a place
(assert (offered-place my-school son))

; Legal rule under the Equality Act 2010:
; A school may NOT rescind an offer *because* the child has a disability.
; In logical form:  (has-disability ∧ offered-place ∧ rescinds-offer) → false
; i.e. it is impossible for all three to hold simultaneously.
(assert
  (forall ((s School) (c Child))
    (=> (and (has-disability c)
             (offered-place s c)
             (rescinds-offer s c))
        false)))   ; equivalent to (not (and ...))

; -------------------------------------------------
; Test the question: "Can the school rescind their offer in this manner?"
; We assert that the school does rescind the offer and see if the
; constraints are satisfiable.
; -------------------------------------------------
(assert (rescinds-offer my-school son))

; -------------------------------------------------
; Decision procedure
; -------------------------------------------------
(check-sat)   ; Expected result: unsat (the rescind cannot legally occur)
(get-model)   ; Optional: show a model if it were satisfiable