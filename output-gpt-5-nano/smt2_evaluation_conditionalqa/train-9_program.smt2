; Declare a boolean representing whether War Widows Pension is taxed
(declare-const taxed-war-widow-pension Bool)

; Knowledge base: You do not pay tax on War Widow's Pension
(assert (not taxed-war-widow-pension))

; Test scenario: Do you have to pay tax on War Widow's Pension?
(assert taxed-war-widow-pension)

; Check satisfiability of the knowledge base with the test scenario
(check-sat)
(get-model)