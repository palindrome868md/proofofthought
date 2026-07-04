; Reasoning Steps:
; 1. Question Analysis: The user asks if they need to update the LPA record because their sister (attorney) changed her name via marriage.
; 2. Document Retrieval: Section "If your attorney's details change" states: "You must write to OPG if one of your attorneys has changed their: name - by marriage or deed poll".
; 3. Logical Deduction: 
;    - Premise 1: Sister is the attorney.
;    - Premise 2: Sister changed her name.
;    - Rule: If Attorney Name Changed -> Must Notify OPG (Update Record).
;    - Conclusion: Must Notify OPG (Update Record) is True.
; 4. Verification Strategy: 
;    - Encode the Rule and Premises in the Knowledge Base.
;    - Assert the Conclusion (update-record-required).
;    - Check Satisfiability.
;    - Expected Result: sat (True), confirming the requirement exists.

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort LPA 0)

; 2. Declare Functions/Predicates
(declare-fun is-attorney (Person LPA) Bool)
(declare-fun name-changed (Person) Bool)
(declare-fun must-notify-opg (Person LPA) Bool)
(declare-fun update-record-required (LPA) Bool)

; 3. Declare Constants
(declare-const donor Person)
(declare-const sister Person)
(declare-const my-lpa LPA)

; 4. Assert Knowledge Base (Rules and Facts)

; Rule: If an attorney's name changes, the donor must notify the Office of the Public Guardian (OPG)
; Source: "If your attorney's details change ... You must write to OPG if one of your attorneys has changed their: name"
(assert (forall ((p Person) (l LPA))
  (=> (and (is-attorney p l) (name-changed p))
      (must-notify-opg p l))))

; Rule: Notifying OPG about attorney details change counts as updating the record
; Source: "You must contact OPG to make changes to your LPA." (referring to the registration record)
(assert (forall ((p Person) (l LPA))
  (=> (must-notify-opg p l)
      (update-record-required l))))

; Fact: The sister is the appointed attorney on the LPA
(assert (is-attorney sister my-lpa))

; Fact: The sister changed her name due to marriage
; Source: Scenario "My sister married a new husband last year."
(assert (name-changed sister))

; 5. Verification Query
; Question: "Do I need to update this record now that my sister has changed her name through marriage?"
; We assert the positive claim (update is required) to check for satisfiability.
; If sat, the claim is consistent/true given the KB.
(assert (update-record-required my-lpa))

(check-sat)
(get-model)