; ------------------------------------------------------------
; Sorts
; ------------------------------------------------------------
(declare-sort Person 0)

; ------------------------------------------------------------
; Functions / Predicates
; ------------------------------------------------------------
; Lives abroad?
(declare-fun lives_abroad (Person) Bool)
; Child lives abroad?
(declare-fun child_lives_abroad (Person) Bool)
; Parent has main day‑to‑day care of child
(declare-fun main_care (Person Person) Bool)
; Ability to make a new CMS claim
(declare-fun can_claim (Person) Bool)

; ------------------------------------------------------------
; Constants (the people in the scenario)
; ------------------------------------------------------------
(declare-const me Person)       ; the parent who moved abroad
(declare-const son Person)     ; the three‑year‑old child

; ------------------------------------------------------------
; Knowledge Base (facts from the scenario)
; ------------------------------------------------------------
(assert (lives_abroad me))                     ; you live abroad
(assert (child_lives_abroad son))              ; child lives abroad
(assert (main_care me son))                    ; you have main day‑to‑day care

; ------------------------------------------------------------
; Rule from the document
; "If the child and the parent with main care live abroad,
;  then the parent cannot make a new CMS application."
; ------------------------------------------------------------
(assert (forall ((p Person) (c Person))
  (=> (and (lives_abroad p)
           (child_lives_abroad c)
           (main_care p c))
      (not (can_claim p)))))

; ------------------------------------------------------------
; Test the statement: "I can claim child maintenance."
; ------------------------------------------------------------
(assert (can_claim me))

; ------------------------------------------------------------
; Check satisfiability
; ------------------------------------------------------------
(check-sat)   ; expected result: unsat (cannot claim)
(get-model)