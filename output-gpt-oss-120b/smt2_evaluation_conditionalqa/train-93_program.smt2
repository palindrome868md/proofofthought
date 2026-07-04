;--- Sorts --------------------------------------------------------------
(declare-sort Person 0)

;--- Functions ----------------------------------------------------------
; Appointment as next of kin
(declare-fun appointed-next-of-kin (Person Person) Bool)

; Conditions for being an appointee
(declare-fun over-18 (Person) Bool)
(declare-fun has-bank-account (Person) Bool)

; Authorisation to act on behalf of HMRC
(declare-fun authorised (Person) Bool)

;--- Constants ---------------------------------------------------------
(declare-const me Person)    ; you
(declare-const aunt Person) ; your aunt

;--- Knowledge Base -----------------------------------------------------

; You have been appointed as next of kin
(assert (appointed-next-of-kin me aunt))

; General policy: an appointment alone does NOT give authorisation.
; Authorisation must be obtained via the TC689 form (not modelled here).
(assert (forall ((a Person) (p Person))
        (=> (appointed-next-of-kin a p)
            (not (authorised a)))))

; (Optional) you satisfy the usual eligibility conditions,
; but they still do not make you automatically authorised.
(assert (over-18 me))
(assert (has-bank-account me))

;--- Test the claim ------------------------------------------------------
; Claim: "I am automatically authorised to act as her tax‑relief appointee"
(assert (authorised me))

;--- Decision -----------------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)