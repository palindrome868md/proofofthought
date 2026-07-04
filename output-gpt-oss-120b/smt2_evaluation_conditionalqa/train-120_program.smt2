;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

; Enumeration for PIP daily‑living component level
(declare-datatypes () ((Level low high)))

;--- Functions / Predicates ----------------------------------------
; Person receives PIP daily‑living component at a given level
(declare-fun gets_PIP_DL (Person Level) Bool)

; Partner relationship (p is partner of c)
(declare-fun is_partner (Person Person) Bool)

; Ability for a person to be registered as a carer for another person
(declare-fun can_register_as_carer (Person Person) Bool)

;--- Constants ------------------------------------------------------
(declare-const me Person)          ; the claimant
(declare-const my_partner Person) ; the partner

;--- Knowledge base ------------------------------------------------
; The claimant receives the *lower* level of the PIP daily‑living component
(assert (gets_PIP_DL me low))

; (explicitly we do not assert the higher level – it is not required)
; Partner relationship holds
(assert (is_partner my_partner me))

; Rule: If the person cared for gets PIP (any level) and someone is their partner,
; then that partner can be registered as a carer (other eligibility criteria omitted)
(assert (forall ((c Person) (p Person) (l Level))
  (=> (and (gets_PIP_DL c l) (is_partner p c))
      (can_register_as_carer p c))))

;--- Test the question ---------------------------------------------
; Claim: my partner is registered as my carer
(assert (can_register_as_carer my_partner me))

;--- Check result ---------------------------------------------------
(check-sat)   ; Expected: sat (the scenario is possible)
(get-model)