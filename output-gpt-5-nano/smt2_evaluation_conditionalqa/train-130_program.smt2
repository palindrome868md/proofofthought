; Question: Is my kid eligible for Personal Independence Payment (PIP) given scenario?

; 1. Quantities (no sorts needed beyond built-ins)
(declare-const age_kid Int)
(declare-const state_pension_age Int)

; 2. Conditions at time of claim (scenarios)
(declare-const lived_in_England_2_of_3 Bool)
(declare-const has_longterm_disability Bool)
(declare-const difficulties_daily_living Bool)
(declare-const difficulties_mobility Bool)
(declare-const duration_3m Bool)
(declare-const duration_9m Bool)

; 3. Test predicate: is the kid PIP-eligible?
(declare-const pip_eligible Bool)

; 4. Facts describing the scenario
(assert (>= age_kid 16))
(assert (< age_kid state_pension_age))

; Scenario specifics: lives in England, has long-term disability, has at least one difficulty category,
; and has had/expected difficulties for the required durations.
(assert lived_in_England_2_of_3)
(assert has_longterm_disability)
(assert (or difficulties_daily_living difficulties_mobility))
(assert duration_3m)
(assert duration_9m)

; 5. Define PIP eligibility as: age >=16, not yet State Pension age, living in England 2 of last 3 years,
; has long-term disability, has daily living OR mobility difficulties, and durations met.
(assert (iff pip_eligible
  (and (>= age_kid 16)
       (< age_kid state_pension_age)
       lived_in_England_2_of_3
       has_longterm_disability
       (or difficulties_daily_living difficulties_mobility)
       duration_3m
       duration_9m)))

; 6. Test: assert the scenario's eligibility and check satisfiability
(assert pip_eligible)

; 7. Verification: one check to answer the question
(check-sat)
(get-model)