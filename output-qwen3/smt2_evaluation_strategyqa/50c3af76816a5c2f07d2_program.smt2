; Reasoning Steps:
; 1. Analyze the question: "Does Disney have an ice princess?"
;    - This is an existence question (Is there at least one character who is Disney + Princess + Ice?).
;    - Expected Answer: Yes (based on common knowledge of Elsa from Frozen).
; 2. Define the Knowledge Base (KB):
;    - Sorts: Character, Company, Power.
;    - Constants: Disney (Company), Elsa (Character), Ice (Power).
;    - Facts: Elsa belongs to Disney, Elsa is a Princess (colloquially), Elsa has Ice power.
; 3. Define the Verification Test:
;    - To verify existence, declare a witness constant (candidate).
;    - Assert that the candidate satisfies the conditions: belongs to Disney, is a Princess, has Ice power.
;    - Check satisfiability. If 'sat', it means such a character exists consistent with the KB.
; 4. Strategy per Instructions:
;    - Use declare-const + assert instead of exists quantifier for the test.
;    - Ensure KB establishes the ground truth (Elsa's properties).
;    - Ensure Test asserts the query conditions on a witness.
;    - Exactly one (check-sat).
;    - 'sat' implies True (Yes), 'unsat' implies False (No).

; 1. Declare Sorts
(declare-sort Character 0)
(declare-sort Company 0)
(declare-sort Power 0)

; 2. Declare Functions
(declare-fun belongs-to (Character Company) Bool)
(declare-fun is-princess (Character) Bool)
(declare-fun has-power (Character Power) Bool)

; 3. Declare Constants
(declare-const Disney Company)
(declare-const Elsa Character)
(declare-const Ice Power)
(declare-const candidate Character)

; 4. Assert Knowledge Base (Facts about the world)
; Fact: Elsa is a character associated with Disney
(assert (belongs-to Elsa Disney))
; Fact: Elsa is considered a princess (in the context of the question)
(assert (is-princess Elsa))
; Fact: Elsa has ice powers
(assert (has-power Elsa Ice))

; 5. Assert Verification Scenario (The Question)
; Question: Does there exist a character who is Disney + Princess + Ice?
; We assert these properties on our 'candidate' witness.
; If the KB is consistent with this candidate (e.g., candidate = Elsa), result is 'sat'.
(assert (belongs-to candidate Disney))
(assert (is-princess candidate))
(assert (has-power candidate Ice))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model (To see the witness, e.g., candidate = Elsa)
(get-model)