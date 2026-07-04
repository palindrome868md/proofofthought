; ==============================================================================
; Reasoning Steps:
; ==============================================================================
; 1. Analyze Question: 
;    - Query: "Will a power of attorney still be valid after my grandfather dies?"
;    - Context: Grandfather appointed user as financial attorney. Grandfather is terminally ill.
;
; 2. Scan Document for Relevant Rules:
;    - Search keywords: "death", "dies", "valid", "ends".
;    - Locate Section: "Stop acting as an attorney".
;    - Extract Rule: "The lasting power of attorney (LPA) ends when the donor dies."
;
; 3. Logical Deduction:
;    - Premise 1: The document states that an LPA ends when the donor dies.
;    - Premise 2: If a legal instrument "ends", it is no longer valid.
;    - Conclusion: The LPA is NOT valid after the donor (grandfather) dies.
;
; 4. SMT-LIB 2.0 Modeling Strategy:
;    - Define a sort 'LPA' to represent the Power of Attorney.
;    - Define a function 'ends-at-death' to capture the document rule.
;    - Define a function 'valid-after-death' to capture the query property.
;    - Assert the document rule as a universal axiom.
;    - Assert the logical constraint linking 'ends' to 'not valid'.
;    - Test the query by asserting 'valid-after-death' and checking satisfiability.
;    - Expected Result: 'unsat' (indicating the query proposition is False).
; ==============================================================================

; 1. Declare Sorts
(declare-sort LPA 0)

; 2. Declare Functions
; Predicate: Does the LPA end when the donor dies?
(declare-fun ends-at-death (LPA) Bool)
; Predicate: Is the LPA valid after the donor dies?
(declare-fun valid-after-death (LPA) Bool)

; 3. Declare Constants
; Representing the specific LPA appointed by the grandfather
(declare-const grandfather-lpa LPA)

; 4. Assert Knowledge Base (Facts from Document)
; Rule: "The lasting power of attorney (LPA) ends when the donor dies."
(assert (forall ((l LPA)) (ends-at-death l)))

; Logical Constraint: If an LPA ends at death, it cannot be valid after death.
(assert (forall ((l LPA)) 
  (=> (ends-at-death l) (not (valid-after-death l)))))

; 5. Verification Question
; Question: "Will a power of attorney still be valid after my grandfather dies?"
; We assert the positive claim to test if it is consistent with the knowledge base.
(assert (valid-after-death grandfather-lpa))

; 6. Check Satisfiability
(check-sat)
; Expected Output: unsat
; Interpretation: The claim "valid after death" contradicts the knowledge base.
; Therefore, the answer to the question is NO.

; 7. Get Model (Optional for unsat, but included per instructions)
(get-model)