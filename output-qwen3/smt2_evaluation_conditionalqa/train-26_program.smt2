; 1. Declare sorts (using built-in Bool for propositions)
; No custom sorts needed for this propositional reasoning task

; 2. Declare constants representing the scenario and question
(declare-const paying-in-installments Bool)
(declare-const interest-payable Bool)

; 3. Assert knowledge base (facts from the document)
; Document: "You'll usually have to pay interest on your instalments."
; Document: "On each later instalment you must pay interest on both of the following: the full outstanding tax balance"
; Since an installment plan spans 10 years, there are "later instalments", making interest payable on the scheme.
(assert (=> paying-in-installments interest-payable))

; 4. Assert scenario facts
; Scenario: "I agree to pay it in installments"
(assert paying-in-installments)

; 5. Verification: Is interest payable?
; To test if "interest-payable" is True, we assert it and check for satisfiability.
; If sat -> True (Yes). If unsat -> False (No).
(assert interest-payable)

; 6. Check satisfiability
(check-sat)
(get-model)