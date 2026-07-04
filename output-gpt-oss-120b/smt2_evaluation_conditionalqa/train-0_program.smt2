;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Constants -----------------------------------------------------
(declare-const me Person)      ; the child (question‑asker)
(declare-const uncle Person)   ; paternal uncle

;--- Priority function: lower number = higher entitlement -----------
(declare-fun priority (Person) Int)

;--- Knowledge base: intestacy priority ordering --------------------
; child = priority 1, uncle (sibling of the deceased) = priority 3
; (the exact numbers are irrelevant as long as child < uncle)
(assert (= (priority me)    1))
(assert (= (priority uncle) 3))

;--- Definition: having a greater right means a lower priority -----
(define-fun has_greater_right ((p1 Person) (p2 Person)) Bool
  (< (priority p1) (priority p2))
)

;--- Test the claim -------------------------------------------------
; "Do I have a greater right to probate than my uncle?"
(assert (has_greater_right me uncle))

;--- Query ---------------------------------------------------------
(check-sat)
(get-model)