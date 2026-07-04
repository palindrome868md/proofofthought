; -------------------------------------------------
; DECLARATIONS
; -------------------------------------------------
(declare-sort Person 0)

; Predicates
(declare-fun first_child (Person) Bool)          ; expecting first child, no other children
(declare-fun lives_in_scotland (Person) Bool)    ; residence
(declare-fun has_benefit (Person) Bool)          ; qualifies for the benefit‑based rule
(declare-fun can_apply (Person) Bool)            ; allowed to apply for a maternity allowance

; The individual asking the question
(declare-const me Person)

; -------------------------------------------------
; KNOWLEDGE BASE (rules taken from the document)
; -------------------------------------------------
; Rule 1 – Sure Start Maternity Grant (outside Scotland)
(assert (forall ((p Person))
  (=> (and (first_child p)
           (not (lives_in_scotland p))
           (has_benefit p))
      (can_apply p))))

; Rule 2 – Pregnancy and Baby Payment (Scotland)
(assert (forall ((p Person))
  (=> (and (first_child p)
           (lives_in_scotland p))
      (can_apply p))))

; -------------------------------------------------
; SCENARIO SPECIFICATIONS
; -------------------------------------------------
; The asker is pregnant with their first child
(assert (first_child me))

; Assume they do NOT live in Scotland (the rules still work if this is left uninterpreted,
; but fixing it to false makes the example concrete)
(assert (not (lives_in_scotland me)))

; No information about benefits is given – we leave (has_benefit me) unconstrained.
; The solver may set it to true if needed.

; -------------------------------------------------
; QUESTION: "Am I allowed to apply for any form of maternity allowances?"
; We test this by asserting that the person can apply.
; -------------------------------------------------
(assert (can_apply me))

; -------------------------------------------------
; SOLVER QUERY
; -------------------------------------------------
(check-sat)   ; Expected result: sat (the scenario is possible)
(get-model)   ; Shows a model, e.g. has_benefit = true