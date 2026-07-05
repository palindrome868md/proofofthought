; Question: Can my partner be registered as my carer given that I do not qualify for higher level PIP?

; 1) Declare sorts
(declare-sort Person 0)

; 2) Declare constants (recipient of care and potential carer)
(declare-const recipient Person)
(declare-const partner Person)

; 3) Declare functions/predicates
; gets-pip-dl(x): x receives PIP daily living component (any level)
(declare-fun gets-pip-dl (Person) Bool)
; gets-pip-dl-high(x): x receives the higher-level PIP daily living component
(declare-fun gets-pip-dl-high (Person) Bool)

; hours-caring(caregiver, cared-for): hours per week caregiver provides care
(declare-fun hours-caring (Person Person) Int)

; earnings(caregiver): weekly earnings of the caregiver
(declare-fun earnings (Person) Int)

; 4) Knowledge base (facts about the scenario)
; The person you care for (recipient) gets PIP daily living (at least at the lower level)
(assert (gets-pip-dl recipient))

; The person does not qualify for the higher level of PIP
(assert (not (gets-pip-dl-high recipient)))

; The partner provides at least 35 hours of care per week
(assert (>= (hours-caring partner recipient) 35))

; The partner's earnings are within the Carer’s Allowance threshold
(assert (<= (earnings partner) 128))

; 5) Verification: Check if such a carer arrangement is possible
(check-sat)
(get-model)