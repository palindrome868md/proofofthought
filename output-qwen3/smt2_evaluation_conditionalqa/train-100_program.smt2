; SMT-LIB 2.0 Program to verify possibility of presumed death declaration
; Based on UK High Court guidelines provided in the document

; 1. Declare Constants
; Variables representing the scenario and legal conditions
(declare-const missing_years Int)
(declare-const is_natural_disaster Bool)
(declare-const is_sibling Bool)
(declare-const jurisdiction_conditions_met Bool)
(declare-const eligible_for_declaration Bool)

; 2. Assert Scenario Facts (Knowledge Base)
; Fact: Brother has been missing for 2 years
(assert (= missing_years 2))
; Fact: He went missing during an earthquake (Natural Disaster)
(assert (= is_natural_disaster true))
; Fact: The claimant is a sibling ("My brother")
(assert (= is_sibling true))

; 3. Assert Legal Rules (Knowledge Base)
; Rule: To be eligible, one must meet jurisdiction requirements, 
; be a valid relative (sibling), and meet time/cause conditions.
; Time/Cause Condition: Missing for >= 7 years OR (< 7 years AND Natural Disaster)
(assert (= eligible_for_declaration
           (and jurisdiction_conditions_met
                is_sibling
                (or (>= missing_years 7)
                    (and (< missing_years 7) is_natural_disaster)))))

; 4. Verification Test
; Question: "Is it possible for me to declare my brother dead even though he's only been missing two years?"
; Strategy: Assert that the declaration IS eligible and check satisfiability.
; If 'sat', it means there exists a valid configuration (e.g., jurisdiction_conditions_met = true) 
; that satisfies the rules despite the 2-year duration.
; If 'unsat', it means the 2-year duration makes it impossible regardless of other factors.
(assert (= eligible_for_declaration true))

; 5. Check Satisfiability
(check-sat)
(get-model)