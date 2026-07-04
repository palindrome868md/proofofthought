;--- Sorts ----------------------------------------------------
(declare-sort Person 0)

;--- Functions ------------------------------------------------
; True if the person receives Income Support (or other qualifying benefit)
(declare-fun receives_income_support (Person) Bool)

; True if the person can get a fee reduction or exemption for an LPA
(declare-fun eligible_for_assistance (Person) Bool)

;--- Constants ------------------------------------------------
(declare-const me Person)   ; the user in the scenario

;--- Knowledge Base -------------------------------------------
; Rule: receiving Income Support ⇒ eligible for assistance
(assert (forall ((p Person))
  (=> (receives_income_support p)
      (eligible_for_assistance p))))

; Fact: the user receives Income Support
(assert (receives_income_support me))

;--- Test ------------------------------------------------------
; Ask: can the user get financial assistance for the LPA?
(assert (eligible_for_assistance me))

;--- Query -----------------------------------------------------
(check-sat)   ; Expected: sat (true)
(get-model)