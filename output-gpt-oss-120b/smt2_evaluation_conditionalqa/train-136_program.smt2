; Declare uninterpreted sorts
(declare-sort Person 0)
(declare-sort Agreement 0)

; Functions / predicates
(declare-fun splits_evenly (Agreement) Bool)          ; agreement splits joint finances evenly
(declare-fun is_legally_binding (Agreement) Bool)    ; agreement is legally binding
(declare-fun requires_court (Agreement) Bool)        ; a court must approve the agreement

; Knowledge base derived from the document:
; A contract can only be legally binding if the court approves it.
(assert (forall ((a Agreement))
  (=> (is_legally_binding a) (requires_court a))))

; Hypothetical agreement we are testing:
(declare-const a0 Agreement)

; The parties would like the agreement to split finances evenly and be binding,
; *without* involving the court.
(assert (splits_evenly a0))
(assert (is_legally_binding a0))
(assert (not (requires_court a0)))   ; no court involvement

; Ask whether such an agreement can exist.
(check-sat)   ; Expected: unsat (cannot have a legally binding contract without court approval)
(get-model)