(declare-const stopped_base_benefit Bool)
(declare-const returning_fulltime Bool)
(declare-const continuous_26weeks Bool)
(declare-const expected_5weeks Bool)
(declare-const entitled_before Bool)
(declare-const still_have_housing_costs Bool)
(declare-const eligible Bool)

; Scenario: I moved to a full-time role, previously claimed mortgage interest support, and meet the run-on criteria
(assert (= stopped_base_benefit true))
(assert (= returning_fulltime true))
(assert (= continuous_26weeks true))
(assert (= expected_5weeks true))
(assert (= entitled_before true))
(assert (= still_have_housing_costs true))

; Rule: If all eligibility conditions are met, then mortgage interest run-on is eligible
(assert (=> (and stopped_base_benefit returning_fulltime continuous_26weeks expected_5weeks entitled_before still_have_housing_costs)
            eligible))

; Test: Am I eligible?
(assert (= eligible true))

(check-sat)
(get-model)