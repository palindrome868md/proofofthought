; Scenario: Can I get a funeral grant for my husband based on the War Widow's Funeral Expenses rules?

; 1) Sorts and constants
(declare-sort Person 0)
(declare-const deceased Person)
(declare-const claimant  Person)

; 2) Predicates describing eligibility criteria
;    - death-before-2005: death occurred whose cause relates to service before 6 Apr 2005
;    - has-constant-attendance: War Pensions Constant Attendance Allowance was being paid or would have been paid
;    - has-unemployability: Unemployability Supplement was being paid
;    - has-war-disablement: War Disablement Pension was assessed (80%+)
(declare-fun death-before-2005 (Person) Bool)
(declare-fun has-constant-attendance (Person) Bool)
(declare-fun has-unemployability (Person) Bool)
(declare-fun has-war-disablement (Person) Bool)

; 3) Grant predicate
;    Funeral grant is possible iff one of the eligibility conditions holds
(declare-fun grant-possible (Person) Bool)
(assert (iff (grant-possible deceased)
             (or (death-before-2005 deceased)
                 (has-constant-attendance deceased)
                 (and (has-unemployability deceased) (has-war-disablement deceased)))))

; 4) Scenario specifics (facts)
; The husband died recently (after 2005) and there is no evidence in this scenario
; that any of the specific pre-2005 conditions apply.
(assert (not (death-before-2005 deceased)))
(assert (not (has-constant-attendance deceased)))
(assert (not (has-unemployability deceased)))
(assert (not (has-war-disablement deceased)))

; 5) Test: Can I get a funeral grant for the deceased?
(assert (grant-possible deceased))

; 6) Check satisfiability and model
(check-sat)
(get-model)