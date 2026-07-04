; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Person 0)                ; generic person sort
(declare-const daughter Person)        ; the 9‑year‑old child

; Predicates describing eligibility conditions
(declare-fun under16 (Person) Bool)                ; child is under 16
(declare-fun needs_extra_care (Person) Bool)      ; needs much more looking after
(declare-fun resident_gb (Person) Bool)           ; habitually resident in GB/EEA/CH
(declare-fun immigration_control (Person) Bool)   ; is subject to immigration control?
(declare-fun eligible_for_dla (Person) Bool)      ; can claim DLA

; -------------------------------------------------
;  Eligibility rule (derived from the DLA document)
; -------------------------------------------------
; A child is eligible for DLA iff all four conditions hold.
(assert (forall ((p Person))
  (=> (and (under16 p)
           (needs_extra_care p)
           (resident_gb p)
           (not (immigration_control p)))
      (eligible_for_dla p))))

; -------------------------------------------------
;  Facts from the scenario
; -------------------------------------------------
; The daughter is 9 years old → under 16
(assert (under16 daughter))

; AML requires intensive care → much more looking after
(assert (needs_extra_care daughter))

; Both parents are UK citizens and have lived in the UK all her life
; → she is habitually resident in Great Britain
(assert (resident_gb daughter))

; No mention of immigration control, and she is a UK citizen
(assert (not (immigration_control daughter)))

; -------------------------------------------------
;  Test the claim: can we assert that she is eligible?
; -------------------------------------------------
(assert (eligible_for_dla daughter))

; -------------------------------------------------
;  Solve
; -------------------------------------------------
(check-sat)   ; Expected: sat  (the claim is possible/true)
(get-model)