;------------------------------
; 1. Declare uninterpreted sorts
;------------------------------
(declare-sort Person 0)
(declare-sort Benefit 0)

;------------------------------
; 2. Declare functions and constants
;------------------------------
; Predicate: person receives a given benefit
(declare-fun receives (Person Benefit) Bool)

; Predicate: person pays tax on a given benefit
(declare-fun pays-tax (Person Benefit) Bool)

; Specific constants for the scenario
(declare-const widow Person)                ; the asker
(declare-const WarWidowPension Benefit)     ; the pension in question

;------------------------------
; 3. Knowledge base (facts + rule)
;------------------------------

; Fact: the widow receives the War Widow(er) Pension
(assert (receives widow WarWidowPension))

; Rule (from the document):
; Anyone who receives the War Widow(er) Pension does NOT pay tax on it.
(assert (forall ((p Person) (b Benefit))
  (=> (and (receives p b) (= b WarWidowPension))
      (not (pays-tax p b)))))

;------------------------------
; 4. Test the question
;------------------------------
; Assert the opposite of the rule: that the widow pays tax on the pension.
(assert (pays-tax widow WarWidowPension))

;------------------------------
; 5. Check the result
;------------------------------
(check-sat)   ; Expected result: unsat (the widow does NOT pay tax)