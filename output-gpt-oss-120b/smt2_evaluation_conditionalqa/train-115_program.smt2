;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Functions & Predicates --------------------------------
; Age of a person (needed for the 18+ rule)
(declare-fun age (Person) Int)

; Whether a person has the mental capacity to make decisions
(declare-fun has_capacity (Person) Bool)

; Whether a person wants to act as an attorney
(declare-fun wants_to_be_attorney (Person) Bool)

; Appointment relation: donor appoints an attorney
(declare-fun attorney_of (Person Person) Bool)

;--- Constants --------------------------------------------
(declare-const me Person)        ; the donor (the question‑asker)
(declare-const daughter Person) ; the daughter you might appoint

;--- Knowledge Base ----------------------------------------

; Both people are adults (18 or over)
(assert (>= (age me) 18))
(assert (>= (age daughter) 18))

; The donor must have mental capacity when making the LPA
(assert (has_capacity me))

; The daughter must have mental capacity to act as an attorney
(assert (has_capacity daughter))

; Rule from the LPA guide:
;   An attorney can only be appointed if they are willing to act.
;   (i.e., appointment implies the person wants to be an attorney)
(assert (forall ((d Person) (a Person))
  (=> (attorney_of d a)
      (wants_to_be_attorney a))))

;--- Test of the Question ----------------------------------

; Situation: you try to appoint your daughter as attorney
(assert (attorney_of me daughter))

; The daughter does NOT want to be your attorney
(assert (not (wants_to_be_attorney daughter)))

;--- Verification -----------------------------------------
; If the above constraints are consistent, the scenario is possible.
; The legal rule says it should be impossible, so we expect UN‑SAT.
(check-sat)
(get-model)