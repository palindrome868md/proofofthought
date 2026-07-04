; Declare boolean flags representing the situation
(declare-const has_probate Bool)               ; true if a grant of representation (probate) has been obtained
(declare-const can_pay_from_deceased Bool)     ; true if the inheritance‑tax bill can be paid from the deceased’s account

; Knowledge extracted from the document:
; “You can pay using the deceased’s bank accounts … This is called the ‘Direct Payment Scheme’.”
; The ability to use the deceased’s accounts is permitted once you have probate (grant of representation).

; Rule: having probate enables payment from the deceased’s accounts
(assert (=> has_probate can_pay_from_deceased))

; Situation described in the question:
; – The applicant *has* probate.
(assert has_probate)

; – Test the possibility of paying the tax bill from the deceased’s account.
(assert can_pay_from_deceased)

; Verify whether the scenario is consistent with the knowledge base.
(check-sat)   ; Expected result: sat (it is possible)
(get-model)