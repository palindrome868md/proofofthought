; ------------------------------------------------------------
;  Declarations
; ------------------------------------------------------------
(declare-sort Person 0)

; The individual in the scenario
(declare-const me Person)

; Predicates needed for eligibility
(declare-fun isFullTimeStudent (Person) Bool)
(declare-fun childUnder15 (Person) Bool)          ; has at least one child <15
(declare-fun getsUndergradFinance (Person) Bool)
(declare-fun isPostgraduateLoan (Person) Bool)
(declare-fun residentInEngland (Person) Bool)
(declare-fun partnerClaimsTaxFree (Person) Bool) ; partner (or self) claims excluded benefits
(declare-fun partnerReceivesNHSHelp (Person) Bool)
(declare-fun applyForGrant (Person) Bool)        ; “can apply” / “does apply”

; ------------------------------------------------------------
;  Eligibility rule (derived from the document)
; ------------------------------------------------------------
; If all eligibility conditions hold, the person may apply for a
; Childcare Grant.
(assert (forall ((p Person))
  (=> (and (isFullTimeStudent p)
           (childUnder15 p)
           (getsUndergradFinance p)
           (not (isPostgraduateLoan p))
           (residentInEngland p)
           (not (partnerClaimsTaxFree p))
           (not (partnerReceivesNHSHelp p)))
      (applyForGrant p))))

; ------------------------------------------------------------
;  Assertions describing the concrete scenario
; ------------------------------------------------------------
; 1. The person is a full‑time university student
(assert (isFullTimeStudent me))

; 2. The person has a 5‑year‑old son → child under 15 condition holds
(assert (childUnder15 me))

; 3. The person receives undergraduate student finance
(assert (getsUndergradFinance me))

; 4. The person is *not* on a postgraduate loan
(assert (not (isPostgraduateLoan me)))

; 5. The person lives permanently in England
(assert (residentInEngland me))

; 6. Neither the person nor the partner claim excluded benefits
(assert (not (partnerClaimsTaxFree me)))
(assert (not (partnerReceivesNHSHelp me)))

; ------------------------------------------------------------
;  Test the claim: can the person apply for the grant?
; ------------------------------------------------------------
(assert (applyForGrant me))

; ------------------------------------------------------------
;  Check satisfiability
; ------------------------------------------------------------
(check-sat)
(get-model)