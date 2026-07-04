; -------------------------------------------------
; Declarations
; -------------------------------------------------
(declare-sort Person 0)

; Regions of the UK where different rules apply
(declare-datatypes () ((Region (EnglandWales) (ScotlandNI))))

; Predicates / functions
(declare-fun is_blind (Person) Bool)                 ; registered blind / severely sight‑impaired
(declare-fun has_certificate (Person) Bool)          ; medical certificate
(declare-fun has_large_savings (Person) Bool)        ; large amount of savings (irrelevant)
(declare-fun region (Person) Region)                ; where the person lives
(declare-fun eligible_blind_allowance (Person) Bool) ; can claim the allowance

; -------------------------------------------------
; Knowledge base (document rules)
; -------------------------------------------------
; England & Wales rule: blind + certificate ⇒ eligible
(assert (forall ((p Person))
  (=> (and (= (region p) EnglandWales) 
           (is_blind p) 
           (has_certificate p))
      (eligible_blind_allowance p))))

; Scotland & NI rule (not needed for this case, but included for completeness)
(assert (forall ((p Person))
  (=> (and (= (region p) ScotlandNI)
           (cannot_work_eyesight_essential p)
           (has_certificate p))
      (eligible_blind_allowance p))))

; -------------------------------------------------
; Facts about the sister
; -------------------------------------------------
(declare-const sister Person)

(assert (= (region sister) EnglandWales))      ; she lives in England/Wales
(assert (is_blind sister))                    ; partially blind → qualifies as blind/severely sight‑impaired
(assert (has_certificate sister))             ; she has the required medical certificate
(assert (has_large_savings sister))           ; she has a large amount of savings (does NOT affect eligibility)

; -------------------------------------------------
; Test the question: Can she claim the allowance?
; -------------------------------------------------
(assert (eligible_blind_allowance sister))

; -------------------------------------------------
; Query
; -------------------------------------------------
(check-sat)
(get-model)