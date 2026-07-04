;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates ----------------------------------------------------
; p took a sworn oath in court
(declare-fun took-oath (Person) Bool)
; p is permitted to lie after having taken that oath
(declare-fun okay-to-lie-after-oath (Person) Bool)

;--- Constants -----------------------------------------------------
(declare-const john Person)

;--- Knowledge base ------------------------------------------------
; John has taken an oath in court
(assert (took-oath john))

; Legal/ethical rule: after an oath, lying is *not* permissible
(assert (forall ((p Person))
  (=> (took-oath p)
      (not (okay-to-lie-after-oath p)))))

;--- Test the claim ------------------------------------------------
; Claim: It is okay for John to lie after the oath
(assert (okay-to-lie-after-oath john))

;--- Query ---------------------------------------------------------
(check-sat)
(get-model)