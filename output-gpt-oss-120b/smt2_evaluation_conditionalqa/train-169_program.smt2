;-----------------------------------------------------------------
; 1.  Sorts
;-----------------------------------------------------------------
(declare-sort Person 0)

;-----------------------------------------------------------------
; 2.  Functions / Predicates
;-----------------------------------------------------------------
; Personal characteristics
(declare-fun registered_blind (Person) Bool)     ; council‑registered blind
(declare-fun has_certificate  (Person) Bool)     ; medical certificate
(declare-fun resident_in_england (Person) Bool) ; lives in England/Wales

; Relationship / living situation
(declare-fun married   (Person Person) Bool)     ; married / civil partnership
(declare-fun lives_with (Person Person) Bool)    ; co‑habiting

; Financial data
(declare-fun income (Person) Int)                ; annual earnings
(declare-const personal_allowance Int)           ; standard PA (no blind add‑on)

; Derived properties
(declare-fun pays_tax (Person) Bool)             ; pays any Income Tax
(declare-fun uses_all_allowance (Person) Bool)   ; uses up the whole allowance

; Blind‑allowance specific
(declare-fun eligible_for_allowance (Person) Bool)  ; can claim BPA
(declare-fun can_transfer (Person Person) Bool)     ; can transfer BPA to spouse

;-----------------------------------------------------------------
; 3.  Rules (knowledge base)
;-----------------------------------------------------------------
; Eligibility for Blind Person’s Allowance (England & Wales)
(assert (forall ((p Person))
  (=> (and (registered_blind p)
           (has_certificate p)
           (resident_in_england p))
      (eligible_for_allowance p))))

; Simple tax‑paying rule (if income > total allowance you pay tax)
; For the purpose of this scenario we do not need the arithmetic definition,
; we simply assert the relevant booleans later.

; Transfer rule (HMRC guidance)
(assert (forall ((p Person) (q Person))
  (=> (and (eligible_for_allowance p)
           (married p q)
           (lives_with p q)
           (or (not (pays_tax p))
               (not (uses_all_allowance p))))
      (can_transfer p q))))

;-----------------------------------------------------------------
; 4.  Constants for the concrete scenario
;-----------------------------------------------------------------
(declare-const me   Person)
(declare-const wife Person)

; Personal facts
(assert (registered_blind me))
(assert (has_certificate  me))
(assert (resident_in_england me))

; Relationship facts
(assert (married me wife))
(assert (lives_with me wife))

; Income facts (low income, far below any allowance)
(assert (= personal_allowance 12500))       ; standard Personal Allowance (£12,500)
(assert (= (income me) 1000))               ; £1,000 earnings

; Because the income is far below the allowance, you neither pay tax
; nor use up the whole allowance.
(assert (not (pays_tax me)))
(assert (not (uses_all_allowance me)))

;-----------------------------------------------------------------
; 5.  Query – can I claim BPA and transfer it to my wife?
;-----------------------------------------------------------------
(assert (eligible_for_allowance me))   ; can I claim?
(assert (can_transfer me wife))        ; can I transfer it?

;-----------------------------------------------------------------
; 6.  Check satisfiability
;-----------------------------------------------------------------
(check-sat)   ; Expected result: sat  (the situation is logically possible)
(get-model)   ; Optional: shows a concrete model satisfying the constraints