;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions -----------------------------------------------------
; Year the deputyship started (as an integer year)
(declare-fun deputy-start-year (Person) Int)

; Whether the person is currently acting as a deputy
(declare-fun is-current-deputy (Person) Bool)

; Derived predicate: can the person apply for a refund?
(declare-fun can-apply-refund (Person) Bool)

;--- Knowledge base ------------------------------------------------
; Refund eligibility rule (from the document):
; * the deputyship must have started between 1‑Apr‑2008 and 31‑Mar‑2015
; * the deputy must no longer be acting (otherwise refund is automatic)
(assert (forall ((p Person))
  (= (can-apply-refund p)
     (and (>= (deputy-start-year p) 2008)      ; start on/after 2008
          (<= (deputy-start-year p) 2015)      ; end on/before 2015
          (not (is-current-deputy p))))))     ; not a current deputy

;--- Scenario -------------------------------------------------------
; You (the asker) are the deputy
(declare-const me Person)

; Deputyship began in August 2018
(assert (= (deputy-start-year me) 2018))

; You are still acting as the deputy
(assert (is-current-deputy me))

;--- Test the question -----------------------------------------------
; "Can I apply for a deputyship fee refund?"
(assert (can-apply-refund me))

;--- Query -----------------------------------------------------------
(check-sat)   ; Expected result: unsat (i.e., you cannot apply)
(get-model)  ; (optional) model, but will be empty because unsat