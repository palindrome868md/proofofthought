;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates --------------------------------
; The person making the claim
(declare-const claimant Person)

; The missing person (your father)
(declare-const father Person)

; Your father's civil partner
(declare-const father_civil_partner Person)

; Relation: “X is the civil partner of Y”
(declare-fun civil_partner (Person Person) Bool)

; Predicate: “The claimant has sent a copy of the claim to R”
(declare-fun sent_copy (Person Person) Bool)

;--- Knowledge Base ----------------------------------------
; Your father’s civil partner relation holds
(assert (civil_partner father father_civil_partner))

; Rule from the guidance:
; For every missing person M and any person R,
; if R is the missing person’s civil partner (or spouse)
; then the claimant must send a copy of the claim to R.
(assert
  (forall ((m Person) (r Person))
    (=> (civil_partner m r)
        (sent_copy claimant r))))

;--- Test the statement ------------------------------------
; Assume we do NOT send the copy to the civil partner
(assert (not (sent_copy claimant father_civil_partner)))

;--- Check whether this assumption is compatible with the rules
(check-sat)   ; expected result: unsat (the copy must be sent)
(get-model)   ; optional: shows the model if the check were sat