; Declare sorts
(declare-sort Person 0)

; Knowledge base: scenario
; The baby has been born
(declare-const baby_born Bool)
(assert (= baby_born true))

; Eligibility criteria (as flags we will assume satisfied for this scenario)
(declare-const mother_26weeks Bool)
(declare-const partner_26weeks Bool)
(declare-const mother_employee Bool)
(declare-const partner_employee Bool)
(declare-const mother_earnings Bool)
(declare-const partner_earnings Bool)

; Scenario: both parents meet the SPL/ShPP eligibility criteria
(assert (= mother_26weeks true))
(assert (= partner_26weeks true))
(assert (= mother_employee true))
(assert (= partner_employee true))
(assert (= mother_earnings true))
(assert (= partner_earnings true))

; Test: Are we eligible for SPL and ShPP given the scenario?
(assert (and mother_26weeks partner_26weeks mother_employee partner_employee mother_earnings partner_earnings))

; Check satisfiability and provide a model
(check-sat)
(get-model)