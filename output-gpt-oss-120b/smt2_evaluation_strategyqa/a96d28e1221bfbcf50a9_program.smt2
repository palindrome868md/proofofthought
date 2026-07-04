;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------------
(declare-fun insured (Person) Bool)      ; true ⇔ person has insurance
(declare-fun needsCT (Person) Bool)     ; person needs a CT scan
(declare-fun declineCT (Person) Bool)   ; person declines the CT scan

;--- Constants (the two individuals we will compare) -------------
(declare-const u Person)   ; uninsured person
(declare-const i Person)   ; insured person

;--- Knowledge base ------------------------------------------------
; u is uninsured, i is insured, both need a CT scan
(assert (not (insured u)))            ; u is uninsured
(assert (insured i))                  ; i is insured
(assert (needsCT u))
(assert (needsCT i))

; Empirical tendency: uninsured patients who need a CT tend to decline it
(assert (forall ((p Person))
  (=> (and (not (insured p)) (needsCT p))
      (declineCT p))))

; Empirical tendency: insured patients who need a CT tend NOT to decline it
(assert (forall ((p Person))
  (=> (and (insured p) (needsCT p))
      (not (declineCT p)))))

;--- Test the claim ------------------------------------------------
; Uninsured person declines, insured person does NOT decline
(assert (declineCT u))
(assert (not (declineCT i)))

; Ensure the two individuals are distinct
(assert (distinct u i))

;--- Verification --------------------------------------------------
(check-sat)        ; sat  → the claim is logically possible (i.e., true)
(get-model)