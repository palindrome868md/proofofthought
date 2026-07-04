; -------------------------------------------------
; Sort declarations
; -------------------------------------------------
(declare-sort Person 0)          ; persons
(declare-sort Org 0)             ; organisations (e.g., Armed Forces)

; -------------------------------------------------
; Function and predicate declarations
; -------------------------------------------------
(declare-fun works_for (Person Org) Bool)      ; parent works for organisation
(declare-fun is_armed_forces (Org) Bool)       ; organisation is Armed Forces
(declare-fun lives_abroad (Person) Bool)       ; parent resides abroad
(declare-fun is_absent (Person) Bool)          ; parent is absent (e.g., deployed)
(declare-fun can_be_mandated_to_pay (Person) Bool) ; can be forced to pay maintenance

; -------------------------------------------------
; Knowledge base (rule from the document)
; -------------------------------------------------
; If a parent lives abroad and works for the Armed Forces,
; then that parent can be mandated to pay child maintenance.
(assert
  (forall ((p Person) (o Org))
    (=> (and (works_for p o)
             (is_armed_forces o)
             (lives_abroad p))
        (can_be_mandated_to_pay p))))

; -------------------------------------------------
; Concrete scenario: Alice (the ex‑husband) is the absent parent
; -------------------------------------------------
(declare-const alice Person)   ; the absent parent
(declare-const army Org)       ; the Armed Forces organisation

; Facts about Alice
(assert (works_for alice army))      ; she works for the Armed Forces
(assert (is_armed_forces army))      ; army is the Armed Forces
(assert (lives_abroad alice))        ; she is abroad (in Germany)
(assert (is_absent alice))           ; she is absent (deployed)

; -------------------------------------------------
; Test the question: can Alice be made to pay maintenance?
; -------------------------------------------------
(assert (can_be_mandated_to_pay alice))

; -------------------------------------------------
; Check satisfiability (sat means "Yes, she can be made to pay")
; -------------------------------------------------
(check-sat)
(get-model)