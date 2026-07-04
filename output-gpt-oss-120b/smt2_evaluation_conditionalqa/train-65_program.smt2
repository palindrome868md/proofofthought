;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Jurisdiction 0)

;--- Function declarations ---------------------------------------------
; Person lives in a given jurisdiction
(declare-fun lives_in (Person Jurisdiction) Bool)
; Jurisdictions where remote witnessing is allowed
(declare-fun remote_witness_allowed (Jurisdiction) Bool)
; Whether the person wants a remote witnessing procedure
(declare-fun wants_remote_witness (Person) Bool)
; Whether the person can have the will witnessed remotely
(declare-fun can_remote_witness (Person) Bool)

;--- Constant declarations -----------------------------------------------
(declare-const me Person)            ; the will‑maker
(declare-const scotland Jurisdiction)
(declare-const england Jurisdiction)
(declare-const wales Jurisdiction)

;--- Knowledge base ------------------------------------------------------
; Remote witnessing is permitted only in England and Wales
(assert (remote_witness_allowed england))
(assert (remote_witness_allowed wales))
(assert (not (remote_witness_allowed scotland)))   ; not allowed in Scotland

; The will‑maker lives in Scotland
(assert (lives_in me scotland))

; The will‑maker wants the signing to be witnessed remotely
(assert (wants_remote_witness me))

; Rule: a person can have a remote witnessing if they
;       – live in a jurisdiction that allows it, and
;       – they want it
(assert (forall ((p Person) (j Jurisdiction))
  (=> (and (lives_in p j)
           (remote_witness_allowed j)
           (wants_remote_witness p))
      (can_remote_witness p))))

;--- Test the question ---------------------------------------------------
; Is remote witnessing possible for the will‑maker?
(assert (can_remote_witness me))

;--- Check the result ----------------------------------------------------
(check-sat)   ; Expected: unsat (remote witnessing NOT possible in Scotland)
(get-model)