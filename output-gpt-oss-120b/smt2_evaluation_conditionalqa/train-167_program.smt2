; Declare sorts
(declare-sort Person 0)
(declare-sort Tribunal 0)

; Declare predicates
(declare-fun is_patient (Person) Bool)
(declare-fun makes_decision (Tribunal Person) Bool)
(declare-fun assesses_health (Tribunal Person) Bool)

; Constants for the case
(declare-const aunt-dina Person)
(declare-const mental-health-tribunal Tribunal)

; Knowledge base derived from the guidance:
; The tribunal must assess a patient’s health before it makes a decision.
(assert (forall ((t Tribunal) (p Person))
  (=> (makes_decision t p) (assesses_health t p))))

; Aunt Dina is a patient in a mental‑health institution
(assert (is_patient aunt-dina))

; An application has been made, so the tribunal will make a decision about her
(assert (makes_decision mental-health-tribunal aunt-dina))

; Question to verify: Will the tribunal assess her health before deciding?
(assert (assesses_health mental-health-tribunal aunt-dina))

; Check the claim
(check-sat)
(get-model)