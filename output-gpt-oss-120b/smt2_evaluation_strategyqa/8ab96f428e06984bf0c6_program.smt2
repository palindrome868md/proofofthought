; -------------------------------------------------
; 1. Declare abstract sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Condition 0)
(declare-sort Layout 0)

; -------------------------------------------------
; 2. Declare constants for the specific concepts
; -------------------------------------------------
(declare-const fm-issues Condition)   ; fine‑motor‑control‑issues
(declare-const alt-layout Layout)     ; an altered keyboard layout
(declare-const alice Person)          ; a representative person

; -------------------------------------------------
; 3. Declare predicates (functions returning Bool)
; -------------------------------------------------
(declare-fun hasCondition (Person Condition) Bool)
(declare-fun alteredLayout (Layout) Bool)
(declare-fun benefitsFrom (Person Layout) Bool)

; -------------------------------------------------
; 4. Knowledge base
; -------------------------------------------------
; The layout we talk about is indeed an "altered" layout
(assert (alteredLayout alt-layout))

; Universal rule: fine‑motor issues + altered layout ⇒ benefit
(assert (forall ((p Person) (l Layout))
  (=> (and (hasCondition p fm-issues) (alteredLayout l))
      (benefitsFrom p l))))

; Give our concrete person the fine‑motor condition
(assert (hasCondition alice fm-issues))

; -------------------------------------------------
; 5. Test the question: “Could someone with fine motor
;    control issues benefit from an altered keyboard layout?”
; -------------------------------------------------
; We ask whether Alice can benefit from the altered layout.
(assert (benefitsFrom alice alt-layout))

; -------------------------------------------------
; 6. Solve
; -------------------------------------------------
(check-sat)   ; Expected result: sat  (the scenario is possible)
(get-model)