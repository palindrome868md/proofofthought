; Scenario: Can I get a death certificate for my missing father after 5 years, given my sister does not want me to?

; Sorts
(declare-sort Person 0)

; Constants representing people
(declare-const father Person)
(declare-const claimant Person)
(declare-const sister Person)

; Functions to model the scenario
; years-missing(p) -> how many years p has been missing
(declare-fun years-missing (Person) Int)
; believes-dead(p) -> does the claimant believe p is dead? (for the claimant only)
(declare-fun believes-dead (Person) Bool)
; can-declare(p) -> is the claimant eligible to file a declaration of presumed death for p
(declare-fun can-declare (Person) Bool)
; certificate-available(p) -> can a death certificate be issued for p (simplified linkage)
(declare-fun certificate-available (Person) Bool)

; Knowledge base: current scenario
; Father has been missing for 5 years
(assert (= (years-missing father) 5))
; The claimant does not believe the father is dead
(assert (= believes-dead claimant) false)

; Rule: Eligibility to file a declaration of presumed death for the missing person
; Can declare if:
; - 7+ years missing, or
; - less than 7 years missing and claimant believes the person is dead
(assert (= can-declare claimant
  (or (>= (years-missing father) 7)
      (and (< (years-missing father) 7) believes-dead claimant))))

; Certificate availability is modeled simplistically as directly tied to declaration eligibility
(assert (= certificate-available claimant (can-declare claimant)))

; Test: Can I get a death certificate for him?
(assert certificate-available claimant)

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)