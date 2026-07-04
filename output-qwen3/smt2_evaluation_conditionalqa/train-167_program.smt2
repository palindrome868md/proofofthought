; 1. Declare sorts
(declare-sort Tribunal 0)
(declare-sort Patient 0)

; 2. Declare functions
(declare-fun has-doctor-panel (Tribunal) Bool)
(declare-fun receives-medical-reports (Tribunal) Bool)
(declare-fun assesses-health (Tribunal) Bool)
(declare-fun applies-for-discharge (Patient Tribunal) Bool)

; 3. Declare constants
(declare-const dina Patient)
(declare-const mht Tribunal)

; 4. Assert knowledge base (from Document)
; Fact: The judicial panel includes a doctor 
; (Source: "judicial panel, made up of a judge, a doctor and a specialist lay member")
(assert (has-doctor-panel mht))

; Fact: The tribunal asks the hospital for reports from doctor/nursing teams 
; (Source: "The tribunal will also ask the hospital for reports from: your doctor...")
(assert (receives-medical-reports mht))

; Rule: If tribunal has doctor and receives medical reports, it assesses health
; (Logical inference from the presence of medical evidence and medical expertise)
(assert (forall ((t Tribunal))
  (=> (and (has-doctor-panel t) (receives-medical-reports t))
      (assesses-health t))))

; 5. Assert Scenario
; Dina is a patient applying for discharge hearing
(assert (applies-for-discharge dina mht))

; 6. Verification: Will the tribunal assess her health before making a decision?
; Assert the claim to test if it is consistent (True) or contradictory (False)
; (Source: "The tribunal will also look at: your pre-hearing examination... reports... The tribunal usually decides at the end of the hearing")
(assert (assesses-health mht))

; 7. Check satisfiability
; Expected: sat (True) - The tribunal process mandates health assessment via reports and doctor panel
(check-sat)
(get-model)