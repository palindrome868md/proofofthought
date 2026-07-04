; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Person 0)

; Functions
(declare-fun works_full_time (Person) Bool)   ; true ⇔ parent works full‑time
(declare-fun benefit          (Person) Bool)   ; true ⇔ parent receives any SPL/ShPP benefit

; Constants representing the two parents
(declare-const parent1 Person)   ; mother
(declare-const parent2 Person)   ; partner

; -------------------------------------------------
;  Knowledge base (rules from the document)
; -------------------------------------------------
; If a parent works full‑time they cannot be receiving a Shared Parental benefit
(assert (forall ((p Person))
        (=> (works_full_time p) (not (benefit p)))))

; -------------------------------------------------
;  Scenario facts
; -------------------------------------------------
(assert (works_full_time parent1))   ; mother is working full‑time
(assert (works_full_time parent2))   ; partner is working full‑time

; -------------------------------------------------
;  Test the question:
;  "Would we still receive any sort of benefit if we are both working full time?"
; -------------------------------------------------
; At least one parent receives a benefit
(assert (or (benefit parent1) (benefit parent2)))

; -------------------------------------------------
;  Check the result
; -------------------------------------------------
(check-sat)
(get-model)